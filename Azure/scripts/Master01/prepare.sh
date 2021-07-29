#ACTUALIZAR NODO
echo -e "\e[33m actualizar nodo \e[0m"
sudo apt-get -y update

sudo apt-get update

sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release


#AGREGAR REPOSITORIO DOCKER
echo -e "\e[33m agregar repositorio docker \e[0m"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null


#INSTALAR DOCKER
echo -e "\e[33m Instalar docker \e[0m"
sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io
