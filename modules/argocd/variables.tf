variable "namespace" {
  type        = string
  default     = "argocd"
}

# variable "node_port" {
#   type    = number
#   default = 30080
# }

variable "chart_version" {
  type    = string
  default = "8.3.2"
}

variable "environment" {
  description = "Environment name"
  type        = string
}
#------------------------------------------------------#

