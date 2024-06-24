# Fleet Manager Application

This repository contains a Flask-based Fleet Manager application developed during my internship at the Center for Automated Systems Engineering, KLE Tech. The project focuses on the development of a multi-robot system for agri-tech applications.

## Table of Contents
- [Introduction](#introduction)
- [Features](#features)
- [Screenshots](#screenshots)
- [Installation](#installation)
- [Usage](#usage)
- [Acknowledgements](#acknowledgements)

## Introduction
The Fleet Manager application is designed to manage a fleet of robots for agricultural tasks. It provides a user-friendly interface to allocate tasks to robots, monitor their status, and view system logs.

## Features
- **Login Page:** Secure access to the system with user authentication.
- **Dashboard:** 
  - **Folium Map:** Displays markers representing the robots and predetermined destination locations (landmarks).
  - **Task Allocation:** Dropdown menus for selecting location, robot, and instructions.
  - **Job Card:** Displays the current job allocated to each robot along with the employee ID of the assignee.
  - **Battery Status:** Shows the battery levels of the electronics and motor batteries for each robot.
- **System Log Page:**
  - **Search Bar:** Filter logs by operator log, task log, battery logs, and movement log. Allows filtering by specific employee ID or robot ID.
- **Floating Sidebar:** Remains minimized unless hovered over. Once hovered upon, it presents options to navigate the pages (Dashboard and System Log Page) as well as the Logout button that redirects the user to the login page.

## Screenshots
### Login Page
![Login Page](https://github.com/NakulSK221B/Fleet-Manager/assets/95758559/d54ccfac-b91b-4196-8b3d-748f13413985)


### Dashboard
![Dashboard](https://github.com/NakulSK221B/Fleet-Manager/assets/95758559/d79dda7d-9f79-4f51-87c0-6c7140fb9771)


### System Log Page
![System Log](https://github.com/NakulSK221B/Fleet-Manager/assets/95758559/9071ac8f-0449-4f43-b74e-b6dabb6d7b71)

### Sidebar
![Sidebar](https://github.com/NakulSK221B/Fleet-Manager/assets/95758559/5811bba7-df48-4297-be8a-96ef23ba2418)


## Installation

1. Clone the repository:
   ```cmd
   git clone https://github.com/yourusername/fleet-manager.git
   cd fleet-manager
3. Create and activate a virtual environment:
   ```cmd
   python -m venv venv
   venv\Scripts\activate
4. Install the application and dependencies:
   ```cmd
   pip install -e .
6. Set up the environment variables (create a .env file and add your variables):
   ```makefile
   FLASK_APP=app.py
   FLASK_ENV=development
   SECRET_KEY=your_secret_key
8. Initialize the database:

    - Make sure MySQL is installed and running.
    - Import the SQL dump file (database_dump.sql) into your MySQL database using MySQL command-line client or a tool like phpMyAdmin.
      
    Example using MySQL command-line client:
    ```cmd
    mysql -u username -p database_name < database_dump.sql

## Usage
1. Run the application:
   ```cmd
   flask run

2.Open your browser and go to http://127.0.0.1:8000.


## Acknowledgements
- Center for Automated Systems Engineering, KLE Technological University for the internship opportunity.
- My mentors and colleagues for their support and guidance during the project.

