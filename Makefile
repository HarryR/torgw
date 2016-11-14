DTAG=torgw

all: docker

docker: Dockerfile make-services.sh
	./make-services.sh
	docker build --pull --force-rm -t $(DTAG) .

run:
	docker rm torgw || true
	docker run --name torgw -h torgw -ti --detach --restart=unless-stopped -p 9050:9050 $(DTAG)

stop:
	docker stop $$(docker ps --filter name=torgw -q)

shell:
	docker exec -ti torgw /bin/sh

kill:
	docker kill torgw

clean:
	rm -rf services
	docker rm $$(docker ps -a -q) || true
	docker rmi $$(docker images --filter dangling=true -q) || true

