# -------------------
# BEGIN STAGE BUILD
# -------------------

FROM debian:11 as stage

WORKDIR /jars

RUN apt-get update \
    && apt install -y curl 

# Jars to download into stage build
RUN curl -LJO https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-aws/3.3.4/hadoop-aws-3.3.4.jar
RUN curl -LJO https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk-bundle/1.12.433/aws-java-sdk-bundle-1.12.433.jar

# -------------------
# END STAGE BUILD
# -------------------


FROM apache/spark:v3.3.2

# Jars to copy from stage into spark base image
COPY --from=stage /jars /opt/spark/jars

USER 0

RUN apt-get update \
    && apt install -y python3 python3-pip \
    && pip3 install --upgrade pip setuptools \
    && rm -r /root/.cache \
    && rm -rf /var/cache/apt/* 

RUN pip3 install pyspark==3.3.2 \
    && pip3 install 

WORKDIR /opt/spark/work-dir

ENTRYPOINT ["/opt/entrypoint.sh"]

ARG spark_uid=185

USER 185