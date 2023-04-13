# Creating Namespace
resource "kubernetes_namespace" "strimzi" {
  metadata {
    name = "strimzi"
  }
}

# Strimzi Application
resource "kubectl_manifest" "argocd-strimzi-kafka-operator" {
  depends_on = [
    helm_release.argocd
  ]
  yaml_body = templatefile(
    "../applications/configs/strimzi-kafka/00-argo-cd/strimzi-kafka-operator.yaml",
    {
      REPO_URL = "git@github.com:DeiraTool/architecture/",
      REPO_BRANCH = "main",
      REPO_PATH = "applications/charts/strimzi-kafka-operator/"
    }
  )
}