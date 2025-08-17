resource "helm_release" "nginx_ingress" {
  name       = "ingress-nginx"
  namespace  = "argocd"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  version    = "4.10.0"

  create_namespace = false

  values = [
    yamlencode({
      controller = {
        publishService = {
          enabled = true
        }
        service = {
          type = "NodePort"
        }
        ingressClassResource = {
          name            = "nginx"
          enabled         = false  # Don't create new IngressClass, use existing
          default         = true
          controllerValue = "k8s.io/ingress-nginx"
        }
      }
    })
  ]
}
