# # Creating Namespace
# resource "kubernetes_namespace" "elasticsearch" {
#   metadata {
#     name = "elasticsearch"
#   }
# }

# # ElasticSearch Application
# resource "kubectl_manifest" "argocd-elasticsearch" {
#   depends_on = [
#     helm_release.argocd
#   ]
#   yaml_body = templatefile(
#     "../applications/configs/elasticsearch/elasticsearch.yaml",
#     {
#       REPO_URL = "git@github.com:DeiraTool/architecture/",
#       REPO_BRANCH = "main",
#       REPO_PATH = "applications/charts/elasticsearch/"
#     }
#   )
# }