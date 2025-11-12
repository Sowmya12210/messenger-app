terraform {
  backend "gcs" {
    bucket      = "tf-bucket2"
    prefix      = "gke-cluster"                
    
  }
  required_version = ">= 1.5.0"
}