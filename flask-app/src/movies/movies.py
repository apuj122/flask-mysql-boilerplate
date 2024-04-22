from flask import Blueprint, request, jsonify, make_response, Flask
from src import db

movies = Blueprint('movies', __name__)

# Get all movies
@movies.route('/movies', methods=['GET'])
def get_all_movies():
    cursor = db.get_db().cursor()
    cursor.execute('SELECT * FROM Movies')
    row_headers = [x[0] for x in cursor.description]
    movies = cursor.fetchall()
    json_data = [dict(zip(row_headers, movie)) for movie in movies]
    return make_response(jsonify(json_data), 200)

# Get a single movie by movie_id
@movies.route('/movies/<int:movie_id>', methods=['GET'])
def get_movie(movie_id):
    cursor = db.get_db().cursor()
    cursor.execute('SELECT * FROM Movies WHERE movie_id = %s', (movie_id,))
    row_headers = [x[0] for x in cursor.description]
    movie = cursor.fetchone()
    if movie:
        return make_response(jsonify(dict(zip(row_headers, movie))), 200)
    else:
        return make_response(jsonify({"error": "Movie not found"}), 404)

# Create a new movie
@movies.route('/movies', methods=['POST'])
def create_movie():
    data = request.get_json()
    cursor = db.get_db().cursor()
    cursor.execute('INSERT INTO Movies (title, description, director, duration) VALUES (%s, %s, %s, %s)',
                   (data['title'], data['description'], data['director'], data['duration']))
    db.get_db().commit()
    return make_response(jsonify({"message": "Movie created successfully"}), 201)

# Update a movie
@movies.route('/movies/<int:movie_id>', methods=['PUT'])
def update_movie(movie_id):
    data = request.get_json()
    cursor = db.get_db().cursor()
    cursor.execute('UPDATE Movies SET title = %s, description = %s, director = %s, duration = %s WHERE movie_id = %s',
                   (data['title'], data['description'], data['director'], data['duration'], movie_id))
    db.get_db().commit()
    return make_response(jsonify({"message": "Movie updated successfully"}), 200)

# Delete a movie
@movies.route('/movies/<int:movie_id>', methods=['DELETE'])
def delete_movie(movie_id):
    cursor = db.get_db().cursor()
    cursor.execute('DELETE FROM Movies WHERE movie_id = %s', (movie_id,))
    db.get_db().commit()
    return make_response(jsonify({"message": "Movie deleted successfully"}), 200)
