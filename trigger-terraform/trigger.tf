resource "google_cloudbuild_trigger" "trigger" {
  name        = var.trigger_name
  description = "GitHub trigger for yaml files on ${var.git_repo_name}"

  included_files = ["${var.watched_dir}/*.yml", "${var.watched_dir}/*.yaml"]

  github {
    owner = var.git_repo_owner
    name  = var.git_repo_name
    push {
      branch = var.git_branch_regex
    }
  }

  filename = "cloudbuild.yaml"
}