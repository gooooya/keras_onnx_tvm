@echo off
set IMAGE_NAME=onnx-test
set CONTAINER_NAME=onnx-test

FOR /F "tokens=*" %%i IN ('docker images -q %IMAGE_NAME%') DO SET IMAGE_EXISTS=%%i
IF "%IMAGE_EXISTS%"=="" (
    echo イメージが存在しないため、ビルドを開始します。
    docker build -t %IMAGE_NAME% .
) ELSE (
    echo 指定されたイメージは既に存在します。
)

docker run -p 8888:8888 %CONTAINER_NAME%