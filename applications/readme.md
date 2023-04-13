# How to

## MinIO
### Create user

1. Open Console
2. Go to -> http://localhost:40961/settings/configurations/region
3. Set region name (example: local)
4. Go to -> http://localhost:40961/identity/account/new-account
5. accesskey = user
6. secretkey = password


## Airflow

### Create connections

In our enviroment, we need the following connections created manualy in UI:

Or you can export other airflow instances, following these docs:

https://airflow.apache.org/docs/apache-airflow/stable/howto/usage-cli.html#cli-export-connections


### Examples

### Kubernetes
```
  "kubernetes_default": {
    "conn_type": "kubernetes",
    "description": "",
    "login": "admin",
    "password": "admin",
    "host": "",
    "port": null,
    "schema": "",
    "extra": "{\"in_cluster\": true, \"disable_verify_ssl\": false, \"disable_tcp_keepalive\": false}"
  }
```

#### Postgres 
```
  "postgresql": {
    "conn_type": "postgres",
    "description": "",
    "login": "postgres",
    "password": "postgres",
    "host": "postgresql.postgresql.svc",
    "port": 5432,
    "schema": "",
    "extra": ""
  }
```

#### Datahub GMS (REST)
```
  "datahub_rest_default": {
    "conn_type": "datahub_rest",
    "description": "",
    "login": "admin",
    "password": null,
    "host": "http://datahub-datahub-gms.datahub.svc:8080",
    "port": null,
    "schema": "",
    "extra": ""
  }
```

#### MinIO (S3)
```

  "minio": {
    "conn_type": "aws",
    "description": "",
    "login": "minio",
    "password": "36764400",
    "host": "",
    "port": null,
    "schema": "",
    "extra": "{\"endpoint_url\": \"http://minio.minio.svc:9000\", \"region_name\": \"local\"}"
  }
```

## Spark

https://github.com/kubernetes/git-sync/blob/master/docs/ssh.md