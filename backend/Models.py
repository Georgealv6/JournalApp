from flask import Flask
from marshmallow import Schema, fields, pre_load, validate
from flask_marshmallow import Marshmallow
from flask_sqlalchemy import SQLAlchemy


ma = Marshmallow()
db = SQLAlchemy()

class User(db.Model):
    __tablename__ = 'users'

    id = db.Column(db.Integer(), primary_key=True)
    username = db.Column(db.String(), unique=True)
    password = db.Column(db.String())
    emailaddress = db.Column(db.String())
    api_key = db.Column(db.String())

    def __init__(self, api_key, emailaddress, password, username):
        self.api_key = api_key
        self.emailaddress = emailaddress
        self.password = password
        self.username = username

    def __repr__(self):
        return '<id {}>'.format(self.id)

    def serialize(self):
        return {
            'api_key' : self.api_key,
            'id' : self.id,
            'username' : self.username,
            'password' : self.password,
            'emailaddress' : self.emailaddress,
        }

class Journal(db.Model):
    __tablename__ = 'journal'

    id = db.Column(db.Integer(), primary_key=True)
    user_id = db.Column(db.Integer(), db.ForeignKey('users.id'))
    entry = db.Column(db.String())
    note = db.Column(db.String())
    completed = db.Column(db.Boolean(), default=False, nullable=False)

    def __init__(self, user_id, entry, note, completed):
        self.user_id = user_id
        self.entry = entry
        self.note = note
        self.completed = completed

    def __repr__(self):
        return '<id {}>'.format(self.id)

    def serialize(self):
        return {
            'user_id' : self.user_id,
            'id' : self.id,
            'entry' : self.entry,
            'note' : self.note,
            'completed' : self.completed,
        }