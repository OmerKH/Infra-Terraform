module "argocd" {
  source        = "./modules/argocd"
  namespace     = "argocd"
  chart_version = "7.7.8"
  nodePort      = 30080
  environment   = var.environment
}


