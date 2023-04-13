# Creating Namespace
resource "kubernetes_namespace" "airflow" {
  metadata {
    name = "airflow"
  }
}

# Granting Access to Private Repo
resource "kubectl_manifest" "airflow-repo-access" {
  yaml_body = templatefile(
    "../applications/configs/airflow/secrets.yaml",
    { }
  )
  override_namespace = "airflow"
}

# Airflow Application
resource "kubectl_manifest" "argocd-airflow" {
  depends_on = [
    helm_release.argocd
  ]
  yaml_body = templatefile(
    "../applications/configs/airflow/airflow.yaml",
    {
      REPO_URL = "git@github.com:DeiraTool/architecture/",
      REPO_BRANCH = "main",
      REPO_PATH = "applications/charts/airflow/"
    }
  )
}