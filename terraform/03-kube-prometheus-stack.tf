# creating namespace
resource "kubernetes_namespace" "monitoring" {
  metadata {
    name = "monitoring"
  }
}

# Min.io Application
resource "kubectl_manifest" "argocd-monitoring" {
  depends_on = [
    helm_release.argocd
  ]
  yaml_body = templatefile(
    "../applications/configs/kube-prometheus-stack/kube-prometheus-stack.yaml",
    {
      REPO_URL = "git@github.com:DeiraTool/architecture/",
      REPO_BRANCH = "main",
      REPO_PATH = "applications/charts/kube-prometheus-stack/"
    }
  )
}