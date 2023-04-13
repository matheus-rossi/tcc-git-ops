# creating namespace
resource "kubernetes_namespace" "data-quality" {
  metadata {
    name = "data-quality"
  }
}

# Deploy Great Expectations Container
resource "kubectl_manifest" "great-expectations" {
  yaml_body = templatefile(
    "../applications/configs/great-expectations/great-expectations.yaml",
    { }
  )
  override_namespace = "data-quality"
}