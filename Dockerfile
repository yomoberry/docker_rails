# Debian(v11) rubyつき
FROM ruby:2.7.5-bullseye

ENV APP_HOME /var/app

# パッケージアップデート
RUN apt -y update && apt -y upgrade
RUN apt -y install \
    vim \
    git
    
# nodejs
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt -y install nodejs
RUN wget https://github.com/yarnpkg/yarn/releases/download/v1.9.4/yarn_1.9.4_all.deb \
    && dpkg -i yarn_1.9.4_all.deb

WORKDIR $APP_HOME

# Railsプロジェクト初期化
RUN gem install rails '< 7'


CMD ["/bin/bash"]