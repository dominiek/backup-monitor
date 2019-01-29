FROM debian:8.11-slim

RUN apt-get -y update --fix-missing
RUN apt-get -y install curl bash cron python make python-virtualenv

RUN mkdir /workdir
WORKDIR /workdir
COPY install_gcloud_sdk.sh /workdir
RUN ./install_gcloud_sdk.sh
ADD . /workdir
RUN make env
CMD ["./entrypoint.sh"]
