FROM ruby:2.5

WORKDIR /usr/src/anonymizer

ARG UID=1000
ARG GID=1000

USER root

RUN apt-get update \
    && apt-get install -y \
        default-mysql-client \
        rsync \
        build-essential \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Create anonymizer user
RUN if [ ! `id -g anonymizer &> /dev/null` ]; then groupadd -f -g ${GID} anonymizer; fi \
    && if [ ! `id -u anonymizer &> /dev/null` ]; then useradd --shell /bin/bash -u ${UID} -g ${GID} -m anonymizer; fi

COPY --chown=1000:1000 $pwd .

RUN mkdir /backup && chown anonymizer -R /backup && mkdir -p vendor && chown anonymizer -R vendor

USER anonymizer

RUN bundle install --deployment --force --path vendor/cache

ENTRYPOINT ["/usr/src/anonymizer/start.sh"]