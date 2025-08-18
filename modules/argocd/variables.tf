variable "namespace" {
  type        = string
  default     = "argocd"
}

variable "nodePort" {
  type    = number
  default = 30080
}

variable "chart_version" {
  type    = string
  default = "7.7.8"
}

variable "environment" {
  description = "Environment name"
  type        = string
}
#------------------------------------------------------#

