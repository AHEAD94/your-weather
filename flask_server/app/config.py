class Config:
    SQLALCHEMY_DATABASE_URI = "postgresql://flask_user:yourpassword@localhost/your-weather"
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    SECRET_KEY = "your-secret-key"
