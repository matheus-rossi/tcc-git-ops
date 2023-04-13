# creating namespace
resource "kubernetes_namespace" "argocd" {
  metadata {
    name = "argocd"
  }
}

# Granting Access to Private Repo
resource "kubectl_manifest" "argocd-repositories" {
  yaml_body = templatefile(
    "../applications/configs/argo-cd/argo-cd.yaml",
    { }
  )
  override_namespace = "argocd"
}

# creating argocd application
resource "helm_release" "argocd" {

  name = "argocd"
  chart = "../applications/charts/argo-cd"
  namespace = "argocd"
  #version    = "v2.6.3"
  #force_update = "true"
  #recreate_pods = "true"

}