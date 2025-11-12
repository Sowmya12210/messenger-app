module "gke" {
  source           = "./modules"
  project_id       = var.project_id
  region           = var.region
  cluster_name     = var.cluster_name
  bucket_name      = var.bucket_name
  # network_name     = var.network_name
  # subnet_name      = var.subnet_name
  node_count       = var.node_count
  machine_type     = var.machine_type
}
