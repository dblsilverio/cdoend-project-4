[![CircleCI](https://circleci.com/gh/dblsilverio/cdoend-project-4.svg?style=svg)](https://circleci.com/gh/dblsilverio/cdoend-project-4)

## Project Overview

In this project, you will apply the skills you have acquired in this course to operationalize a Machine Learning Microservice API. 

You are given a pre-trained, `sklearn` model that has been trained to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios, and so on. You can read more about the data, which was initially taken from Kaggle, on [the data source site](https://www.kaggle.com/c/boston-housing). This project tests your ability to operationalize a Python flask app—in a provided file, `app.py`—that serves out predictions (inference) about housing prices through API calls. This project could be extended to any pre-trained machine learning model, such as those for image recognition and data labeling.

---

## Setup the Environment

* Create a virtualenv with Python 3.7 and activate it. Refer to this link for help on specifying the Python version in the virtualenv. 
```bash
python3 -m pip install --user virtualenv
# You should have Python 3.7 available in your host. 
# Check the Python path using `which python3`
# Use a command similar to this one:
python3 -m virtualenv --python=<path-to-Python3.7> .devops
source .devops/bin/activate
```
* Run `make install` to install the necessary dependencies

### Running `app.py`

1. Standalone:  `python app.py`
2. Run in Docker:  `./run_docker.sh`
3. Run in Kubernetes:  `./run_kubernetes.sh`

### Kubernetes Steps

* Setup and Configure Docker locally
* Setup and Configure Kubernetes locally
* Create Flask app in Container
* Run via kubectl

---
## Project Files

Below you will find extra information about the project file structure.

```
root
├── Dockerfile
├── Makefile
├── README.md
├── app.py
├── make_prediction.sh
├── model_data
│   ├── boston_housing_prediction.joblib
│   └── housing.csv
├── output_txt_files
│   ├── docker_out.txt
│   └── kubernetes_out.txt
├── requirements.txt
├── run_docker.sh
├── run_kubernetes.sh
└── upload_docker.sh
```

### Application 
* **app.py** - Main project file - reads the machine learning model and provides predictions through the endpoint `/predict`
* **model_data/** - Stores the trained model and its original source.
* **requirements.txt** - Python project dependency requirements.

### Build Scripts
* **Makefile** - Handles standard build steps from command line, e.g., Setup, Install, etc.
* **Dockerfile** - Docker image blueprint for local and k8s deployment.

### Executable Scripts
* **make_prediction.sh** - Request a prediction from the trained model via Rest/HTTP endpoint
* **run_docker.sh** - Build and start a docker container with the Python project running on port `8000`
* **run_kubernetes.sh** - Setup a k8s deployment with the image built previously and forward requests from local `8000` port to container
* **upload_docker.sh** - Prepare and push the image to Docker Hub