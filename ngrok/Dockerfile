FROM alpine AS build

ADD https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip /tmp/ngrok.zip
RUN unzip -d /tmp /tmp/ngrok.zip

FROM alpine
COPY --from=build /tmp/ngrok /bin/ngrok
ENTRYPOINT [ "/bin/ngrok" ]
