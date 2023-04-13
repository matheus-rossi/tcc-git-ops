# Strimzi Kafka Cluster Application
resource "kubectl_manifest" "kafka-python-clients" {
  depends_on = [
    helm_release.argocd,
    kubernetes_namespace.strimzi,
    kubectl_manifest.argocd-strimzi-kafka-operator
  ]
  yaml_body = templatefile(
    "../applications/configs/strimzi-kafka/03-kafka-admin/kafka-admin.yaml",
    { }
  )
  override_namespace =  "strimzi"
}