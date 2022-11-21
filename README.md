[![CircleCI](https://circleci.com/gh/dblsilverio/cdoend-project-4.svg?style=svg)](https://circleci.com/gh/dblsilverio/cdoend-project-4)

## Udacity Cloud DevOps Engineer - Operationalize a Machine Learning Microservice API

This projects provides a set of scripts and application that operationalize a ML Microservice API.

---

## Setup the Environment

A `Makefile` is provided to help the setup process.

Run `make setup` to create a local python enviroment. Make sure you are running **Python 3.7**.

After the setup step, [install and configure `hadolint`](https://github.com/hadolint/hadolint#how-to-use)  for Docker linting.

With `hadolint` configured, run `make all` to prepare the application to operate.

### Setup - Tools

* [Setup and Configure](https://docs.docker.com/engine/install/) Docker locally
* Setup and Configure Kubernetes locally - [minikube](https://minikube.sigs.k8s.io/docs/start/) / [Docker Desktop](https://www.docker.com/products/docker-desktop/)

### Running `app.py`

*Make sure to have all dependencies installed before running the app.py locally*

1. Standalone:  `python app.py`
2. Run in Docker:  `./run_docker.sh`
3. Run in Kubernetes:  `./run_kubernetes.sh`


### Testing

Run `make_prediction.sh` to request a prediction from the API.

The payload used for testing:

```json
{  
   "CHAS":{  
      "0":0
   },
   "RM":{  
      "0":6.575
   },
   "TAX":{  
      "0":296.0
   },
   "PTRATIO":{  
      "0":15.3
   },
   "B":{  
      "0":396.9
   },
   "LSTAT":{  
      "0":4.98
   }
}
```

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