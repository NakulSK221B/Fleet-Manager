from flask import redirect, url_for
import webbrowser , os
from controller.controller_script import app,login

@app.route('/')
def index():
    # Render the login page
    return redirect(url_for('login'))  

def main():
    
    # The reloader has not yet run - open the browser
    # if not os.environ.get("WERKZEUG_RUN_MAIN"):
    #     webbrowser.open_new('http://127.0.0.1:8000/')

    app.run(host="0.0.0.0", port=8000, debug="true")

if __name__ == '__main__':
    main()