from flask import request, jsonify, Blueprint, render_template
from .models import Weather, db

bp = Blueprint('weather', __name__)


# 기본 라우트("/") 설정
@bp.route("/")
def home():
    return render_template('index.html')


@bp.route('/weather', methods=['POST'])
def add_weather():
    data = request.get_json()
    new_weather = Weather(**data)
    db.session.add(new_weather)
    db.session.commit()
    return jsonify({"message": "Weather added!"}), 201


@bp.route('/weather/<string:id>', methods=['GET'])
def get_weather(id):
    weather = Weather.query.get_or_404(id)
    return jsonify({col.name: getattr(weather, col.name) for col in weather.__table__.columns})


@bp.route('/weather', methods=['GET'])
def get_all_weather():
    weather_list = Weather.query.all()  # 모든 날씨 데이터를 조회
    if not weather_list:
        return jsonify({"message": "No weather data found"}), 404

    # 모든 날씨 데이터를 JSON으로 변환
    weather_data = [
        {col.name: getattr(weather, col.name) for col in weather.__table__.columns}
        for weather in weather_list
    ]
    return jsonify(weather_data)


@bp.route('/weather/<string:id>', methods=['PUT'])
def update_weather(id):
    data = request.get_json()
    weather = Weather.query.get_or_404(id)
    for key, value in data.items():
        setattr(weather, key, value)
    db.session.commit()
    return jsonify({"message": "Weather updated!"})


@bp.route('/weather/<string:id>', methods=['DELETE'])
def delete_weather(id):
    weather = Weather.query.get_or_404(id)
    db.session.delete(weather)
    db.session.commit()
    return jsonify({"message": "Weather deleted!"})


# Route to delete all weather data
@bp.route('/weather/clear', methods=['DELETE'])
def clear_weather():
    try:
        # Delete all records from the Weather table
        db.session.query(Weather).delete()
        db.session.commit()
        return jsonify({'message': 'All weather data has been deleted'}), 200
    except Exception as e:
        db.session.rollback()
        return jsonify({'error': str(e)}), 500
