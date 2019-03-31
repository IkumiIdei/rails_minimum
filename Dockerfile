# FROM 元となるイメージ
FROM ruby:2.5.1

# 必要なものをインストール
RUN apt-get update
RUN apt-get install -y nodejs

ENV APP_ROOT /app

# 作業ディレクトリを指定
# 指定したディレクトリが存在しない場合には作成してくれる
WORKDIR $APP_ROOT

# Gemfile、Gemfile.lockコピー
COPY Gemfile $APP_ROOT
COPY Gemfile.lock $APP_ROOT

# Gemfileを元にgemをインストール
RUN bundle install