#!/bin/bash
gcloud auth list
gcloud config list project
gcloud app create --project=$DEVSHELL_PROJECT_ID
git clone https://github.com/GoogleCloudPlatform/python-docs-samples
cd python-docs-samples/appengine/standard_python3/hello_world
sudo apt-get update
sudo apt-get install virtualenv
virtualenv -p python3 venv
source venv/bin/activate
pip install  -r requirements.txt
python main.py &
echo "Server running for 20 seconds"
sleep 20
echo "Server Exiting"
pid=$1
( kill -TERM $pid ) 2>&1
cd ~/python-docs-samples/appengine/standard_python3/hello_world
gcloud app deploy
gcloud app browse

