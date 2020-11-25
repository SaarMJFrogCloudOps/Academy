# JFrog CloudOps Academy assingment

The [presentation](https://docs.google.com/presentation/d/1XvnEW1cEjiBeC15jvV3y43F64erx_X4gy3zZALFlues/edit?usp=sharing) and [progress log](https://docs.google.com/document/d/1khGnESiR1ZnPfzO4LV80Ckcaqe7u98KU-u8u_lBW0xI/edit?usp=sharing) have all the overviews and fancy graphs. This repository holds the fun stuff.



## Infrastructure

GKE cluster provisioned using Terraform - 
Starting out with two nodes of type  N1-standard-1 (scaling up to 5 nodes with 1 vCPU 3.75Gb RAM each)
Should last 5-10 weeks given a 300$ free credits [budget](https://cloud.google.com/compute/vm-instance-pricing#n1_predefined) 
In a VPC for baseline network privacy and security setup appropriate for a web app.

## WebApp

Stack TBD - should be packed with Docker and Helm to be continuously deployed to the Kubernetes cluster

## CI/CD 
In the Pipelines directory sit the JFrog Pipelines definitions that build ,XRAY scan and deploy the web app.

<!-- 
A bit of IAM prep to be automated / clenest path to a working $ terraform apply
gcloud iam service-accounts create terraform-gke

gcloud projects add-iam-policy-binding cloudopsacademy --member="serviceAccount:terraform-gke@cloudopsacademy.iam.gserviceaccount.com" --role="roles/owner"

gcloud iam service-accounts keys create key_terraform-gke.json --iam-account=terraform-gke@cloudopsacademy.iam.gserviceaccount.com

export GOOGLE_APPLICATION_CREDENTIALS="/home/saar/Desktop/CloudOpsAcademy/SecConfig/key_terraform-gke.json" 

gcloud services enable compute.googleapis.com 
gcloud services enable container.googleapis.com

<!-- Aligning the projectID for Terraform and gcloud is essential!!! -->
<!-- gcloud config set project cloudopsacademy
export TF_VAR_project=$(gcloud config get-value project) --> 
