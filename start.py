from flask import Flask, render_template, request
import mysql.connector

app = Flask(__name__, template_folder='temp')

# Database connection
def get_connection():
    return mysql.connector.connect(
        host="localhost",
        user="root",
        password="",
        database="data_db"
    )

@app.route('/')
def login_page():
    return render_template('login.html')

@app.route('/login', methods=['POST'])
def login():
    username = request.form['username']
    password = request.form['password']
    role = request.form['role']

    conn = get_connection()
    cursor = conn.cursor()

    if role =='user':
        query = "Call loginUser(%s,%s)"
    if role == 'admin':
        query = "Call loginAdmin(%s,%s)"
        
    cursor.execute(query, (username, password))

    result = cursor.fetchone()

    if result:
        return "Logged in successfully!"
    else:
        return "Invalid username or password"

if __name__ == '__main__':
    app.run(debug=True)