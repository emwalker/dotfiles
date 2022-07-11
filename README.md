# dotfiles

Personal config files and steps for setting up a development environment from scratch.

* [Chrome](https://www.google.com/chrome/)
* [Lastpass](https://lastpass.com/misc_download2.php)
* [VS Code](https://code.visualstudio.com/download) (merko's green theme)
* [Zoom](https://flathub.org/apps/details/us.zoom.Zoom)

### Pairing Apple keyboard

Instructions [here](https://techtips.easycloudsolutions.com/2020/04/28/how-to-setup-apple-wireless-keyboard-on-ubuntu/).

```sh
$ bluetoothctl
# ...
```

### Zsh

```sh
$ sudo apt install -y zsh
# https://github.com/junegunn/fzf
$ git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
# https://ohmyz.sh/#install
$ sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
$ sudo apt install -y tmux
```

### Ubuntu

* [Configure swap](https://askubuntu.com/questions/103915/how-do-i-configure-swappiness)
* [Configuring power mode](https://askubuntu.com/a/1047763/1047763) (can also be done in the UI now)

```sh
$ sudo apt install -y htop netcat whois
$ cat /proc/sys/vm/swappiness
$ sudo vi /etc/sysctl.conf
$ sudo sysctl -p
$ cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_governors
$ echo performance | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
```

### Git

```sh
$ sudo apt install -y gh
$ sudo apt install -y git
$ sudo apt install -y vim
$ git config --global user.name "Eric Walker"
$ git config --global user.email "eric.walker@gmail.com"
```

### Rust

* Download [overmind](https://github.com/DarthSim/overmind#installation)

```sh
$ sudo apt install -y ruby
# https://rustup.rs/
$ curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
$ sudo apt install -y build-essential
# OpenSSL - https://github.com/sfackler/rust-openssl/issues/855#issuecomment-450057552
$ sudo apt-get install pkg-config libssl-dev
$ cd code/digraph/rust
$ cargo test
```

### Node / Yarn

Instructions [here](https://github.com/nvm-sh/nvm#install--update-script).

```sh
$ curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
$ nvm ls-remote
# Needed for OpenSSL
$ nvm install --lts
$ corepack enable
$ npm install --global yarn
```

### Spotify

Instructions [here](https://www.spotify.com/us/download/linux/).

```sh
$ curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add -
$ echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
$ sudo apt-get update && sudo apt-get install spotify-client
```

### Linode / Kubernetes

* Login [here](https://login.linode.com/login) (via GitHub).
* [Kubetcl](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/)

```sh
$ curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
$ curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
$ echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
$ sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
$ k get pods -A
# Postgres password
```

### Postgres

* Instructions [here](https://www.digitalocean.com/community/tutorials/how-to-install-postgresql-on-ubuntu-20-04-quickstart)
* [Configuring postgres user](https://dba.stackexchange.com/a/83233)

```sh
$ sudo apt update
$ sudo apt upgrade
$ sudo apt install -y postgresql postgresql-contrib
$ sudo systemctl start postgresql.service
$ sudo -i -u postgres
$ createdb digraph_dev
$ exit
$ sudo vi /etc/postgresql/14/main/pg_hba.conf # Change "peer" to "trust" for the row with an ip address
$ sudo systemctl restart postgresql.service
$ psql "postgres://postgres:@localhost:5432/digraph_dev"
```

### Docker

Instructions for [Ubuntu 22.04](https://www.linuxtechi.com/install-use-docker-on-ubuntu/).

```sh
$ sudo apt install apt-transport-https ca-certificates curl software-properties-common
$  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
$ echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
$ sudo apt-get update
$ sudo apt install docker-ce docker-ce-cli containerd.io -y
$ sudo usermod -aG docker $USER
$ newgrp docker
$ docker version
$ sudo systemctl status docker
$ docker run hello-world
```

### Digraph

* [GitHub OAuth settings](https://github.com/settings/applications/948429)

```sh
$ sudo apt install -y redis
$ nc -zv localhost 6379
$ redis-cli
$ mkdir code
$ gh repo clone emwalker/digraph
$ pushd digraph
$ pushd javascript
$ yarn install
$ yarn relay
$ popd ..
$ pushd rust
$ cargo test
$ popd
$ make proxy
$ make load-fixtures
$ vi .env
DIGRAPH_POSTGRES_CONNECTION=postgres://postgres:@localhost:5432/digraph_dev
DIGRAPH_SERVER_SECRET="..."
DIGRAPH_GITHUB_CLIENT_ID="..."
DIGRAPH_GITHUB_CLIENT_SECRET="..."
DIGRAPH_DATA_DIRECTORY="../../digraph-data"
$ make start-dev
$ make build-client
$ make build-executables
$ pushd rust
$ RUST_LOG=warn,digraph=info target/release/export --data-dir "../../digraph-data"
$ popd
$ make start-prod
```
