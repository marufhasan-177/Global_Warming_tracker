import mysql.connector

# Database connection function
def get_connection():
    return mysql.connector.connect(
        host="localhost",
        user="root",
        password="",
        database="data_db"
    )


def user_login():
    conn = get_connection()
    cursor = conn.cursor()

    username = input("Enter username: ")

    # Check username and position
    query = "SELECT pass FROM users WHERE u_name = %s AND position = 'user'"
    cursor.execute(query, (username,))
    result = cursor.fetchone()

    if result:
        db_password = result[0]
        password = input("Enter password: ")

        if password == db_password:
            print("Login Successful ✅")
            user_home(username)
            
        else:
            print("Wrong Password ❌ '\n Please try again....")
            main()
    else:
        print("User not found or not a user ❌ /n Please try again.....")
        main()

    cursor.close()
    conn.close()


def admin_login():
    conn = get_connection()
    cursor = conn.cursor()

    username = input("Enter admin username: ")

    # Check username and position = admin
    query = "SELECT pass FROM users WHERE u_name = %s AND position = 'admin'"
    cursor.execute(query, (username,))
    result = cursor.fetchone()

    if result:
        db_password = result[0]
        password = input("Enter password: ")

        if password == db_password:
            print("Admin Login Successful ✅")
        else:
            print("Wrong Password ❌")
    else:
        print("Admin not found ❌")

    cursor.close()
    conn.close()


def user_home(myname):
    print ('Welcome to the user dashboard',myname)



def admin_home():
    print('This is admin home page...!')


# Main menu
def main():
    print("1. User Login")
    print("2. Admin Login")
    print("3. Option 3")
    print("4. Option 4")
    print("5. Exit")

    choice = input("Enter your choice (1-5): ")

    if choice == '1':
        user_login()
    elif choice == '2':
        admin_login()
    elif choice == '5':
        print("Exiting...")
    else:
        print("Invalid choice")


# Run program
main()