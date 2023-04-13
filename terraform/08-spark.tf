# Creating Namespace
resource "kubernetes_namespace" "spark-operator" {
  metadata {
    name = "spark-operator"
  }
}

# Granting Access to Private Repo
resource "kubectl_manifest" "spark-repo-access" {
  yaml_body = templatefile(
    "../applications/configs/spark-operator/secrets.yaml",
    { }
  )
  override_namespace = "spark-operator"
}

# Creating Roles
resource "kubectl_manifest" "spark-operator-roles" {
  yaml_body = templatefile(
    "../applications/configs/spark-operator/roles.yaml",
    { }
  )
  override_namespace = "spark-operator"
}

# Creating Roles Binding
resource "kubectl_manifest" "spark-operator-roles-binding" {
  yaml_body = templatefile(
    "../applications/configs/spark-operator/roles_binding.yaml",
    { }
  )
  override_namespace = "spark-operator"
}

# Spark Application
resource "kubectl_manifest" "argocd-spark-operator" {
  depends_on = [
    helm_release.argocd,
    kubernetes_namespace.spark-operator
  ]
  yaml_body = templatefile(
    "../applications/configs/spark-operator/spark-operator.yaml",
    {
      REPO_URL = "git@github.com:DeiraTool/architecture/",
      REPO_BRANCH = "main",
      REPO_PATH = "applications/charts/spark-operator/"
    }
  )
}