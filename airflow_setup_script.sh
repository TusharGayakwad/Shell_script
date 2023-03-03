#Install and Setup Apache Airflow on Ubuntu 
while getopts n:ln o; do
  case $o in
    (n) name=$OPTARG;;
    (ln) lname=$OPTARG;;

  esac
done
#Print
echo "Install Apache Airflow"

#Step 1: Update and Upgrade the System.
sudo apt-get update && upgrade

#Step 2:  Install the python3-pip .
apt-get install python-setuptools
apt install python3-pip

#Step 3: Install the required dependencies for Apache Airflow.
apt-get install libmysqlclient-dev
apt-get install libssl-dev
apt-get install libkrb5-dev

#Step 5: Install the Apache-Airflow on system.
 # -Install the python-virtual Environment.
apt install python3-virtualenv
virtualenv airflow_example

#Step 6: Change the directory.
cd airflow_example/bin/

#Step 7: Activate the source.
source activate



#Step 8: Now ,install the apache-airflow.
export AIRFLOW_HOME=~/airflow
pip3 install apache-airflow


#step 9: Run the following command.
airflow db init


#Step 10: Step 6: Set the Apache-Airflow login credentials for airflow web interface.
airflow users create --username admin --firstname $name --lastname  $lname 
    

#Step 11: Start the Apache-Airflow web interface.
airflow webserver -p 8080


