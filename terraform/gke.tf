resource "google_container_cluster" "staging" {
    name     = "staging"
    project = var.project_id
    location = var.project_location
    enable_autopilot = true
    deletion_protection = false
}

resource "google_container_cluster" "production" {
    name     = "production"
    project = var.project_id
    location = var.project_location
    enable_autopilot = true
    deletion_protection = false
}