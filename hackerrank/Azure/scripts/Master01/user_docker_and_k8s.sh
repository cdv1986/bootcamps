#AGREGAR USUARIO KUBERNETES A GRUPO DOCKER
echo -e "\e[33m Agregar usuario kubernetes a grupo docker \e[0m"
sudo systemctl status docker

sudo usermod -aG docker ${USER}
sudo usermod -aG docker kubernetes

#HABILITAR E INICIAR DOCKER
echo -e "\e[33m Habilitar e iniciar docker \e[0m"
sudo systemctl enable docker.service & sudo systemctl start docker.service

#DESACTIVAR FW
echo -e "\e[33m Desactivar FW \e[0m"
sudo systemctl disable firewalld & sudo systemctl stop firewalld

#CONFIGURAR IPTABLES PARA RECIBIR TRAFICO BRIDGE
echo -e "\e[33m configurar iptables para trafico bridge \e[0m"
sudo cp /etc/sysctl.conf /etc/sysctl.conf.bkp
sudo echo "net.bridge.bridge-nf-call-iptables=1" >> /etc/sysctl.conf

#HABILITAR TCPFORWARDING EN SSH
sudo echo -e "\e[33m habilitar tcpforwarding en ssh \e[0m"
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bkp
sudo sed -i 's/#AllowTcpForwarding yes/AllowTcpForwarding yes/g' /etc/ssh/sshd_config

#DESACTIVASR SWAP
sudo echo -e "\e[33m desactivar swap \e[0m"
sudo sed -i 's\/dev/mapper/ol-swap\#/dev/mapper/ol-swap\g' /etc/fstab

#REBOOTEAR
echo -e "\e[33m rebootear \e[0m"
sudo reboot
