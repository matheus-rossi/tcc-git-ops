# creating namespace
resource "kubernetes_namespace" "ubuntu" {
  metadata {
    name = "ubuntu"
  }
}

# Deploy Ubuntu Debug Machine
resource "kubectl_manifest" "ubuntu-debug" {
  yaml_body = templatefile(
    "../applications/configs/ubuntu/ubuntu.yaml",
    { }
  )
  override_namespace = "ubuntu"
}