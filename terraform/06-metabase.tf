# creating namespace
resource "kubernetes_namespace" "metabase" {
  metadata {
    name = "metabase"
  }
}

# Min.io Application
resource "kubectl_manifest" "argocd-metabase" {
  depends_on = [
    helm_release.argocd,
    kubectl_manifest.argocd-postgresql
  ]
  yaml_body = templatefile(
    "../applications/configs/metabase/metabase.yaml",
    {
      REPO_URL = "git@github.com:DeiraTool/architecture/",
      REPO_BRANCH = "main",
      REPO_PATH = "applications/charts/metabase/"
    }
  )
}