FROM michaelcataldo/spark-2.4.4:1.0

ENV PYSPARK_PYTHON="python3"
ENV PYSPARK_DRIVER_PYTHON="jupyter"
ENV PYSPARK_DRIVER_PYTHON_OPTS="lab --ip 0.0.0.0 --no-browser --allow-root"

RUN set -ex \
    && apt-get update -yqq \
    && apt-get upgrade -yqq \
    && apt-get install -yqq --no-install-recommends \
        python3-pip \
    && pip3 install --upgrade setuptools wheel \
    && pip3 install jupyterlab

COPY scripts/entrypoint.sh /entrypoint.sh

VOLUME /usr/local/spark

EXPOSE 8888
WORKDIR /usr/local/spark
ENTRYPOINT [ "/entrypoint.sh" ]