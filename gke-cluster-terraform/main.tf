resource "google_container_cluster" "primary" {
  # using a separately managed node pool as per recommendation 
  # (https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_node_pool)
  name     = var.cluster_name
  location = var.region

  # We can't create a cluster with no node pool defined, so we create the smallest possible
  # default node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1
}

resource "google_container_node_pool" "node_pool" {
  name               = "${var.cluster_name}-node-pool"
  cluster            = google_container_cluster.primary.name
  location           = var.zone == "" ? var.region : var.zone
  initial_node_count = var.initial_node_count
  version            = var.kubernetes_version

  node_config {
    image_type   = var.image_type
    disk_size_gb = var.disk_size_gb
    machine_type = var.machine_type
    disk_type    = var.disk_type
    preemptible  = var.preemptible_nodes

    # Permissions granted via IAM Roles.
    service_account = var.service_account
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }

  management {
    auto_upgrade = var.auto_upgrade
    auto_repair  = var.auto_repair
  }

  depends_on = [google_container_cluster.primary]
}