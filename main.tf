module "argocd" {
  source        = "./modules/argocd"
  namespace     = "argocd"
  chart_version = var.chart_version
  environment   = var.environment
}

module "nginx_ingress" {
  source    = "./modules/ingress"
  namespace = "argocd"
  depends_on = [module.argocd]
}
