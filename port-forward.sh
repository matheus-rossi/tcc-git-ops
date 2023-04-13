while true; do kubectl port-forward --namespace metabase svc/metabase 3000:80; done &
while true; do kubectl port-forward --namespace monitoring svc/monitoring-grafana 3001:80; done &
while true; do kubectl port-forward --namespace airflow svc/airflow-webserver 8080:8080; done &
while true; do kubectl port-forward --namespace argocd svc/argocd-server 8081:80; done &
while true; do kubectl port-forward --namespace minio svc/minio 9001:9001; done &
while true; do kubectl port-forward --namespace datahub svc/datahub-datahub-frontend 9002:9002; done &