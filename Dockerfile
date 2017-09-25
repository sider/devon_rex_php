FROM quay.io/actcat/devon_rex_base:1.0.6

ENV PHP_VERSION 7.1.9

RUN apt-get update && apt-get install -y libmcrypt-dev libtidy-dev

RUN curl https://raw.githubusercontent.com/CHH/phpenv/f347f96d0722c38033ff4a886c67de9d72634e6e/bin/phpenv-install.sh | bash \
    && git clone https://github.com/php-build/php-build.git ~/.phpenv/plugins/php-build \
    && cd ~/.phpenv/plugins/php-build && git checkout 5d166fe92bdef960ece5703d5f91bfdc2b7e8b89 && cd - \
    && echo 'export PATH="$HOME/.phpenv/bin:$PATH"' >> ~/.bash_profile \
    && echo 'eval "$(phpenv init -)"' >> ~/.bash_profile \
    && echo '. ~/.bash_profile' >> ~/.bashrc \
    && . ~/.bash_profile \
    && phpenv install ${PHP_VERSION} \
    && phpenv global ${PHP_VERSION}

RUN apt-get install -y php-pear
