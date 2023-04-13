# Strimzi Kafka Cluster Application
resource "kubectl_manifest" "argocd-strimzi-kafka-cluster" {
  depends_on = [
    helm_release.argocd,
    kubernetes_namespace.strimzi,
    kubectl_manifest.argocd-strimzi-kafka-operator
  ]
  yaml_body = templatefile(
    "../applications/configs/strimzi-kafka/00-argo-cd/strimzi-kafka-cluster.yaml",
    {
      REPO_URL = "git@github.com:DeiraTool/architecture/",
      REPO_BRANCH = "main",
      REPO_PATH = "applications/configs/strimzi-kafka/01-cluster/"
    }
  )
}