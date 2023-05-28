resource "helm_release" "prometheus" {
  name       = "prometheus-app"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "prometheus"
  namespace = "monitoring"
  depends_on = [ helm_release.grafana ]
}