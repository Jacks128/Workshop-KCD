resource "google_artifact_registry_repository" "cicd_artifacts" {
  project = var.project_id
  location      = var.project_location
  repository_id = "cicd-artifacts"
  format        = "DOCKER"
}