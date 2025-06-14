locals {
  roles = [
    "roles/clouddeploy.operator",
    "roles/container.developer",
    "roles/storage.admin",
    "roles/iam.serviceAccountUser",
    "roles/artifactregistry.writer"
  ]
  github_repository_name = "Jacks128/Workshop-KCD"
}

resource "google_service_account" "cicd_sa" {
  project      = var.project_id
  account_id   = "cicd-sa"
  description  = "Service Account to be used by GitHub Actions for CI/CD"
}

resource "google_project_iam_member" "cicd_roles" {
  project = var.project_id
  
  for_each = {
    for role in local.roles : role => role
  }
  
  role    = each.value

  member = "serviceAccount:${google_service_account.cicd_sa.email}"
}

resource "google_service_account_iam_member" "cicd_ga_principal" {
  service_account_id = google_service_account.cicd_sa.name
  role               = "roles/iam.workloadIdentityUser"
  member             = "principalSet://iam.googleapis.com/${google_iam_workload_identity_pool.github_wif_pool_01.name}/attribute.repository/${local.github_repository_name}"
}
