from setuptools import setup, find_packages
from setuptools.command.install import install
import subprocess

class CustomInstall(install):
    def run(self):
        install.run(self)
        username = input("Enter your MySQL username: ")
        password = input("Enter your MySQL password: ")
        database_name = input("Enter the name of your MySQL database: ")
        subprocess.run(['mysql', '-u', username, '-p' + password, database_name, '<', 'database_dump.sql'])

setup(
    name='FleetManagerApp',
    version='1.0',
    packages=find_packages(),
    include_package_data=True,
    install_requires=[
        'alembic==1.13.1',
        'blinker==1.8.2',
        'click==8.1.7',
        'colorama==0.4.6',
        'Flask==3.0.3',
        'greenlet==3.0.3',
        'itsdangerous==2.2.0',
        'Jinja2==3.1.4',
        'Mako==1.3.5',
        'MarkupSafe==2.1.5',
        'PyMySQL==1.1.1',
        'SQLAlchemy==2.0.31',
        'typing_extensions==4.12.2',
        'Werkzeug==3.0.3'
        # Add other dependencies here
    ],
    cmdclass={'install': CustomInstall}
)