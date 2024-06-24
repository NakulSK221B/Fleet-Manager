from parameter import DB_CONFIG
from math import radians, sin, cos, sqrt, atan2
from datetime import timedelta
from .SQLbridge import SQL_Query
from .mapelements import Robot,Landmark
# from SQLbridge import SQL_Query
# from mapelements import Robot,Landmark

class System(SQL_Query):

    def __init__(self):
        self.initialize_system()

    def initialize_system(self):
        self.robot_objs = []
        self.landmark_objs = []
        self.initialize_lists()
        # self.list_of_landmarks=self.fetch_no_of_landmarks()
        # self.list_of_robots=self.fetch_no_of_robots()
        for robot_id in self.list_of_robots:
            globals()[robot_id] = Robot(robot_id)
            self.robot_objs.append(globals()[robot_id])
        for landmark_id in self.list_of_landmarks:
            globals()[landmark_id] = Landmark(landmark_id)
            self.landmark_objs.append(globals()[landmark_id])
    
    def initialize_lists(self):
        self.list_of_landmarks=self.fetch_no_of_landmarks()
        self.list_of_robots=self.fetch_no_of_robots()

    def fetch_robot_data_for(self,robot_id):
         if globals()[robot_id] in self.robot_objs and isinstance(globals()[robot_id], Robot):
            robot_status_data = globals()[robot_id].fetchdata()
            return robot_status_data
         else:
            return None
         
    def fetch_landmark_data_for(self,landmark_id):
         if globals()[landmark_id] in self.landmark_objs and isinstance(globals()[landmark_id], Landmark):
            landmark_data = globals()[landmark_id].fetchdata()
            return landmark_data
         else:
            return None
    
    def fetch_no_of_robots(self):
        robot_data=self.select_all(f'SELECT Robot_id FROM Robot_Info')
        if robot_data:
                robot_ids=()
                for robot_id in robot_data:
                    robot_ids+=(robot_id[0],)
                return robot_ids
        return None 
    
    def fetch_no_of_landmarks(self):
        landmark_data = self.select_all(f'SELECT Coordinate_id FROM Landmark_coordinates')
        if landmark_data:
                landmarks=()
                for landmark_id in landmark_data:
                    landmarks+=(landmark_id[0],)
                return (landmarks)
        return None
    
    def fetch_robots_info(self):
        robot_data=self.select_all('SELECT Robot_id, Latitude, Longitude,charge_electronics_battery,charge_motor_battery FROM Robot_Info')
        if robot_data:
            return (robot_data)
        else:
            return None

    def fetch_landmark_info(self):
        landmark_data=self.select_all('SELECT Coordinate_id, Robot_id, Latitude, Longitude FROM Landmark_coordinates')
        if landmark_data:
            return (landmark_data)
        else:
            return None
    
    def fetchcurrenttasks(self):
        task_data=self.select_all('SELECT Employee_ID, Robot_id, charge_electronics_battery, charge_motor_battery, current_latitude, current_longitude, destination, additional_description, time_stamp FROM Current_tasks')
        if task_data:
                return task_data
        return None
    
    def fetchemployeelog(self):
        employee_log=self.select_all('SELECT event_description, time_stamp FROM Employee_log ORDER BY time_stamp DESC') #Fetching the latett  entries from Employee Log table
        if employee_log:
                return employee_log
        return None
    
    def fetchemployeeids(self):
        employee_ids=self.select_all('SELECT Employee_ID FROM Employee_Info') #Fetching the IDS from Employee info table
        if employee_ids:
                return employee_ids
        return None
    
    def fetchbasecoordinates(self):
        base_coordiantes=self.select_one('SELECT Latitude, Longitude FROM Base_station_coordinates WHERE Entry_id = 1 ')
        if base_coordiantes:
                # print(robotid,base_coordiantes)
                return {
                'latitude': float(base_coordiantes[0]),
                'longitude': float(base_coordiantes[1])
                }
        return None
        
    def determinebestcandidate(self,landmark_id):
        print(landmark_id)
        if globals()[landmark_id] in self.landmark_objs:
            landmark_obj=globals()[landmark_id]
            min_distance = float('inf')  # Initialize min_distance with infinity
            closest_robot = None  # Initialize closest_robot to None
            print(landmark_obj.id, landmark_obj.latitude, landmark_obj.longitude)
            # print(self.list_of_robots)
            for robot in self.robot_objs:
                    print(robot.id, robot.latitude,robot.longitude)
                    print("----"+str(robot.id)+"----")
                    distance = self.calculate_distance(landmark_obj.latitude, landmark_obj.longitude, robot.latitude, robot.longitude)
                    motor_uptime, electronics_uptime=self.fetch1percentuptime(robot.id)
                    print("Electronics Avg Uptime for ",robot.id,": ", electronics_uptime)
                    print("Motor Avg Uptime for ",robot.id,": ", motor_uptime)
                    print(f"Distance from {robot.id}: {distance} meters")
                    if distance < min_distance:
                        motor_battery_consumption = self.calculate_battery_consumption(distance, motor_uptime)
                        print(f"{robot.id} Motor battery consumption for {distance} meters: {motor_battery_consumption}")
                        electronics_battery_consumption = self.calculate_battery_consumption(distance, electronics_uptime)  
                        print(f"{robot.id} Electronics battery consumption for {distance} meters: {electronics_battery_consumption}")
                        if robot.motor_battery >= motor_battery_consumption and robot.electronics_battery >= electronics_battery_consumption:
                            min_distance = distance
                            closest_robot = robot.id
                    print("--------------")
            print(f"\nClosest robot to {landmark_obj.id} is {closest_robot} at a distance of {min_distance} m\n")
            return closest_robot
        else:
            print("Landmark not found.....")
    def calculate_distance(self,lat1, lon1, lat2, lon2):
        R = 6371000.0
        lat1_rad = radians(lat1)
        lon1_rad = radians(lon1)
        lat2_rad = radians(lat2)
        lon2_rad = radians(lon2)
        dlon = lon2_rad - lon1_rad
        dlat = lat2_rad - lat1_rad
        a = sin(dlat / 2)**2 + cos(lat1_rad) * cos(lat2_rad) * sin(dlon / 2)**2
        c = 2 * atan2(sqrt(a), sqrt(1 - a))
        distance = R * c
        return distance
    
    def calculate_battery_consumption(self,distance, consumption_rate):
    # Calculate battery consumption for the given distance
        consumption_rate_per_second=1/consumption_rate.total_seconds()
        speed_meters_per_second=1.0
        battery_consumption_per_meter=consumption_rate_per_second/speed_meters_per_second
        battery_consumption = battery_consumption_per_meter * distance
        return battery_consumption

    def fetch1percentuptime(self,robotid):
        results = self.fetchall_proc('GetLatestUptime1Percent',(robotid,))
        motor_result = results[0][0]
        electronics_result=results[0][1]
        if motor_result and electronics_result:
            return[motor_result,electronics_result]
        else:
            return None 
    def getsystemlogs(self,table_name,value):
        if table_name=="employee_log":
            log_table=self.select_all_withhead('SELECT * FROM '+table_name+' WHERE employee_id = '+value)
        else:
            log_table = self.select_all_withhead("SELECT * FROM " + table_name + " WHERE robot_id = '" + value + "'")
        
        if log_table:
             formatted_logs = (log_table[0], 
                                [[
                                    val.total_seconds() if isinstance(val, timedelta) else val
                                    for val in row
                                ] for row in log_table[1]]
                            )
             return formatted_logs
        else:
             return None


# s1=System()
# s1.getsystemlogs("Robot_Log","Robot3")
# print(s1.robot_objs)
# print(s1.landmark_objs)
# for globals()['Landmark3'] in s1.landmark_objs:
#     # print(globals()['Landmark3'].id, globals()['Landmark3'].latitude, globals()['Landmark3'].longitude)
#     print('Presnt')
#     landmark=globals()['Landmark3']
#     print(landmark.id, landmark.latitude, landmark.longitude)
# else:
#     print('Absnent...')
# # print(s1.fetchcurrenttasks())
# print("Number of robots available are : ", s1.list_of_robots)
# print("\n")
# print("Number of landmarks available are : ", s1.list_of_landmarks)
# s1.determinebestcandidate('Landmark1',s1)
# print(s1.fetchemployeelog())