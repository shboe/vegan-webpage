from flask import Flask, render_template
import mysql.connector


app = Flask(__name__)

# Establish MySQL connection
db = mysql.connector.connect(
    host="", #your_mysql_host
    user="", #your_mysql_user
    password="", #your_mysql_password
    database="" #your_mysql_database
)

cursor = db.cursor()


@app.route('/')
def index():
    return render_template('homepage.html')






if __name__ == '__main__':
    app.run(host='localhost', port=5000, debug=True)
