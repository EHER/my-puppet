    sudo apt-get install -y puppet git make
    sudo rm -rf /etc/puppet
    sudo git clone git://github.com/EHER/my-puppet.git /etc/puppet
    cd /etc/puppet
    sudo make install
    sudo make apply

or

    curl -L http://bit.ly/O7vM9U | sh
