FROM quay.io/actcat/devon_rex_base:1.0.8

ENV PHP_VERSION="7.1.9" \
    PATH="/root/.phpenv/shims:/root/.phpenv/bin:${PATH}:/root/.composer/vendor/bin" \
    COMPOSER_ALLOW_SUPERUSER=1

RUN apt-get update && apt-get install -y libmcrypt-dev libtidy-dev

RUN curl https://raw.githubusercontent.com/CHH/phpenv/f347f96d0722c38033ff4a886c67de9d72634e6e/bin/phpenv-install.sh | bash \
    && git clone https://github.com/php-build/php-build.git ~/.phpenv/plugins/php-build \
    && cd ~/.phpenv/plugins/php-build && git checkout 5d166fe92bdef960ece5703d5f91bfdc2b7e8b89

RUN phpenv install ${PHP_VERSION} && phpenv global ${PHP_VERSION}

RUN apt-get install -y php-pear

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY sider.ini /root/.phpenv/versions/${PHP_VERSION}/etc/conf.d/sider.ini
