from flask import Flask
from pyapp.views.wall import bp as bp_wall


app = Flask(__name__)

app.config.update(
    SECRET_KEY='abc123',
    TEMPLATES_AUTO_RELOAD=True
)

app.register_blueprint(bp_wall)
