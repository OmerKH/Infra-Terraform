module "argocd" {
  source        = "./modules/argocd"
  namespace     = "argocd"
  chart_version = "4.10.8"
  node_port     = 30080
}

