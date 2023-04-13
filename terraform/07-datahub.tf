# Secret with postgres password
resource "kubectl_manifest" "datahub-postgres-secret" {
  yaml_body = templatefile(
    "../applications/configs/datahub/secrets.yaml",
    { }
  )
  override_namespace = "datahub"
}

# Datahub Application
resource "kubectl_manifest" "argocd-datahub" {
  depends_on = [
    helm_release.argocd,
    kubectl_manifest.argocd-datahub-backend,
    kubectl_manifest.argocd-postgresql
  ]
  yaml_body = templatefile(
    "../applications/configs/datahub/datahub.yaml",
    {
      REPO_URL = "git@github.com:DeiraTool/architecture/",
      REPO_BRANCH = "main",
      REPO_PATH = "applications/charts/datahub/"
    }
  )
}

# Apply config maps with recipes
resource "kubectl_manifest" "datahub-recipes" {
  depends_on = [
    kubectl_manifest.argocd-datahub
  ]
  yaml_body = templatefile(
    "../applications/configs/datahub/recipes.yaml",
    { }
  )
  override_namespace = "datahub"
}