#!/bin/bash


# Setup VirtualBox
if [[ `facter virtual` == "virtualbox" ]]; then
  mkdir -p /mnt/virtualbox
  mount -o loop /home/vagrant/VBoxGuest*.iso /mnt/virtualbox
  sh /mnt/virtualbox/VBoxLinuxAdditions.run
  ln -s /opt/VBoxGuestAdditions-*/lib/VBoxGuestAdditions /usr/lib/VBoxGuestAdditions
  unmount /mnt/virtualbox
  rm -rf /home/vagrant/VBoxGuest*.iso
fi

# Setup VMWare
if [[ `facter virtual` == "vmware" ]]; then
  mkfir -p /mnt/vmware
  mount -o loop /home/vagrant/linux.iso /mnt/vmware

  cd /tmp
  tar xzf /mnt/vmware/VMwareTools-*.tar.gz

  unmount /mnt/vmware
  rm -rf /home/vagrant/linux.iso

  /tmp/vmware-tools-distrib/vmware-install.pl -d
  rm -rf /tmp/vmware-tools-distrib
fi


