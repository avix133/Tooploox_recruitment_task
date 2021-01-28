variable "project_id" {
  type = string
}

variable "service_account" {
  type = string
}

variable "region" {
  type    = string
  default = "us-central1"
}

variable "zone" {
  type        = string
  default     = ""
  description = "Provide zone within given region to create Zonal cluster. Leave empty so regional cluster will be created."
}

variable "cluster_name" {
  type    = string
  default = "tooploox"
}

variable "initial_node_count" {
  type        = number
  default     = 1
  description = "Initial number of nodes per cluster(zonal) or per zone(regional)."
}

variable "min_node_count" {
  type        = number
  default     = 1
  description = "Initial number of nodes per cluster(zonal) or per zone(regional)."
}

variable "max_node_count" {
  type        = number
  default     = 4
  description = "Initial number of nodes per cluster(zonal) or per zone(regional)."
}

variable "kubernetes_version" {
  type    = string
  default = "1.16.15-gke.6000"
}

variable "machine_type" {
  type    = string
  default = "e2-micro"
}

variable "disk_size_gb" {
  type        = number
  default     = 10
  description = "Size of the disk attached to each node, specified in GB. The smallest allowed disk size is 10GB. Defaults to 100GB."
}

variable "disk_type" {
  type    = string
  default = "pd-standard"
}

variable "image_type" {
  type        = string
  default     = "COS"
  description = "Available node image types can be found here: https://cloud.google.com/kubernetes-engine/docs/concepts/node-images"
}

variable "preemptible_nodes" {
  type    = bool
  default = false
}

variable "auto_upgrade" {
  type    = bool
  default = true
}

variable "auto_repair" {
  type    = bool
  default = true
}