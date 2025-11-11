variable "project_id" {
  description = "GCP Project ID"
}

variable "region" {
  description = "GCP Region"
}

variable "cluster_name" {
  description = "Name of the GKE cluster"
}

variable "credentials_file" {
  description = "Path to GCP service account key file"
  default     = "gcp-key.json"
}

# variable "network_name" {
#   description = "VPC name"
#   default     = "messenger-vpc"
# }

# variable "subnet_name" {
#   description = "Subnet name"
#   default     = "messenger-subnet"
# }

variable "node_count" {
  default = 1
}

variable "machine_type" {
  default = "e2-small"
}
