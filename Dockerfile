# Dockerfile

FROM ruby:latest as builder

RUN curl https://deb.nodesource.com/setup_14.x | bash     && curl https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -     && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update -qq && apt-get install -y \
    postgresql-client build-essential yarn nodejs \
    libnotify-dev && \
    rm -rf /var/lib/apt/lists/*

FROM builder as rails-app

# Permitir accesso à porta 3000
EXPOSE 3000
EXPOSE 3035

# Permissões
ARG USER_ID=1000
ARG GROUP_ID=1000
ARG APP_DIR=/home/user/myapp

# Criar usuário non-root
RUN groupadd --gid $GROUP_ID user
RUN useradd --no-log-init --uid $USER_ID --gid $GROUP_ID user --create-home

# entrypoint
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

RUN mkdir -p $APP_DIR
RUN chown -R $USER_ID:$GROUP_ID $APP_DIR


# Define o usuário que está rodando o container
USER $USER_ID:$GROUP_ID

WORKDIR $APP_DIR

# Dependências do rails
COPY --chown=$USER_ID:$GROUP_ID Gemfile* $APP_DIR/

#  webpacker/node_modules
COPY --chown=$USER_ID:$GROUP_ID package.json $APP_DIR
COPY --chown=$USER_ID:$GROUP_ID yarn.lock $APP_DIR

RUN bundle install

COPY --chown=$USER_ID:$GROUP_ID . .

RUN yarn install --check-files


ENTRYPOINT ["/usr/bin/entrypoint.sh"]

# Startando o processo principal
CMD ["rails", "server", "-b", "0.0.0.0"]