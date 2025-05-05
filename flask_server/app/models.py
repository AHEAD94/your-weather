from . import db


class Weather(db.Model):
    id = db.Column(db.String(120), primary_key=True)
    date = db.Column(db.String(120), nullable=False)
    time = db.Column(db.String(120), nullable=False)
    city = db.Column(db.String(120), nullable=False)
    temperature = db.Column(db.Double, nullable=False)
    description = db.Column(db.String(120), nullable=False)
    min_temp = db.Column(db.Double, nullable=False)
    max_temp = db.Column(db.Double, nullable=False)
    feels_like = db.Column(db.Double, nullable=False)
    wind = db.Column(db.Double, nullable=False)
    clouds = db.Column(db.Integer, nullable=False)
    humidity = db.Column(db.Integer, nullable=False)
    sunrise = db.Column(db.String(120), nullable=False)
    sunset = db.Column(db.String(120), nullable=False)
    user_rating = db.Column(db.String(120), nullable=False)