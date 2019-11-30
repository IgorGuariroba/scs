#!/bin/bash

echo "Configuring proxy settings"
http_proxy="http://username:password@proxy.domain.br:3128"
HTTP_PROXY="http://username:password@proxy.domain.br:3128"
https_proxy="http://username:password@proxy.domain.br:3128"
HTTPS_PROXY="http://username:password@proxy.domain.br:3128"
ftp_proxy="http://username:password@proxy.domain.br:3128"
FTP_PROXY="http://username:password@proxy.domain.br:3128"
no_proxy="localhost,127.0.0.1,127.0.0.0/8"
export http_proxy https_proxy ftp_proxy HTTP_PROXY HTTPS_PROXY FTP_PROXY no_proxy

echo "Instalando pacotes de requirements.txt necessarios a aplicacao Top Five Backend..."
pip install -r requirements.txt
echo "Iniciando aplicacao..."
waitress-serve --call --listen=0.0.0.0:5000 app:create_app
