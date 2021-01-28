variable "project_id" {
  type = string
}

variable "git_repo_owner" {
  type = string
}

variable "region" {
  type    = string
  default = "us-central1"
}

variable "trigger_name" {
  type    = string
  default = "tooploox-gke-trigger"
}

variable "git_repo_name" {
  type    = string
  default = "Tooploox_recruitment_task"
}

variable "watched_dir" {
  type    = string
  default = "application"
}

variable "git_branch_regex" {
  type    = string
  default = "^main$"
}
