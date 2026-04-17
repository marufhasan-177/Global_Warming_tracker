from flask import Flask, render_template, request, redirect, url_for
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

# Call the templates using this methods......

@app.route('/')
def login_page():
    return render_template('login.html')

@app.route('/user')
def user_dashboard():
    return render_template('user_dashboard.html')

@app.route('/admin')
def admin_panel():
    return render_template('admin_panel.html')


#log in function for admin and users......

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
        if role == 'user':
            return redirect(url_for('user_dashboard'))
        else:
            return redirect(url_for('admin_panel'))
    else:
        return "Invalied user name or password!", render_template('login.html')



@app.route('/create', methods=['POST'])
def createAccount():
    username = request.form['username']
    password = request.form['password']

    conn = get_connection()
    cursor = conn.cursor()

    query = "CALL createAccount(%s, %s)"
    cursor.execute(query, (username, password))
    conn.commit()

    return render_template('login.html')


@app.route('/search', methods=['POST'])
def search():
    country = request.form['country']
    data_type = request.form['data_type']

    conn = get_connection()
    cursor = conn.cursor()

    if data_type == "temp":
        query = "CALL get_temp_info(%s)"
    elif data_type == "sea":
        query = "CALL get_sea_info(%s)"
    elif data_type == "carbon":
        query = "CALL get_carbon_info(%s)"

    cursor.execute(query, (country,))
    result = cursor.fetchall()

    return render_template('user_dashboard.html', data=result)

if __name__ == '__main__':
    app.run(debug=True)