sudo apt-get install build-essential python3-venv python3-dev python3-pip default-libmysqlclient-dev -y
python3 -m pip install --upgrade pip
python3 -m venv venv
source ./venv/bin/activate
pip3 install wheel
pip3 install -r requirements.txt
rm -f db.sqlite3
# create root super user
python3 manage.py makemigrations users
python3 manage.py makemigrations
python3 manage.py migrate
echo "creating a 'root' superuser ..."
python3 manage.py createsuperuser --email root@gmail.com --phone 09120000000
