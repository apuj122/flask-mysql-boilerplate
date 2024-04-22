from flask import Blueprint, request, jsonify, make_response
from src import db

theaters = Blueprint('theaters', __name__)

# Get all theaters
@theaters.route('/theaters', methods=['GET'])
def get_all_theaters():
    cursor = db.get_db().cursor()
    cursor.execute('SELECT * FROM Theaters')
    row_headers = [x[0] for x in cursor.description]
    theaters = cursor.fetchall()
    json_data = [dict(zip(row_headers, theater)) for theater in theaters]
    return make_response(jsonify(json_data), 200)

# Get a single theater by theater_id
@theaters.route('/theaters/<int:theater_id>', methods=['GET'])
def get_theater(theater_id):
    cursor = db.get_db().cursor()
    cursor.execute('SELECT * FROM Theaters WHERE theater_id = %s', (theater_id,))
    row_headers = [x[0] for x in cursor.description]
    theater = cursor.fetchone()
    if theater:
        return make_response(jsonify(dict(zip(row_headers, theater))), 200)
    else:
        return make_response(jsonify({"error": "Theater not found"}), 404)

# Create a new theater
@theaters.route('/theaters', methods=['POST'])
def create_theater():
    data = request.get_json()
    cursor = db.get_db().cursor()
    cursor.execute('INSERT INTO Theaters (name, location, capacity) VALUES (%s, %s, %s)',
                   (data['name'], data['location'], data['capacity']))
    db.get_db().commit()
    return make_response(jsonify({"message": "Theater created successfully"}), 201)

# Update a theater
@theaters.route('/theaters/<int:theater_id>', methods=['PUT'])
def update_theater(theater_id):
    data = request.get_json()
    cursor = db.get_db().cursor()
    cursor.execute('UPDATE Theaters SET name = %s, location = %s, capacity = %s WHERE theater_id = %s',
                   (data['name'], data['location'], data['capacity'], theater_id))
    db.get_db().commit()
    return make_response(jsonify({"message": "Theater updated successfully"}), 200)

# Delete a theater
@theaters.route('/theaters/<int:theater_id>', methods=['DELETE'])
def delete_theater(theater_id):
    cursor = db.get_db().cursor()
    cursor.execute('DELETE FROM Theaters WHERE theater_id = %s', (theater_id,))
    db.get_db().commit()
    return make_response(jsonify({"message": "Theater deleted successfully"}), 200)
