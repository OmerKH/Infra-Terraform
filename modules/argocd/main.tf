resource "kubernetes_namespace" "argocd" {
  metadata {
    name = var.namespace
  }
}


resource "helm_release" "argocd" {
    name       = "argocd"
    namespace  = var.namespace
    repository = "https://argoproj.github.io/argo-helm"
    chart      = "argo-cd"
    version    = var.chart_version #"4.10.8"

    create_namespace = false  

    values = [
    yamlencode({
      server = {
        ingress = {
          enabled = true
          ingressClassName = "nginx"
          hostname          = "localhost"
          paths             = ["/"]
          pathType          = "Prefix"
        }
        service = {
          type = "ClusterIP"
        }
      }
    })
  ]
        depends_on = [kubernetes_namespace.argocd]
}