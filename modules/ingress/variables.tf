variable "namespace" {
  type        = string
  default     = "argocd"
}

# variable "nodePort" {
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
  default     = "dev"
}
#------------------------------------------------------#

