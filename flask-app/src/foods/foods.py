from flask import Blueprint, request, jsonify, make_response, Flask
from src import db

foods = Blueprint('foods', __name__)

# Get all food items
@foods.route('/foods', methods=['GET'])
def get_all_foods():
    cursor = db.get_db().cursor()
    cursor.execute('SELECT * FROM Foods')
    foods = cursor.fetchall()
    return jsonify(foods)

# Get a single food item by ID
@foods.route('/foods/<int:id>', methods=['GET'])
def get_food(id):
    cursor = db.get_db().cursor()
    cursor.execute('SELECT * FROM Foods WHERE id = %s', (id,))
    food = cursor.fetchone()
    if food:
        return jsonify(food)
    else:
        return make_response(jsonify({"error": "Food item not found"}), 404)

# Create a new food item
@foods.route('/foods', methods=['POST'])
def add_food():
    data = request.get_json()
    name = data['name']
    price = data['price']
    try:
        cursor = db.get_db().cursor()
        cursor.execute('INSERT INTO Foods (name, price) VALUES (%s, %s)', (name, price))
        db.get_db().commit()
        return make_response(jsonify({"message": "Food item added"}), 201)
    except Exception as e:
        return make_response(jsonify({"error": str(e)}), 500)

# Update an existing food item
@foods.route('/foods/<int:id>', methods=['PUT'])
def update_food(id):
    data = request.get_json()
    name = data.get('name')
    price = data.get('price')
    try:
        cursor = db.get_db().cursor()
        cursor.execute('UPDATE Foods SET name = %s, price = %s WHERE id = %s', (name, price, id))
        db.get_db().commit()
        if cursor.rowcount == 0:
            return make_response(jsonify({"error": "Food item not found"}), 404)
        return make_response(jsonify({"message": "Food item updated"}), 200)
    except Exception as e:
        return make_response(jsonify({"error": str(e)}), 500)

# Delete a food item
@foods.route('/foods/<int:id>', methods=['DELETE'])
def delete_food(id):
    try:
        cursor = db.get_db().cursor()
        cursor.execute('DELETE FROM Foods WHERE id = %s', (id,))
        db.get_db().commit()
        if cursor.rowcount == 0:
            return make_response(jsonify({"error": "Food item not found"}), 404)
        return make_response(jsonify({"message": "Food item deleted"}), 200)
    except Exception as e:
        return make_response(jsonify({"error": str(e)}), 500)

