FROM alpine:edge

ENV PACKAGES=" \
	runit \
	haproxy \
	tor \
"

RUN echo \
	&& apk update \
	&& apk add $PACKAGES \
	&& rm -rf /tmp/* /var/cache/apk/*

ADD ./haproxy.cfg /etc/haproxy/haproxy.cfg
ADD ./entrypoint.sh /
ADD services /etc/sv

EXPOSE 9050

ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]
