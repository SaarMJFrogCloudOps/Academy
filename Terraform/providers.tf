provider "google" {
  version = "~> 3.43.0"
  project = var.project
  region  = var.region
}

provider "google-beta" {
  version = "~> 3.43.0"
  project = var.project
  region  = var.region
}
provider "random" {
  version = "~> 2.2.1"
}

provider "null" {
  version = "~> 2.1.2"
}

provider "kubernetes" {
  version = "~> v1.11.3"
}