# Scripts

A personal repository with scripts and configs for my Workstation.

### 1 - Get your Web IP via Curl

```
curl -s checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//'

Or shorter

curl ipinfo.io/ip
```

### 2 - UP Portainer Container Service

[Get Portainer](https://portainer.io/)

[Docker Compose File](portainer/docker-compose.yml)

### 3 - String and Regex

[How to easily remove characters using RegEx and PHP](string-and-regex.php)

### 4 - [Configure Git to use a proxy](https://gist.github.com/atmosmaciel/55adfe01e6f0f862112772fc39b73279)

## Docker

### Remove Images with `dangling=true`

`docker rmi $(docker images -q --filter "dangling=true")`

-------------------------------------------------------------------------

**Returns the IP of the local machine**: `hostname -I | awk '{print $1}'`

### Configure Desktop Entry

```
[Desktop Entry]
Name=Slack
StartupWMClass=Slack
Comment=Slack Desktop
GenericName=Slack Client for Linux
Exec=/usr/bin/slack %U
Icon=/usr/share/pixmaps/slack.png
Type=Application
StartupNotify=true
Categories=GNOME;GTK;Network;InstantMessaging;
MimeType=x-scheme-handler/slack;
```

**Postman Desktop Entry**

```
[Desktop Entry]
Name=Postman
StartupWMClass=Postman
Comment=Postman Desktop
GenericName=Postman Client for Linux
Exec=/opt/Postman/Postman %U
Icon=/opt/Postman/app/resources/app/assets/icon.png
Type=Application
StartupNotify=true
Categories=GNOME;GTK;Network;
```

-------------------------------------------------------------------------