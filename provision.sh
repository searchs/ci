#Setup test or dev environment using Vagrant
#
apt-get -y update ;
apt-get -y upgrade  && sudo apt-get dist-upgrade -y
apt-get -y install linux-headers-$(uname -r) build-essential
apt-get -y install git-core zlib1g-dev libssl-dev libreadline5-dev libcurl4-openssl-dev libyaml-dev curl
apt-get clean
apt-get install -y python-software-properties debconf-utils
add-apt-repository -y ppa:webupd8team/java
apt-get update
echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | sudo debconf-set-selections
apt-get install -y oracle-java8-installer
apt-get install -y curl
java -version
#sudo apt-get install oracle-java8-set-default
command curl -sSL https://rvm.io/mpapis.asc | gpg --import -
\curl -sSL https://get.rvm.io | bash -s stable
source /home/vagrant/.rvm/scripts/rvm
rvm reload
rvm install ruby-2.3.0
rvm list
ruby -v

exit
