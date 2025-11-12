terraform {
  backend "gcs" {
    bucket      = var.bucket_name
    prefix      = "gke-cluster"                
    credentials = var.credentials_file
  }
  required_version = ">= 1.5.0"
}