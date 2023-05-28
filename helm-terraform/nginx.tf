resource "helm_release" "nginx-ingress" {
  name       = "nginx-controller-flask-app"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  version    = "4.6.0"
  namespace  = "ingress-nginx"

  set {
    name  = "controller.replicaCount"
    value = "1"
  }
  set {
    name  = "controller.service.type"
    value = "LoadBalancer"
  }
  set {
    name = "controller.service.externalTrafficPolicy"
    value = "Local"
  }
}