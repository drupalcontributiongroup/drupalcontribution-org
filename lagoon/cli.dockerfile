FROM uselagoon/php-8.1-cli-drupal:latest
RUN apk add --no-cache gmp-dev
RUN docker-php-ext-install -j4 gmp
COPY composer.* /app/
COPY assets /app/assets
RUN composer install --no-dev
COPY . /app
RUN mkdir -p -v -m775 /app/web/sites/default/files
RUN mkdir -p -v -m775 /app/private

# Define where the Drupal Root is located
ENV WEBROOT=web
