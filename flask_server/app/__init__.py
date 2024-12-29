from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_migrate import Migrate

db = SQLAlchemy()
migrate = Migrate()


def create_app():
    app = Flask(__name__)
    app.config.from_object('app.config.Config')

    # DB 초기화
    db.init_app(app)
    migrate.init_app(app, db)

    # Blueprint 등록
    from .routes import bp
    app.register_blueprint(bp)

    with app.app_context():
        from . import routes
        db.create_all()

    return app
