# resource "google_compute_network" "vpc_network" {
#   name                    = var.network_name
#   auto_create_subnetworks = false
# }

# resource "google_compute_subnetwork" "subnet" {
#   name          = var.subnet_name
#   ip_cidr_range = "10.0.0.0/16"
#   region        = var.region
#   network       = google_compute_network.vpc_network.id
# }

resource "google_storage_bucket" "tf_state_bucket" {
  name          = var.bucket_name
  location      = var.region
  force_destroy = true   
  versioning {
    enabled = true      
  }
}

resource "google_container_cluster" "primary" {
  name               = var.cluster_name
  location           = var.region
  
  initial_node_count = 1

  deletion_protection = false
}

resource "google_container_node_pool" "primary_nodes" {
  name       = "${var.cluster_name}-node-pool"
  location   = var.region
  cluster    = google_container_cluster.primary.name

  node_config {
    machine_type = var.machine_type
    oauth_scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }

  initial_node_count = var.node_count
}
