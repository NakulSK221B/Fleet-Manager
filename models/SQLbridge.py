from parameter import DB_CONFIG
import pymysql

class SQL_Query():

    def cursor_connect(self):
        self.db = pymysql.connect(**DB_CONFIG)
        self.cursor = self.db.cursor()
    
    def cursor_disconnect(self):
        self.cursor.close()
        self.db.commit()
    
    def cursor_commit(self):
        self.cursor.connection.commit()
        self.db.commit()

    def select_all(self,query):
        try:
            self.cursor_connect()
            self.cursor.execute(query)
            result = self.cursor.fetchall()
            self.cursor_disconnect()
            return result
        except Exception as e:
            print(f"An error occurred: {e}")
            # Optionally, handle the error, log it, or re-raise it
            return None

    def select_all_withhead(self,query):
        try:
            self.cursor_connect()
            self.cursor.execute(query)
            result = self.cursor.fetchall()
            column_names = [desc[0] for desc in self.cursor.description]
            self.cursor_disconnect()
            return column_names,result
        except Exception as e:
            print(f"An error occurred: {e}")
            # Optionally, handle the error, log it, or re-raise it
            return None
           
    
    def select_one(self,query):
        try:
            self.cursor_connect()
            self.cursor.execute(query)
            result = self.cursor.fetchone()
            self.cursor_disconnect()
            return result
        except Exception as e:
            print(f"An error occurred: {e}")
            # Optionally, handle the error, log it, or re-raise it
            return None
    
    def fetchall_proc(self, procname, parameters=()):
        self.cursor_connect()
        self.cursor.callproc(procname,parameters)
        results = self.cursor.fetchall()
        self.cursor_disconnect()
        if results:
            return results
        else:
            return None

    def execute_query(self, query, parameters=(), commit=True):
        """ Execute a SQL Query with given parameters and optionally commits changes to database"""
        self.cursor_connect()
        try:
            self.cursor.execute(query,parameters)
            if commit==True:
                self.cursor_commit()
            self.cursor_disconnect()
        except:
            # Rollback in case of an error
            self.cursor.connection.rollback()
            return f"Error: {str(e)}"
    
    

# id='Landmark1'
# query=f'UPDATE Robot_info SET Latitude = 15.3694 WHERE Entry_id = 3;'
# db=SQL_Query()

