# creating namespace
resource "kubernetes_namespace" "superset" {
  metadata {
    name = "superset"
  }
}

# Min.io Application
resource "kubectl_manifest" "argocd-superset" {
  depends_on = [
    helm_release.argocd,
    kubectl_manifest.argocd-postgresql
  ]
  yaml_body = templatefile(
    "../applications/configs/superset/superset.yaml",
    {
      REPO_URL = "git@github.com:DeiraTool/architecture/",
      REPO_BRANCH = "main",
      REPO_PATH = "applications/charts/superset/"
    }
  )
}