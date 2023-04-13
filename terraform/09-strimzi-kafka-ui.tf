# Chart Kafka Ui DashBoard
resource "kubectl_manifest" "argocd-strimzi-kafka-ui" {
  depends_on = [
    helm_release.argocd,
    kubernetes_namespace.strimzi,
    kubectl_manifest.argocd-strimzi-kafka-cluster
  ]
  yaml_body = templatefile(
    "../applications/configs/strimzi-kafka/02-kafka-ui/kafka-ui.yaml",
    {
      REPO_URL = "git@github.com:DeiraTool/architecture/",
      REPO_BRANCH = "main",
      REPO_PATH = "applications/charts/kafka-ui/"
    }
  )
}

# Apply config maps with clusters to watch
resource "kubectl_manifest" "kafka-ui-clusters" {
  depends_on = [
    kubectl_manifest.argocd-strimzi-kafka-ui
  ]
  yaml_body = templatefile(
    "../applications/configs/strimzi-kafka/02-kafka-ui/kafka-cluster.yaml",
    { }
  )
  override_namespace = "strimzi"
}