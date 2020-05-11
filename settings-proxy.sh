#! /bin/bash

RED="\033[1;31m"
GREEN="\033[1;32m"
NOCOLOR="\033[0m"
BLUE="\033[0;34m"

cat <<"EOF"

.d8888. d88888b d888888b d888888b d888888b d8b   db  d888b  .d8888.   d8888b. d8888b.  .d88b.  db    db db    db
88'  YP 88'     `~~88~~' `~~88~~'   `88'   888o  88 88' Y8b 88'  YP   88  `8D 88  `8D .8P  Y8. `8b  d8' `8b  d8'
`8bo.   88ooooo    88       88       88    88V8o 88 88      `8bo.     88oodD' 88oobY' 88    88  `8bd8'   `8bd8' 
  `Y8b. 88~~~~~    88       88       88    88 V8o88 88  ooo   `Y8b.   88~~~   88`8b   88    88  .dPYb.     88   
db   8D 88.        88       88      .88.   88  V888 88. ~8~ db   8D   88      88 `88. `8b  d8' .8P  Y8.    88   
`8888Y' Y88888P    YP       YP    Y888888P VP   V8P  Y888P  `8888Y'   88      88   YD  `Y88P'  YP    YP    YP

EOF

function CheckUser() {
	USER_ID=$(/usr/bin/id -u)
	return $USER_ID
}

function Menu() {
	echo ""
	echo ""
	echo -e "${GREEN}Selecione a sua distribuição Linux:"
	echo
	echo -e "${BLUE}1. Fedora"
	echo "2. Ubuntu"
	echo "3. Sair"
	echo ""

	echo -e "${GREEN}Qual a opção desejada? "

	read opcao

	case $opcao in

	1) Fedora ;;

	2) Ubuntu ;;

	3) exit ;;

	*)
		"Opção desconhecida."
		echo
		Principal
		;;

	esac

}

function Fedora() {
	clear
	# EX: /etc/dnf/dnf.conf
	dnf_conf="/etc/dnf/dnf.conf"
	# EX: /etc/enviroment
	enviroment="/etc/environment"

	read -p "Proxy: " proxy
	read -p "Matricula: " matricula
	read -sp "Senha: " senha

	echo ""

	if [ -z $proxy ] || [ -z $matricula ]; then
		echo -e "${RED}Atenção. Proxy e matrícula são obrigatórios!${NOCOLOR}"
		exit 1
	else
		read -p "Digite 1 para realizar a configuração: " confirmacao
		if [ $confirmacao -eq 1 ]; then
			if [ -e $dnf_conf ] && [ -e $enviroment ]; then
				echo "proxy=http://$proxy" >>$dnf_conf
				echo "proxy_username=$matricula" >>$dnf_conf
				echo "proxy_password=$senha" >>$dnf_conf

				echo "HTTP_PROXY=http://$matricula:$senha@$proxy" >>$enviroment
				echo "HTTPS_PROXY=http://$matricula:$senha@$proxy" >>$enviroment
				echo "FTP_PROXY=http://$matricula:$senha@$proxy" >>$enviroment

				echo "http_proxy=http://$matricula:$senha@$proxy" >>$enviroment
				echo "https_proxy=http://$matricula:$senha@$proxy" >>$enviroment
				echo "ftp_proxy=http://$matricula:$senha@$proxy" >>$enviroment
				echo "no_proxy=http://$matricula:$senha@$proxy" >>$enviroment

				export HTTP_PROXY HTTPS_PROXY FTP_PROXY http_proxy https_proxy ftp_proxy no_proxy >>$enviroment
				echo -e "${GREEN}Configuração realizada com sucesso!${NOCOLOR}"
			else
				echo -e "${RED}Ops, configuração cancelada, seus arquivos de configuração não existem!${NOCOLOR}"
				exit 1
			fi
		else
			echo -e "${RED}Operação cancelada, você não digitou um valor válido${NOCOLOR}"
			exit 1
		fi
	fi
	Menu
}

function Ubuntu() {
	clear
	# EX: /etc/apt/apt.conf
	apt_conf="/etc/apt/apt.conf"
	
	# EX: /etc/enviroment
	enviroment="/etc/environment"
	
	profile="/etc/profile"

	read -p "Proxy: " proxy
	read -p "Matricula: " matricula
	read -sp "Senha: " senha

	echo ""

	if [ -z $proxy ] || [ -z $matricula ]; then
		echo -e "${RED}Atenção. Proxy e matrícula são obrigatórios!${NOCOLOR}"
		exit 1
	else
		read -p "Digite 1 para realizar a configuração: " confirmacao
		if [ $confirmacao -eq 1 ]; then
			if [ -e $apt_conf ] && [ -e $enviroment ]; then
				echo "
				Acquire {
					HTTP::Proxy $matricula:$senha@$proxy;
					FTP::Proxy $matricula:$senha@$proxy;
				}" >>$apt_conf
				
				echo "
				http_proxy=http://$matricula:$senha@$proxy
				ftp_proxy=http://$matricula:$senha@$proxy
				Acquire {
					HTTP::Proxy $matricula:$senha@$proxy;
					FTP::Proxy $matricula:$senha@$proxy;
				};" >>$enviroment

				echo 'alias wget="wget --proxy-user='${matricula}' --proxy-passwd='${senha}'"'>>$enviroment

				echo "export http_proxy ftp_proxy" >>$profile
				
				echo -e "${GREEN}Configuração realizada com sucesso!${NOCOLOR}"
			else
				echo -e "${RED}Ops, configuração cancelada, seus arquivos de configuração não existem!${NOCOLOR}"
				exit 1
			fi
		else
			echo -e "${RED}Operação cancelada, você não digitou um valor válido${NOCOLOR}"
			exit 1
		fi
	fi
	Menu
}

CheckUser
if [ $? -ne "0" ]; then
	echo -e "${RED}Voce não é root, execute como super-usuário!n${NOCOLOR}"
	exit 1
else
	Menu
fi
