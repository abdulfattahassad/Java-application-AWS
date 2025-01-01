#!/bin/bash
sudo yum install java-1.8.0-amazon-corretto-devel
cd /opt
wget https://download.sonatype.com/nexus/3/nexus-3.65.0-02-unix.tar.gz
tar -xvf nexus-3.65.0-02-unix.tar.gz
sudo mv nexus-3.65.0-02 nexus
sudo adduser nexus
sudo chown -R nexus:nexus /opt/nexus
sudo chown -R nexus:nexus /opt/sonatype-work
sudo vi /opt/nexus/bin/nexus.rc
run_as_user="nexus"
sudo vi /etc/systemd/system/nexus.service

[Unit]
Description=nexus service
After=network.target
[Service]
Type=forking
LimitNOFILE=65536
User=nexus
Group=nexus
ExecStart=/opt/nexus/bin/nexus start
ExecStop=/opt/nexus/bin/nexus stop
User=nexus
Restart=on-abort
[Install]
WantedBy=multi-user.target
:wq
sudo ln -s /opt/nexus/bin/nexus /etc/init.d/nexus
sudo chkconfig --add nexus
sudo chkconfig --levels 345 nexus on
sudo service nexus start
