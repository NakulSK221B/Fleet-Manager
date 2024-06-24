from flask import Flask, render_template, request, redirect, url_for, session,jsonify

from parameter import SECRET_KEY
from models.user import Operator
from models.system import System

console=System()
User=Operator()


app = Flask(__name__)

app.config['SECRET_KEY'] = SECRET_KEY

@app.before_request
def check_route():
    # Check if the requested path is /dashboard and user is not logged in
    if request.path == '/' and User.credentials_verified!='Yes':
        return redirect(url_for('login'))

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        login=request.form
        employee_id=login['id']
        access_key=login['access_key']
        User.check_login(employee_id,access_key)
        if User.credentials_verified=='Yes':
            session['employee_id'] = employee_id
            return redirect(url_for('dashboard'))
        else:
            # User.updateloginstatus(int(employee_id),User.credentials_verified)
            return render_template('login.html',msg="Login Unsuccessful...")
    return render_template('login.html',msg="")


@app.route('/logout', methods=['POST'])
def logout():
    User.logout()
    return redirect(url_for('login'))

@app.route('/old', methods=['GET', 'POST'])
def old_dashboard():
    return render_template('map_UI.html') 

@app.route('/', methods=['GET', 'POST'])
def dashboard():
    return render_template('index.html') 

@app.route('/fetch_robot_count')
def robot_count():
    robot_count=console.fetch_no_of_robots()
    return jsonify(robot_count)

@app.route('/fetch_landmarks')
def landmark_count():
    landmarks=console.fetch_no_of_landmarks()
    return jsonify(landmarks)

@app.route('/fetch_robot_info/<robot_id>')
def robot_status(robot_id):
    robot_status_data=console.fetch_robot_data_for(robot_id)
    # print("Status data for  ",robot_id," : ",robot_status_data)
    if robot_status_data!= None:
        return jsonify(robot_status_data)
    else:
        return jsonify({'error': 'Invalid robot ID'})
    
@app.route('/fetch_landmark_coordinates/<landmark_id>')
def landmark_coordinates(landmark_id):
    landmark_data =console.fetch_landmark_data_for(landmark_id)
    # print(landmark_data)
    if landmark_data != None:
        return jsonify(landmark_data)
    else:
        return jsonify({'error': 'Invalid Landmark ID'})

@app.route('/fetch_current_tasks')
def current_tasks():
    current_tasks=console.fetchcurrenttasks()
    return jsonify(current_tasks)

@app.route('/fetch_employee_log')
def employee_logs():
    employee_log=console.fetchemployeelog()
    return jsonify(employee_log)

@app.route('/fetch_employee_ids')
def employee_ids():
    employee_ids=console.fetchemployeeids()
    print("employee_ids: ",employee_ids)
    return jsonify(employee_ids)

@app.route('/fetch_base_coordinates')
def base_coordinates():
    base_coordinates = console.fetchbasecoordinates()
    return jsonify(base_coordinates)

@app.route('/submit-task', methods=['POST'])
def submit_task():
    employee_id = session.get('employee_id', None)
    if request.method == 'POST':
        # Retrieve form data
        landmark = request.form['landmark-select']
        robot = request.form['robots-select']
        instructions = request.form['task-select']
        print("Landmark:",landmark)
        print("Robot:",robot)
        print("Instructions:",instructions)
        if robot =="Auto-Assign":
            robot=console.determinebestcandidate(landmark)
        result=User.submittask(employee_id, robot, landmark, instructions)
        if result == "Task submitted successfully!":
            return jsonify({'status': 'success', 'message': result}), 200
        else:
            return jsonify({'status': 'error', 'message': result}), 500
    else:
        return jsonify({'status': 'error', 'message': 'Invalid request method'}), 405
    
@app.route("/GetSystemlogs",methods=["POST"])
def getsystemlogs():
    table_name = request.form['systemlog-select1']
    value = request.form['systemlog-select2']
    # print(table_name,value)
    # print(type(table_name) , type(value))
    logs=console.getsystemlogs(table_name,value)
    # return jsonify({'column_names': formatted_logs[0], 'results': formatted_logs[1]})
    return jsonify({'column_names': logs[0], 'results': logs[1]})
