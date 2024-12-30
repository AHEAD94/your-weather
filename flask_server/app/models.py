from . import db


class Weather(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    city = db.Column(db.String(80), nullable=False)
    temperature = db.Column(db.Float, nullable=False)
    description = db.Column(db.String(120), nullable=False)
    min_temp = db.Column(db.Float, nullable=False)
    max_temp = db.Column(db.Float, nullable=False)
    feels_like = db.Column(db.Float, nullable=False)
    wind = db.Column(db.Float, nullable=False)
    clouds = db.Column(db.Float, nullable=False)
    humidity = db.Column(db.Float, nullable=False)
    sunrise = db.Column(db.String(120), nullable=False)
    sunset = db.Column(db.String(120), nullable=False)