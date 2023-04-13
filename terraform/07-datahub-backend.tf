# Creating Namespace
resource "kubernetes_namespace" "datahub" {
  metadata {
    name = "datahub"
  }
}

# Secret with neo4j password
resource "kubectl_manifest" "datahub-neo4j-secret" {
  yaml_body = templatefile(
    "../applications/configs/datahub-backend/secrets.yaml",
    { }
  )
  override_namespace = "datahub"
}

# Datahub Application
resource "kubectl_manifest" "argocd-datahub-backend" {
  depends_on = [
    helm_release.argocd
  ]
  yaml_body = templatefile(
    "../applications/configs/datahub-backend/datahub-backend.yaml",
    {
      REPO_URL = "git@github.com:DeiraTool/architecture/",
      REPO_BRANCH = "main",
      REPO_PATH = "applications/charts/datahub-backend/"
    }
  )
}