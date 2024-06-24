from parameter import DB_CONFIG
from .SQLbridge import SQL_Query

class Employee(SQL_Query):
    def __init__(self):
        self.credentials_verified='No'

    def check_login(self,employee_id, access_key):
        self.employee_id=employee_id
        self.access_key=access_key
        Login_Status=self.select_one(f"SELECT * FROM Employee_Info where Employee_ID = {str(self.employee_id)} and Access_Key = {str(self.access_key)};")
        if Login_Status!=None:
            self.credentials_verified='Yes'
            self.updateloginstatus(int(self.employee_id),self.credentials_verified)
        else:
            self.credentials_verified='No'
    
    def updateloginstatus(self,employee_id,login_status):
        try:
            print("Updating login status.....")
            print("Employee ID:",employee_id," Login status:",login_status)
            self.cursor_connect()
            self.cursor.execute("UPDATE Employee_Info SET login_status = %s WHERE Employee_ID = %s;", (login_status,employee_id))
            self.cursor_commit()
            print("Login status updated successfully.")
            self.cursor_disconnect()
        except Exception as e:
            print("Error updating login status:", e)

    def logout(self):
        self.credentials_verified='No'
        self.updatelogoutstatus(int(self.employee_id),'No')
    
    def updatelogoutstatus(self,employee_id,login_status):
        try:
            print("Updating logout status.....")
            print("Employee ID:",employee_id," Login status:",login_status)
            self.cursor_connect()
            self.cursor.execute("UPDATE Employee_Info SET login_status = %s WHERE Employee_ID = %s;", (login_status,employee_id))
            self.cursor_commit()
            print("Login status updated successfully.")
            self.cursor_disconnect()
        except Exception as e:
            print("Error updating logout status:", e)

    
class Operator(Employee):  
    def submittask(self,employee_id, robot, landmark, instructions):
        sql = "UPDATE Current_Tasks SET Employee_ID = %s, destination = %s, additional_description = %s WHERE robot_id = %s;"
        values = (employee_id, landmark, instructions, robot)
        self.execute_query(sql,values)
        
# o1=Operator()
# o1.check_login('109','123')
# print(o1.credentials_verified)
# landmarks,robots=o1.initialize_objects()
# print(landmarks)
# print(robots)