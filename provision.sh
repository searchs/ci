#Setup Vagrant inspired machine
sudo apt-get update ;
sudo apt-get upgrade  && sudo apt-get dist-upgrade -y

sudo add-apt-repository ppa:webupd8team/java
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
sudo apt-get install oracle-java8-installer
sudo apt-get install oracle-java8-set-default
