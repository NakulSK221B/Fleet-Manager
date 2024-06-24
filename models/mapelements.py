from parameter import DB_CONFIG
from .SQLbridge import SQL_Query
# from SQLbridge import SQL_Query
  
class Mapelements():
     def __init__(self,id):
        self.id=id
        self.latitude=0.0
        self.longitude=0.0
        self.fetchdata()

class Robot(Mapelements,SQL_Query):
    def fetchdata(self):
        self.data=self.select_one(f'SELECT Robot_id, Latitude, Longitude,charge_electronics_battery,charge_motor_battery FROM Robot_Info WHERE Robot_id= \'{self.id}\';')
        if self.data:
                self.latitude=float(self.data[1])
                self.longitude=float(self.data[2])
                self.electronics_battery=int(self.data[3])
                self.motor_battery=int(self.data[4])
                return (self.data)
        return None  
    
class Landmark(Mapelements,SQL_Query):
    def fetchdata(self):
        self.data=self.select_one(f'SELECT Coordinate_id, Robot_id, Latitude, Longitude FROM Landmark_coordinates WHERE Coordinate_id= \'{self.id}\';')
        if self.data:
            self.assigned_to=str(self.data[1])
            self.latitude=float(self.data[2])
            self.longitude=float(self.data[3])
            return self.data
        return None
     
        
# r1=Robot('Robot1')
# print(r1.fetchrobotdata())
# l1=Landmark('Landmark1')
# print(l1.fetchlandmarkinfo())