resource "google_iam_workload_identity_pool" "github_wif_pool_01" {
  project                   = var.project_id
  workload_identity_pool_id = "github-wif-pool-01"
  description               = "Workload Identity Pool for GitHub Actions"
}

resource "google_iam_workload_identity_pool_provider" "github_wif_provider_01" {
  project                            = var.project_id
  workload_identity_pool_id          = google_iam_workload_identity_pool.github_wif_pool_01.workload_identity_pool_id
  workload_identity_pool_provider_id = "github-wif-provider-01"
  description                        = "Workload Identity Provider for GitHub Actions"

  attribute_mapping = {
    "google.subject"       = "assertion.sub"
    "attribute.repository" = "assertion.repository"
  }

  oidc {
    issuer_uri = "https://token.actions.githubusercontent.com"
  }
}

output "google_iam_workload_identity_pool_provider_github_name" {
  description = "Workload Identity Provider ID"
  value       = google_iam_workload_identity_pool_provider.github_wif_provider_01.name
}