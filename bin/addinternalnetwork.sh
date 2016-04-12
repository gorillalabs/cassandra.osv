VBoxManage controlvm "elasticsearch-1.osv" poweroff
VBoxManage modifyvm "elasticsearch-1.osv" --intnet2 "virtualcloud" --nic2 intnet --nictype2 virtio --cableconnected2 on --nicpromisc2 allow-all
VBoxManage startvm "elasticsearch-1.osv" --type headless

VBoxManage controlvm "elasticsearch-2.osv" poweroff
VBoxManage modifyvm "elasticsearch-2.osv" --intnet2 "virtualcloud" --nic2 intnet --nictype2 virtio --cableconnected2 on --nicpromisc2 allow-all
VBoxManage startvm "elasticsearch-2.osv" --type headless

VBoxManage controlvm "elasticsearch-3.osv" poweroff
VBoxManage modifyvm "elasticsearch-3.osv" --intnet2 "virtualcloud" --nic2 intnet --nictype2 virtio --cableconnected2 on --nicpromisc2 allow-all
VBoxManage startvm "elasticsearch-3.osv" --type headless
