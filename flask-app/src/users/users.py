from flask import Blueprint, request, jsonify, make_response
from src import db

users = Blueprint('users', __name__)

# Get all users
@users.route('/users', methods=['GET'])
def get_all_users():
    cursor = db.get_db().cursor()
    cursor.execute('SELECT * FROM Users')
    row_headers = [x[0] for x in cursor.description]
    users = cursor.fetchall()
    json_data = [dict(zip(row_headers, user)) for user in users]
    return make_response(jsonify(json_data), 200)

# Get a single user by user_id
@users.route('/users/<int:user_id>', methods=['GET'])
def get_user(user_id):
    cursor = db.get_db().cursor()
    cursor.execute('SELECT * FROM Users WHERE user_id = %s', (user_id,))
    row_headers = [x[0] for x in cursor.description]
    user = cursor.fetchone()
    if user:
        return make_response(jsonify(dict(zip(row_headers, user))), 200)
    else:
        return make_response(jsonify({"error": "User not found"}), 404)

# Create a new user
@users.route('/users', methods=['POST'])
def create_user():
    data = request.get_json()
    cursor = db.get_db().cursor()
    cursor.execute('INSERT INTO Users (pass, first_name, last_name, email_address, location, phone, preferences) VALUES (%s, %s, %s, %s, %s, %s, %s)',
                   (data['pass'], data['first_name'], data['last_name'], data['email_address'], data['location'], data['phone'], data['preferences']))
    db.get_db().commit()
    return make_response(jsonify({"message": "User created successfully"}), 201)

# Update user details
@users.route('/users/<int:user_id>', methods=['PUT'])
def update_user(user_id):
    data = request.get_json()
    cursor = db.get_db().cursor()
    cursor.execute('UPDATE Users SET pass = %s, first_name = %s, last_name = %s, email_address = %s, location = %s, phone = %s, preferences = %s WHERE user_id = %s',
                   (data['pass'], data['first_name'], data['last_name'], data['email_address'], data['location'], data['phone'], data['preferences'], user_id))
    db.get_db().commit()
    return make_response(jsonify({"message": "User updated successfully"}), 200)

# Delete a user
@users.route('/users/<int:user_id>', methods=['DELETE'])
def delete_user(user_id):
    cursor = db.get_db().cursor()
    cursor.execute('DELETE FROM Users WHERE user_id = %s', (user_id,))
    db.get_db().commit()
    return make_response(jsonify({"message": "User deleted successfully"}), 200)

# Get users with a specific preference
@users.route('/users/preferences/<preference>', methods=['GET'])
def get_users_by_preference(preference):
    cursor = db.get_db().cursor()
    query = "SELECT * FROM Users WHERE preferences LIKE %s"
    cursor.execute(query, ('%' + preference + '%',))
    row_headers = [x[0] for x in cursor.description]
    users = cursor.fetchall()
    json_data = [dict(zip(row_headers, user)) for user in users]
    return make_response(jsonify(json_data), 200)
