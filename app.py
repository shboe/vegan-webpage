from flask import Flask, render_template, request, redirect, url_for
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

        # self.__port = 8889

        self.__con = mysql.connector.connect(
            host = self.__host,
            user = self.__user,
            password = self.__password,
            db = self.__db,

            # port = self.__port

        )
    #method
    #db接続＆全件抽出
    def selectAll(self, sql_query=None):
        if sql_query is None:
            sql = 'SELECT * FROM ' + self.__table + ';'
        else:
            sql = sql_query
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

#redirect #################################################
@app.route('/')
def route():
    return redirect(url_for('index'))
#############################################################

#home page ################################################
@app.route('/homepage')
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
        
# detail page #######################
@app.route('/detail/<scode>', methods=["GET"])
def detail(scode):
    sql = "SCODE = '" + scode + "';"
    try:
        dbop= DbOP("products")
        result = dbop.selectEx(sql)
        dbop.close()
        return render_template('detail.html',result=result)
    except mysql.connector.errors.ProgrammingError as e:
        print('***DB接続エラー****')
        print(type(e))
        print(e)
    
    except Exception as e:
        print('****システム運行プログラムエラー****')
        print(type(e))
        print(e)
        
##############################################################

# barcode-input ############################################################
@app.route('/barcode', methods=["GET", "POST"])
def barcode():
    return render_template('barcode-input.html')
#########################################################################

# input button ##########################################################
@app.route('/input', methods=["GET", "POST"])
def submit():
    if request.method == 'POST':
        inputted_text = request.form['user_text']
        if not inputted_text:
            error_message = "バーコードの番号を入力してください"
            return render_template('barcode-input.html', user_text='', error_message=error_message)
        try:
            dbop = DbOP("products")
            result = dbop.selectEx("SCODE = '" + inputted_text + "'")
            dbop.close()
            return redirect(url_for('detail', scode=inputted_text))
        except IndexError:
            error_message = "入力された番号はデータベースに存在していません。"
            return render_template('barcode-input.html', user_text='', error_message=error_message)
    return redirect(url_for('barcode'))
############################################################################
#filter function
@app.route('/run_query', methods=['POST'])
def run_query():
    selected_store = request.form.get('store')
    selected_category = request.form.get('category')
    sql = "SELECT * FROM products WHERE 1=1"

    if selected_store:
        sql += " AND store LIKE '{}%'".format(selected_store[0])
    if selected_category:
        sql += " AND vegan LIKE '{}%'".format(selected_category[0])

    print(sql)
    print(selected_category)
    print(selected_store)
    try:
        dbop = DbOP("products")
        result = dbop.selectAll(sql)
        dbop.close()
        if result is None:
            result = []
        return render_template('product-list.html', result=result, selected_store=selected_store, selected_category=selected_category)
    except mysql.connector.errors.ProgrammingError as e:
        print('***DB接続エラー****')
        print(type(e))
        print(e)
    except Exception as e:
        print('****システム運行プログラムエラー****')
        print(type(e))
        print(e)
#########################################################################

if __name__ == '__main__':
    app.run(host='localhost', port=5001, debug=True)
