#!/bin/bash
mkdir appengine-hello
cd appengine-hello
gsutil cp gs://cloud-training/archinfra/gae-hello/* .
dev_appserver.py $(pwd)
echo "Server running for 20 seconds"
sleep 20
echo "Server Exiting"
pid=$1
( kill -TERM $pid ) 2>&1
gcloud app deploy app.yaml
gcloud app browse
cat main.py
sed -i -e 's/webapp2/webapp22/' main.py
cat main.py
gcloud app deploy app.yaml --quiet
gcloud app browse
gcloud app browse
sed -i -e 's/webapp22/webapp2/' main.py
gcloud app deploy app.yaml --quiet
gcloud app browse

