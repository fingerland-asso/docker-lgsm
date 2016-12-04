CONTAINER=csgoserver
VOLUME=/data/dockers/${CONTAINER}
IMAGE=fingerland/${CONTAINER}
OPTIONS=-v ${VOLUME}:/server

help:
	@echo "Fingerland LGSM server (docker builder)"

build:
	@docker -H tcp://127.0.0.1:2375 build -t ${IMAGE} .

volume:
	@sudo mkdir -p ${VOLUME}
	@sudo chown -R 1000:1000 ${VOLUME}

run: volume
	@docker run -ti ${OPTIONS} ${IMAGE}