resource "helm_release" "cert-manager" {
  name       = "cert-manager"
  repository = "https://charts.jetstack.io"
  chart      = "cert-manager"
  namespace  = "ingress-nginx"
  depends_on = [helm_release.nginx-ingress]

  set {
    name  = "installCRDs"
    value = "true"
  }
}
 