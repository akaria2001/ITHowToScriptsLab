yum install gcc make -y
yum install kernel-headers -y
yum install "kernel-devel-uname-r == $(uname -r)" -y
cd /run/media/$USER/VBox_GAs_6.1.4
./VBoxLinuxAdditions.run
