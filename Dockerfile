FROM lscr.io/linuxserver/wireguard:latest

RUN apk add --no-cache socat findutils

COPY socat.sh /

RUN chmod +x /socat.sh