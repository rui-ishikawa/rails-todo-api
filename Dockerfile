# 使用するイメージとバージョン
FROM ruby:3.0
# Railsに必要なnode.js、mysql-client をインストール
RUN apt-get update -qq && apt-get install -y build-essential nodejs default-mysql-client

# 環境変数APP_PATHを設定
ENV APP_PATH /myapp

# myappディレクトリを作成
RUN mkdir $APP_PATH
# 作業ディレクトリを設定
WORKDIR $APP_PATH

# ローカルのGemファイルをコンテナにコピー
COPY Gemfile $APP_PATH/Gemfile
COPY Gemfile.lock $APP_PATH/Gemfile.lock
# bundle install実行
RUN bundle install

COPY . $APP_PATH

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]