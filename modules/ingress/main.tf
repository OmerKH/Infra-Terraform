resource "helm_release" "nginx_ingress" {
  name       = "ingress-nginx"
  namespace  = var.namespace
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  version    = "4.13.0"

  create_namespace = false

  values = [
    yamlencode({
      controller = {
        publishService = {
          enabled = true
        }
        service = {
          type = "LoadBalancer"
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


#  set {
#     name  = "controller.admissionWebhooks.enabled"
#     value = "true"
#   }

#   set {
#     name  = "controller.service.type"
#     value = "ClusterIP"
#   }

#   set {
#     name  = "controller.publishService.enabled"
#     value = "false"
#   }
