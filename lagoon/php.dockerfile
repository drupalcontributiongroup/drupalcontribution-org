ARG CLI_IMAGE
FROM ${CLI_IMAGE} as cli

FROM uselagoon/php-8.1-fpm:latest
RUN apk add --no-cache gmp-dev
RUN docker-php-ext-install -j4 gmp
COPY --from=cli /app /app
