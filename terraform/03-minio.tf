# creating namespace
resource "kubernetes_namespace" "minio" {
  metadata {
    name = "minio"
  }
}

# Min.io Application
resource "kubectl_manifest" "argocd-minio" {
  depends_on = [
    helm_release.argocd
  ]
  yaml_body = templatefile(
    "../applications/configs/minio/minio.yaml",
    {
      REPO_URL = "git@github.com:DeiraTool/architecture/",
      REPO_BRANCH = "main",
      REPO_PATH = "applications/charts/minio/"
    }
  )
}