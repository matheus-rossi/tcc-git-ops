FROM jupyter/pyspark-notebook:spark-3.3.2

USER 185

RUN pip3 install 'great_expectations[s3]'

WORKDIR /great_expectations

CMD exec /bin/bash -c "trap : TERM INT; sleep infinity & wait"
