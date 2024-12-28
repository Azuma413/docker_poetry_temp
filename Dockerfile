# FROM python:3.12-bullseye
FROM pytorch/pytorch:2.5.1-cuda11.8-cudnn9-runtime

WORKDIR /workspace/

# 環境変数の設定
ENV POETRY_VERSION=1.8.2 \
    POETRY_HOME="/root/.local" \
    PYTHONUNBUFFERED=1
ENV PATH="$POETRY_HOME/bin:$PATH"

# パッケージのインストール
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install --no-install-recommends -y curl \
    && apt-get install -y dos2unix \
    && curl -sSL https://install.python-poetry.org | python3 - \
    && poetry config virtualenvs.create false

# ローカルのデータをコンテナにコピー
COPY src/ /workspace/src/
COPY data/ /workspace/data/

# 初期化スクリプトをコピー
COPY init.sh /workspace/init.sh
RUN dos2unix /workspace/init.sh \
    && chmod +x /workspace/init.sh

# エントリポイントをスクリプトに設定
ENTRYPOINT ["/workspace/init.sh", "streamlit", "run", "src/app.py"]