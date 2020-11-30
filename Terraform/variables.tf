variable "project" {
  description = "The project ID where all resources will be launched."
  type        = string
  default = "CloudOpsAcademy"
}

variable "location" {
  description = "The location (region or zone) of the GKE cluster."
  type        = string
  default = "europe-west3-c"
}

variable "region" {
  description = "The region for the network. If the cluster is regional, this must be the same region. Otherwise, it should be the region of the zone."
  type        = string
  default = "europe-west3"
}

variable "cluster_name" {
  description = "The name of the Kubernetes cluster."
  type        = string
  default     = "coa-cluster"
}

variable "network" {
  default = "default" 
}

variable "subnetwork" {
  default = "default" 
}

variable "ip_range_pods" { 
  default = "pods-secondary-range" 
}

variable "ip_range_services" { 
  default = "services-secondary-range" 
}

variable "kubernetes_version" { 
  default = "1.17.13-gke.2001"
}