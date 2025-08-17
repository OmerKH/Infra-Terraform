module "argocd" {
  source        = "./modules/argocd"
  namespace     = "argocd"
  chart_version = "4.10.8"
  # node_port     = 30080
  ingress_host   = "argocd.127.0.0.1.nip.io"
}

module "ingress" {
  source     = "./modules/ingress"
  depends_on = [module.argocd]
}
