# creating namespace
resource "kubernetes_namespace" "postgresql" {
  metadata {
    name = "postgresql"
  }
}

# Postgresql Application
resource "kubectl_manifest" "argocd-postgresql" {
  depends_on = [
    helm_release.argocd
  ]
  yaml_body = templatefile(
    "../applications/configs/postgresql/postgresql.yaml",
    {
      REPO_URL = "git@github.com:DeiraTool/architecture/",
      REPO_BRANCH = "main",
      REPO_PATH = "applications/charts/postgresql/"
    }
  )
}
