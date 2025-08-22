module "argocd" {
  source        = "./modules/argocd"
  namespace     = "argocd"
  chart_version = "7.7.8"
  environment   = var.environment
}

module "nginx_ingress" {
  source    = "./modules/ingress"
  namespace = "argocd"
  depends_on = [module.argocd]
}
