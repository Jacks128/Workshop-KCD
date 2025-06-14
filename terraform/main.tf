terraform {
    required_version = "1.7.5"
    backend "gcs" {
      bucket = "tf_bucket_547401477161"
      prefix = "terraform/state"
    }
    required_providers {
        google = {
            source = "hashicorp/google"
            version = "5.14.0"
        }
    }
}