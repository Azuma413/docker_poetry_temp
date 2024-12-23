FROM python:3.12-bullseye
# FROM 11.8.0-runtime-ubuntu22.04

WORKDIR /workspace/

# poetryをpackage-modeで使っているため、README.mdがないとpoetry installに失敗する
COPY pyproject.toml poetry.lock README.md /workspace/
COPY src/ /workspace/src/
COPY data/ /workspace/data/

ENV POETRY_VERSION=1.8.2 \
    POETRY_HOME="/root/.local" \
    PYTHONUNBUFFERED=1
ENV PATH="$POETRY_HOME/bin:$PATH"

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install --no-install-recommends -y curl \
    && curl -sSL https://install.python-poetry.org | python3 - \
    && poetry config virtualenvs.create false \
    && poetry install

ENTRYPOINT ["streamlit", "run", "src/gui.py"]