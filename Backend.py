from flask import Flask, request, jsonify
from flask_pymongo import PyMongo
from flask_cors import CORS
import requests
import base64
import bcrypt

app = Flask(__name__)
CORS(app)
app.config["MONGO_URI"] = "mongodb+srv://mightguy72000:Mightguy%40123@cluster0.p7ukxu5.mongodb.net/Visual_Aid"
mongo = PyMongo(app)

API_URL = "https://api-inference.huggingface.co/models/Salesforce/blip-image-captioning-large"
HEADERS = {"Authorization": "Bearer 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"}

def query_model(image_data):
    response = requests.post(API_URL, headers=HEADERS, data=image_data)
    response.raise_for_status()  # Raise an error on bad response
    return response.json()

@app.route('/')
def home():
    return "Welcome to the Flask MongoDB app!"

@app.route('/caption', methods=['POST'])
def get_image_caption():
    try:
        if 'image' not in request.files:
            return jsonify({'error': 'No image file provided. Make sure to include an image file in the request.'}), 400

        image_file = request.files['image']
        image_file.seek(0)

        image_content = image_file.read()
        if not image_content:
            return jsonify({'error': 'The provided image file is empty.'}), 400

        image_base64 = base64.b64encode(image_content).decode('utf-8')
        result = query_model(image_content)
        caption = result[0]["generated_text"]

        mongo.db.conversation.insert_one({"image_file": image_base64, "caption": caption})
        return jsonify({"caption": caption})

    except requests.RequestException as req_err:
        return jsonify({'error': f'Error querying the model: {str(req_err)}'}), 500
    except Exception as e:
        return jsonify({'error': f'Error processing request: {str(e)}'}), 500

@app.route('/conversations', methods=['GET'])
def send_conversations():
    try:
        data = list(mongo.db.conversation.find({}, {'_id': 0}))
        return jsonify(data)
    except Exception as e:
        return jsonify({'error': f'Error fetching data from database: {str(e)}'}), 500

@app.route('/login', methods=['POST'])
def login_verification():
    try:
        data = request.get_json()
        username = data.get("username")
        password = data.get("password")
        user_data = mongo.db.users.find_one({"username": username}, {'_id': 0})

        if not user_data:
            return jsonify({'error': 'User not found'}), 404

        if bcrypt.checkpw(password.encode('utf-8'), user_data['password']):
            return jsonify({"message": "Login successful"}), 200
        else:
            return jsonify({"error": "Invalid username or password"}), 401

    except Exception as e:
        return jsonify({'error': f'Error during login: {str(e)}'}), 500

@app.route('/signup', methods=['POST'])
def signup():
    try:
        data = request.get_json()
        username = data.get("username")
        password = data.get("password")

        if not username or not password:
            return jsonify({"error": "Username and password are required"}), 400

        if mongo.db.users.find_one({"username": username}):
            return jsonify({"error": "Username already exists"}), 400

            # Hash the password
        hashed_password = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt())

        mongo.db.users.insert_one({"username": username, "password": hashed_password})
        return jsonify({"message": "New user created"}), 201

    except Exception as e:
        return jsonify({"error": f"Error while creating a user: {str(e)}"}), 500

if __name__ == '__main__':
    app.run(debug=True)
