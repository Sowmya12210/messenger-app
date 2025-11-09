terraform{
    required_providers{
        google = {
            souce = "hashicorp/google"
            version = "~> 6.0"
        }
    }
}
provider "google" {
  project     = var.project_id
  region      = var.region
  credentials = file(var.credentials_file)
}