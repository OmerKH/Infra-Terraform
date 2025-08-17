module "argocd" {
  source        = "./modules/argocd"
  namespace     = "argocd"
  chart_version = "4.10.8"
  # node_port     = 30080
  ingress_host   = "192.168.1.109"
}

module "ingress" {
  source     = "./modules/ingress"
}
