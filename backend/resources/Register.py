from flask_restful import Resource
from flask import request
from Model import db, User
import random
import string

class Register(Resource):
    def get(self):
        users = User.query.all()
        user_list = []
        for i in range(0, len(users)):
            user_list.append(users[i].serialize())
        return { "status" : str(user_list)}, 200

    def post(self):
        json_data = request.get_json(force=True)

        if not json_data:
            return{ 'message': 'User already exist,'}, 400
    
        user = User.query.filter_by(username=json_data['username']).first()
        if user:
            return{ 'message': 'User with the same username already exists'}, 400

        user = User.query.filter_by(emailaddress=json_data['emailaddress']).first()
        if user:
            return{ 'message': 'User with the same e-mail already exists'}, 400    

        api_key = self.generate_key()

        user = User.query.filter_by(api_key=api_key).first()
        if user:
            return{'message': 'API key already exists'}, 400

        user = User(
            api_key = api_key,
            emailaddress = json_data['emailaddress'],
            password = json_data['password'],
            username = json_data['username'],
        )
        db.session.add(user)
        db.session.commit()
        
        result = User.serialize(user)

        return{ "status": 'success', 'data': result}, 201
    
    def generate_key(length):
        return ''.join(random.choice(string.ascii_letters + string.digits) for _ in range(50))    