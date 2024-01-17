# 基本イメージを指定
FROM python:3.8-slim

# 必要なパッケージをインストール
RUN apt-get update && apt-get install -y \
    git \
    cmake \
    llvm \
    llvm-dev \
    libtinfo-dev \
    zlib1g-dev \
    build-essential \
    g++

# 作業ディレクトリを設定
WORKDIR /app

# 必要なPythonパッケージをインストール
RUN pip install notebook onnx scipy numpy scikit-learn pandas seaborn torch torchvision onnxruntime onnx2pytorch tensorflow tf2onnx

# TVMをクローンしてインストール
RUN git clone --recursive https://github.com/apache/tvm tvm && \
    cd tvm && \
    mkdir build && cd build && \
    cmake -DUSE_LLVM=llvm-config-14 .. && \
    make -j$(nproc)

# 環境変数の設定
ENV PYTHONPATH /app/tvm/python:/app/tvm/topi/python:/app/tvm/nnvm/python:${PYTHONPATH}

# Jupyter Notebookの起動コマンドを指定
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--allow-root", "--NotebookApp.token=''", "--NotebookApp.password=''"]
