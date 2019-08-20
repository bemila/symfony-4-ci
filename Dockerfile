FROM bctandoc/symfony-4-docker

#Install intl
RUN buildDeps="libpq-dev libzip-dev libicu-dev libfreetype6-dev libmagickwand-6.q16-dev" && \
    apt-get update && \
    apt-get install -y $buildDeps --no-install-recommends && \
    ln -s /usr/lib/x86_64-linux-gnu/ImageMagick-6.8.9/bin-Q16/MagickWand-config /usr/bin && \
    pecl install imagick && \
    echo "extension=imagick.so" > /usr/local/etc/php/conf.d/ext-imagick.ini && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    docker-php-ext-install intl

#Install symfony dependence
RUN apt-get update

#Install gnumeric
RUN apt-get install -y --no-install-recommends gnumeric

#Install node.js
RUN curl -sL https://deb.nodesource.com/setup_11.x | bash - && \
    apt-get install -y nodejs
    
#Install yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt update && \
    apt install --no-install-recommends yarn
