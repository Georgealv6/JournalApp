from flask_restful import Resource
from flask import request
from Models import db, User, Journal


class JournalEntry(Resource):
    def post(self):
        header = request.headers["Authorization"]
        json_data = request.get_json(force=True)

        if not header:
            return {"Message": "No api key"}, 400
        else:
            user = User.query.filter_by(api_key=header).first()
            if user:
                journal = Journal(
                    user_id = user.id,
                    entry = json_data['entry'],
                    note = json_data['note'],
                    completed = json_data['completed'],
                )
                db.session.add(journal)
                db.session.commit()

                result = Journal.serialize(journal)

                return {"status": 'success', 'data': result}, 201   
            else:
                return {"Message": "No user with api key"}, 402  


    def get(self):
        result = []
        header = request.headers["Authorization"]

        if not header:
            return {"Message": "No api key"}, 400
        else:
            user = User.query.filter_by(api_key=header).first()
            if user :
                entry = Journal.query.filter_by(user_id=user.id).all()
                for entries in entry:
                    result.append(Journal.serialize(entries))

            return {"status": 'success', 'data': result}, 201       
