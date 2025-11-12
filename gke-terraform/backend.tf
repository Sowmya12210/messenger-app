terraform {
  backend "gcs" {
    bucket      = "tf-bucket"
    prefix      = "gke-cluster"                
    credentials = var.credentials_file
  }
  required_version = ">= 1.5.0"
}