### Config Docker Compose in Pycharm

I had the same problem in Rubymine. This SO thread solved it for me:

- Go to Settings >> Build, Execution, Deployment >> Docker

- Select "TCP socket"

- Enter 'unix:///var/run/docker.sock' under "Engine API URL"
