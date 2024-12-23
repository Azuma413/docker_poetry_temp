# 使い方
### セットアップ
- docker-compose.yaml\
`docker-compose.yaml`の`replaceme`（3,5行目）を適当な名前に入れ替える．
- Dockerfile\
baseにするイメージを決める．\
CUDA使わないなら`python:3.12-bullseye`，CUDA使うなら[ここ](https://catalog.ngc.nvidia.com/orgs/nvidia/containers/pytorch/tags)とか[ここ](https://gitlab.com/nvidia/container-images/cuda/blob/master/doc/supported-tags.md)から適当なものを選んで使う．
- Imageをビルドする\
ターミナルで以下のコマンドを実行する
```
docker compose up --build
```
### 通常操作
- docker環境に入る\
VSCodeのリモートエクスプローラー拡張機能の右上タブで，`開発コンテナー`を選択する．\
すると，このプロジェクトのフォルダ名のコンテナが表示されるので，矢印マークで入る．\
（この時，他のコンテナを起動していると失敗するので注意）\
`/workspace`にファイルがコピーされているので，そのフォルダを開く．
- ライブラリを追加する\
コンテナ内で以下のコマンドを実行する．
```
poetry add library_name
```
- データを格納する\
`data/`にデータを格納する
- アプリを実装する\
`src/gui.py`に実装する
- githubに上げる\
コンテナを閉じて，ローカルからpushする
### Cloud Runで動かす
追記予定
### ページを開く
```
docker compose up --build
```
上のコマンドを実行してから，[localhost:8501](http://localhost:8501/)にアクセスする．

# Dockerfile
### CUDA使うなら
```
FROM nvcr.io/nvidia/pytorch:24.12-py3
```
```
FROM 11.8.0-runtime-ubuntu22.04
```
### CUDA使わないなら
```
FROM python:3.12-bullseye
```