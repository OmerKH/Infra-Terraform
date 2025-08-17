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
  default = "4.10.8"
}

variable "ingress_host" {
  type    = string
  default = "192.168.1.109"
}