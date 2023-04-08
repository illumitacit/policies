FROM node:18-bullseye

COPY ./parcelentrypoint.sh /parcelentrypoint.sh
RUN chmod +x /parcelentrypoint.sh

VOLUME /code
VOLUME /code/node_modules
VOLUME /code/.parcel-cache

WORKDIR /code
ENTRYPOINT ["/parcelentrypoint.sh"]
