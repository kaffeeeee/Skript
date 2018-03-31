#Git installation
 apt-get install git

#Uninstall older versions of Docker called “docker” or “docker-engine“ along with associated dependencies. If your system does not have a Docker package, skip the below step.
 apt-get -y remove docker docker-engine docker.io

#Install the below packages to have “apt” get the support of https method.
 apt-get update
 apt-get install -y apt-transport-https ca-certificates wget software-properties-common

#Add the GPG key for Docker repository on your system.
wget https://download.docker.com/linux/debian/gpg 
 apt-key add gpg

#Add the official Docker repository to the system by running below command in the terminal.
echo "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" |  tee -a /etc/apt/sources.list.d/docker.list

#Update the apt database.
 apt-get update

#Make sure you are installing Docker from the official repository, not from the default Debian repository.
 apt-cache policy docker-ce

#Install Docker using the “apt-get” command.
 apt-get -y install docker-ce

 #
 #ist hiermit alles Ueberfluessig?
 #
 curl -sSL https://get.docker.com | sh
 
#To enable Docker service to autostart on system boot, run:
 systemctl enable docker

#Create a group “docker“, if it does not exist.
 groupadd docker

#Add your user to docker group, replace “raj” with your username.
 useradd chris

#Add a user to docker group.
 usermod -aG docker chris
 usermod -aG root chris
 usermod -aG docker pi

#scheiss ifconfig installieren
apt-get install net-tools

#Verzeichnise erstellen
mkdir /APPL
mkdir /APPL/DATA
mkdir /APPL/DATA/logs
mkdir /APPL/DATA/shared
mkdir /APPL/DATA/appdata
#Nur Master (IF oder Auskommentieren?)
mkdir /APPL/DATA/master_logs
mkdir /APPL/DATA/shared/skripte
mkdir /APPL/DATA/shared/cluster_ID
mkdir /APPL/DATA/shared/images

#Hosts
echo "192.168.178.230 pimaster" >> /etc/hosts
echo "192.168.178.231 pislave1" >> /etc/hosts
echo "192.168.178.232 pislave2" >> /etc/hosts

#Platten Freigeben
 apt-get install nfs-common 
apt install nfs-kernel-server
apt-get install portmap
#Die Datei auslagern und einfach kopieren
#touch /etc/exports
# desktop darf lesen und schreiben (rw)
#
#/PFAD/ZUR/FREIGABE1      notebook(ro,async) desktop(rw,async)
#
# Freigabe gilt für alle IPs von 192.168.1.1 bis 192.168.1.255, mit Lese-/Schreibrechten:
#/PFAD/ZUR/FREIGABE3       192.168.178.0/255.255.255.0(rw,async)
#/var/nfsroot     example_IP/17(rw,root_squash,subtree_check)
##
echo "/APPL/DATA/shared/ 192.168.178.0/255.255.255.0(rw,root_squash,subtree_check)" >> /etc/exports
#abfrage j / n oder if hostname?
echo "/APPL/DATA/appdata 192.168.178.0/255.255.255.0(rw,root_squash,subtree_check)" >> /etc/exports
#abfrage j / n
echo "/APPL/DATA/logs 192.168.178.0/255.255.255.0(rw,root_squash,subtree_check)" >> /etc/exports

#Freigaben Einbinden
#/etc/fstab
#192.168.6.13:/home /media/server nfs rw 0 0
#example_IP:/var/nfsroot /mnt/remotenfs nfs rw,async,hard,intr,noexec 0 0
echo "pimaster:/APPL/DATA/shared /APPL/DATA/shared nfs rw,async,hard,intr 0 0" >> /etc/fstab
echo "pislave1:/APPL/DATA/appdata /APPL/DATA/appdata nfs rw,async,hard,intr 0 0" >> /etc/fstab
echo "pislave2:/APPL/DATA/logs /APPL/DATA/logs nfs rw,async,hard,intr 0 0" >> /etc/fstab

#Symblinks erstellen
#rm -rf /var/lib/docker/overlay2
#ln -s /APPL/DATA/shared/images /var/lib/docker/overlay2
ln -s /APPL/DATA/logs /logs

#W-Lan Konfigurieren
#erledigt

#Aliase Git+Docker?

#Konfig ebenfalls auf NAS sichern

#installation per ansibile
#git clone https://github.com/Project31/ansible-kubernetes-openshift-pi3.git k8s-pi
#cd k8s-pi

echo "#Platten Freigeben"
echo "/etc/exports"
echo "#Freigaben Einbinden"
echo "/etc/fstab"

#ganz ans Ende?
#Log out and log back in. You should now be able to run Docker commands without prefixing .
docker run hello-world





