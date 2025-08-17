resource "kubernetes_namespace" "argocd" {
  metadata {
    name = "argocd"
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
          hostname          = var.ingress_host
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




#For NodePort Service
# values = [
#         yamlencode({
#             server: {
#                 service: {
#                     type: "NodePort"
#                     node_port: var.node_port #30080
#                 }
#             }
#         })
#         ]