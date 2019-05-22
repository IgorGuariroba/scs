```
docker stop cli-avaliacao-institucional

docker rm cli-avaliacao-institucional

docker run -d -it -v $PWD:/application --restart unless-stopped --name cli-avaliacao-institucional ceumanti/

docker-python-odbc:v0.3-slim-stretch /bin/bash

docker exec cli-avaliacao-institucional pip install -r requirements.txt
```
