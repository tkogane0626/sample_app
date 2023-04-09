# ベースイメージを設定
FROM ruby:3.1.2

# 環境変数を設定
ENV LANG C.UTF-8
ENV TZ="Asia/Tokyo"

# アプリケーションの依存関係をインストール
RUN apt-get update -qq && \
    apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs

# railsをインストール
RUN gem install rails -v 7.0.4

# 作業ディレクトリを設定
WORKDIR /app

# 作業ディレクトリにコピー
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

# bundle install
RUN bundle config set force_ruby_platform true
RUN bundle install

# ポートを設定
EXPOSE 3000
