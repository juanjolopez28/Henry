
url: https://phoenixnap.com/kb/install-docker-on-ubuntu-20-04
1-sudo apt update
2-sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
3.-curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
4-sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
5-apt-cache policy docker-ce
6-sudo apt install docker-ce -y
7-sudo systemctl status docker ->aqui sale error los corregimos con:
sudo /etc/init.d/docker start
--- sudo systemctl start docker --> debemos verificar que docker este corriendo

# Crear red hadoop
8-sudo docker network create --driver=bridge hadoop
9- chmod +x ./start-container.sh -> lo hacemos ejecutable
10- sudo ./start-container.sh
11-

hdfs dfs –rm –f /user/rawdata/example/odisea.tar.gz


