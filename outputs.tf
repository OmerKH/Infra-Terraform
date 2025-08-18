output "argocd_url" {
  value       = module.argocd.argocd_url
  description = "ArgoCD server URL"
}

# output "argocd_namespace" {
#   value       = module.argocd.namespace
#   description = "ArgoCD namespace"
# }