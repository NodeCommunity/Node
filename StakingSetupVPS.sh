#/bin/bash

cd ~
  
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade
sudo apt-get install -y nano htop git
sudo apt-get install -y software-properties-common
sudo apt-get install -y build-essential libtool autotools-dev pkg-config libssl-dev
sudo apt-get install -y libboost-all-dev
sudo apt-get install -y libevent-dev
sudo apt-get install -y libminiupnpc-dev
sudo apt-get install -y autoconf
sudo apt-get install -y automake unzip
sudo add-apt-repository  -y  ppa:bitcoin/bitcoin
sudo apt-get update
sudo apt-get install -y libdb4.8-dev libdb4.8++-dev
sudo apt-get install libzmq3-dev

cd /var
sudo touch swap.img
sudo chmod 600 swap.img
sudo dd if=/dev/zero of=/var/swap.img bs=1024k count=2000
sudo mkswap /var/swap.img
sudo swapon /var/swap.img
sudo free
sudo echo "/var/swap.img none swap sw 0 0" >> /etc/fstab
cd

wget https://github.com/NodeCommunity/Node/releases/download/1.1.0/node-1.1.0-x86_64-linux-gnu.tar.gz
tar -xzf node-1.1.0-x86_64-linux-gnu.tar.gz

sudo apt-get install -y ufw
sudo ufw allow ssh/tcp
sudo ufw limit ssh/tcp
sudo ufw logging on
echo "y" | sudo ufw enable
sudo ufw status
sudo ufw allow 8155/tcp
  
cd
mkdir -p .node
echo "staking=1" >> node.conf
echo "rpcuser=user"`shuf -i 100000-10000000 -n 1` >> node.conf
echo "rpcpassword=pass"`shuf -i 100000-10000000 -n 1` >> node.conf
echo "rpcallowip=127.0.0.1" >> node.conf
echo "listen=1" >> node.conf
echo "server=1" >> node.conf
echo "daemon=1" >> node.conf
echo "logtimestamps=1" >> node.conf
echo "maxconnections=256" >> node.conf
echo "addnode=95.179.158.77" >> node.conf
echo "addnode=136.244.109.123" >> node.conf
echo "port=8155" >> node.conf
mv node.conf .node

  
cd
./noded -daemon
sleep 30
./node-cli getinfo
sleep 5
./node-cli getnewaddress
echo "Use the address above to send your NOD coins to this server"
