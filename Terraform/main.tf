terraform {
  # This module is now only being tested with Terraform 0.13.x. However, to make upgrading easier, we are setting
  # 0.12.26 as the minimum version, as that version added support for required_providers with source URLs, making it
  # forwards compatible with 0.13.x code.
  required_version = ">= 0.12.26"
}


## GKE Cluster
module "gke" {
  source  = "terraform-google-modules/kubernetes-engine/google"
  version = "9.3.0"

  # required variables
  project_id        = var.project
  name              = var.cluster_name
  region            = var.region
  network           = var.network
  subnetwork        = var.subnetwork
  ip_range_pods     = var.ip_range_pods
  ip_range_services = var.ip_range_services

  # optional variables
  kubernetes_version       = var.kubernetes_version
  regional                 = true
  create_service_account   = true
  remove_default_node_pool = true

  # addons
  network_policy             = false
  horizontal_pod_autoscaling = true
  http_load_balancing        = true

  node_pools = [
    {
      name               = "default-node-pool"
      machine_type       = "n1-standard-1"
      min_count          = 2
      max_count          = 6
      local_ssd_count    = 0
      disk_size_gb       = 50
      disk_type          = "pd-standard"
      image_type         = "COS"
      auto_repair        = true
      autoscaling        = true
      auto_upgrade       = true
      initial_node_count = 1
    },
  ]

  node_pools_oauth_scopes = {
    all = []
    default-node-pool = [
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/ndev.clouddns.readwrite",
      "https://www.googleapis.com/auth/service.management.readonly",
      "https://www.googleapis.com/auth/servicecontrol",
      "https://www.googleapis.com/auth/trace.append",
    ]
  }

  node_pools_labels = {
    all = {}
    default-node-pool = {
      default-node-pool = true,
    }
  }

  node_pools_tags = {
    all = []
    default-node-pool = [
      "default-node-pool",
    ]
  }

}


## Data Sources
data "google_client_config" "default" {}

resource "google_project_service" "container" {
  project  = "cloudopsacademy"
  service = "container.googleapis.com"

  # services = [
  #   "bigquery-json.googleapis.com",
  #   "cloudapis.googleapis.com",
  #   "cloudtrace.googleapis.com",
  #   "compute-component.googleapis.com",
  #   "container.googleapis.com",
  #   "dataflow.googleapis.com",
  #   "logging.googleapis.com",
  #   "monitoring.googleapis.com",
  #   "pubsub.googleapis.com",
  #   "sqladmin.googleapis.com"
  # ]
}

resource "google_project_service" "compute" {
  project  = "cloudopsacademy"
  service = "compute.googleapis.com"
}

resource "google_compute_subnetwork" "pods-private-secondary-ip-ranges" {
  name          = "pods-subnetwork"
  ip_cidr_range = "10.156.1.0/24"
  region        = var.region
  network       = var.network
  secondary_ip_range {
    range_name    = "pods-secondary-range"
    ip_cidr_range = "10.156.2.0/24"
  }
}

# resource "google_compute_network" "custom-pods" {
#   name                    = "pods-network"
#   auto_create_subnetworks = false
# }



resource "google_compute_subnetwork" "services-private-secondary-ip-ranges" {
  name          = "services-subnetwork"
  ip_cidr_range = "10.156.5.0/24"
  region        = var.region
  network       = var.network
  secondary_ip_range {
    range_name    = "services-secondary-range"
    ip_cidr_range = "10.156.6.0/24"
  }
}

# resource "google_compute_network" "custom-services" {
#   name                    = "services-network"
#   auto_create_subnetworks = false
# }