from flask import Blueprint
from flask_restful import Api
from resources.login import Login
from resources.Register import Register
from resources.journal import JournalEntry

api_bp = Blueprint('api', __name__)
api = Api(api_bp)

# Route
api.add_resource(Register, '/register')

api.add_resource(Login, '/login')

api.add_resource(JournalEntry, '/journal')