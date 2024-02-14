sudo apt update -y
sudo apt install software-properties-common -y
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt install -y wget git python3.10 python3.10-venv

sudo rm /usr/bin/python3
sudo ln -s /usr/bin/python3.10 /usr/bin/python3
