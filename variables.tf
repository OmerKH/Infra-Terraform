variable "kubeconfig" {
  type        = string
  default     = "~/.kube/config"
  description = "Path to kubeconfig file"
}


variable "environment" {
  default = "dev"
}

variable "chart_version" {
  type    = string
  default = "7.7.8"
}