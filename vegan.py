from flask import Flask, render_template, request
import mysql.connector


app = Flask(__name__)

# Establish MySQL connection
class DbOP:
    def __init__(self, table):
        self.__host = "#" #mysql host
        self.__user = "#" # mysql user
        self.__password = "#" #mysql password
        self.__db = "#" #mysql database
        self.__table = table
        self.__con = mysql.connector.connect(
            host=self.__host,
            user=self.__user,
            password=self.__password,
            db=self.__db
        )


@app.route('/')
def index():
    return render_template('homepage.html')

# Define route to handle barcode search 
@app.route('/barcode-input', methods=['POST'])
def search():
    barcode = request.form['scode']
    dbop = DbOP("#")  #SQL Table
    product = dbop.selectEx(f"barcode = '{barcode}'")
    dbop.close()
    if product:
        return render_template('result.html', product=product)
    else:
        return "Product not found!" #change to an error under the barcode-input



if __name__ == '__main__':
    app.run(host='localhost', port=5000, debug=True)
