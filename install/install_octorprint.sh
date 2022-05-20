
# https://community.octoprint.org/t/setting-up-octoprint-on-a-raspberry-pi-running-raspbian-or-raspberry-pi-os/2337



sudo apt update
sudo apt install python3-pip python3-dev python3-setuptools python3-venv git 
libyaml-dev build-essential
sudo apt-get install libssl-dev openssl

# Create a virtual environment for octoprint
cd ~/opt
~/opt/python3/bin/python3 -m venv octoprint
source ~/opt/octoprint/activate


pip install pip --upgrade
pip install octoprint

# Install octoprint
~/opt/octoprint/bin/pip install --no-cache-dir octoprint

sudo usermod -a -G tty "$USER" && sudo usermod -a -G dialout "$USER"


# Install Octoprint big fix on 2x temperature output
~/opt/octoprint/bin/pip install
"https://github.com/SimplyPrint/OctoPrint-Creality2xTemperatureReportingFix/archive/master.zip"

# Adds some aliases to the bash profile:
# OctoPrint Activate (environment)
echo "alias opa='source ~/opt/octoprint/bin/activate'" >> ~/.bash_profile
echo "alias opd='deactivate'" >> ~/.bash_profile

# Start OctoPrint
echo "alias opk='pgrep octoprint | xargs kill -9; deactivate'" >> ~/.bash_profile
echo "alias op='opa; ~/opt/octoprint/bin/octoprint serve'" >> ~/.bash_profile


