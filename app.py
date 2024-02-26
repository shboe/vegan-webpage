from flask import Flask, render_template, request
import mysql.connector


app = Flask(__name__)

class DbOP:
    #constructor
    def __init__(self,table):
        self.__host = "localhost"
        self.__user = "py24user"
        self.__password = "py24pass"
        self.__db = "py24db"
        self.__table = table
        self.__con = mysql.connector.connect(
            host = self.__host,
            user = self.__user,
            password = self.__password,
            db = self.__db
        )
    #method
    #db接続＆全件抽出
    def selectAll(self):
        sql = 'SELECT * FROM ' + self.__table +';'
        cur = self.__con.cursor(dictionary=True) #カーソル作成
        cur.execute(sql)#sql発行
        res = cur.fetchall()#select結果全件格納
        cur.close()#カーソルclose
        return res
    def selectPage(self,pgno,cnt):

        sql = 'SELECT * FROM ' + self.__table + ';'
        
        cur = self.__con.cursor(dictionary=True)  
        cur.execute(sql)
        tbl = cur.fetchall()

        pgno = int(pgno)
        cnt = int(cnt)

        sidx = (pgno -1) * cnt #開始添字算出
        eidx = sidx + cnt#終了添字算出

        res = tbl[sidx:eidx]
        cur.close()
        return res
    def selectEx(self,ex):
        sql = 'SELECT * FROM ' + self.__table + ' WHERE ' + ex + ';'
        
        cur = self.__con.cursor(dictionary=True)
        cur.execute(sql)
        res = cur.fetchall()
        cur.close()
        #2次元配列の0行目（一件）のみを返す
        return res[0]
    # DB 接続＆データ件数取得
    def selectCnt(self):

        sql = 'SELECT COUNT(*) AS reccnt FROM ' + self.__table + ';'

        cur = self.__con.cursor(dictionary=True)
        cur.execute(sql)
        res = cur.fetchall()
        cur.close()
        return res[0]
    #DB 接続＆データ挿入
    def insTbl(self,val):
        sql = "INSERT INTO" + self.__table + " VALUES "
        sql += val
        sql += ";"

        cur = self.__con.cursor()
        cur.execute(sql)
        self.__con.commit()
        cur.close()

    #DB切断
    def close(self):
        self.__con.close()

#home page ################################################
@app.route('/')
def index():
    return render_template('homepage.html')
############################################################

#product list page #####################################
@app.route('/list', methods=["GET"])
def list():
    try:
        dbop = DbOP("products")
        result = dbop.selectAll()
        dbop.close()
        #結果出力処理
        return render_template('product-list.html', result=result)
    except mysql.connector.errors.ProgrammingError as e:
        print('***DB接続エラー****')
        print(type(e))
        print(e)
    except Exception as e:
        print('****システム運行プログラムエラー****')
        print(type(e))
        print(e)
########################################################
        



# Define route to handle barcode search 
@app.route('/barcode-input', methods=['POST', 'GET'])
def barcode_input():
    if request.method == 'POST':
        barcode = request.form['barcode']
        dbop = DbOP("products")  # Assuming "products" is the name of your table
        product = dbop.selectEx(f"barcode = '{barcode}'")
        dbop.close()
        if product:
            return render_template('result.html', product=product)
        else:
            error_message = "Product not found!"
            return render_template('barcode-input.html', error_message=error_message)
    else:
        return render_template('barcode-input.html')

    


if __name__ == '__main__':
    app.run(host='localhost', port=5000, debug=True)
