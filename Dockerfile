FROM bctandoc/symfony-4-docker

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
