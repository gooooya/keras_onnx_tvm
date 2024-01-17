@echo off
set IMAGE_NAME=onnx-test
set CONTAINER_NAME=onnx-test

FOR /F "tokens=*" %%i IN ('docker images -q %IMAGE_NAME%') DO SET IMAGE_EXISTS=%%i
IF "%IMAGE_EXISTS%"=="" (
    echo �C���[�W�����݂��Ȃ����߁A�r���h���J�n���܂��B
    docker build -t %IMAGE_NAME% .
) ELSE (
    echo �w�肳�ꂽ�C���[�W�͊��ɑ��݂��܂��B
)

docker run -p 8888:8888 %CONTAINER_NAME%