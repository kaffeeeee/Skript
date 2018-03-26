#Uninstall older versions of Docker called “docker” or “docker-engine“ along with associated dependencies. If your system does not have a Docker package, skip the below step.
sudo apt-get -y remove docker docker-engine docker.io

#Install the below packages to have “apt” get the support of https method.
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates wget software-properties-common

#Add the GPG key for Docker repository on your system.
wget https://download.docker.com/linux/debian/gpg 
sudo apt-key add gpg

#Add the official Docker repository to the system by running below command in the terminal.
echo "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee -a /etc/apt/sources.list.d/docker.list

#Update the apt database.
sudo apt-get update

#Make sure you are installing Docker from the official repository, not from the default Debian repository.
sudo apt-cache policy docker-ce

#Install Docker using the “apt-get” command.
sudo apt-get -y install docker-ce

#To enable Docker service to autostart on system boot, run:
sudo systemctl enable docker

#Create a group “docker“, if it does not exist.
sudo groupadd docker

#Add your user to docker group, replace “raj” with your username.
sudo useradd chris

#Add a user to docker group.
sudo usermod -aG docker chris

#scheiss ifconfig installieren
apt-get install net-tools

#ganz ans Ende?
#Log out and log back in. You should now be able to run Docker commands without prefixing sudo.
docker run hello-world

#Git installation
sudo apt-get install git

#Verzeichnise erstellen
mkdir /APPL
mkdir /APPL/DATA
mkdir /APPL/DATA/logs
mkdir /APPL/DATA/share
mkdir /APPL/DATA/appdata
#Nur Master (IF oder Auskommentieren?)
mkdir /APPL/DATA/master_logs
mkdir /APPL/DATA/share/skripte
mkdir /APPL/DATA/share/cluster_ID
mkdir /APPL/DATA/share/images

#Platten Freigeben
sudo apt-get install nfs-common 
#Die Datei auslagern und einfach kopieren
touch /etc/exports
# desktop darf lesen und schreiben (rw)
#/PFAD/ZUR/FREIGABE1      notebook(ro,async) desktop(rw,async)
# Freigabe gilt für alle IPs von 192.168.1.1 bis 192.168.1.255, mit Lese-/Schreibrechten:
/PFAD/ZUR/FREIGABE3       192.168.1.0/255.255.255.0(rw,async)
#Damit sich der Rechner notebook auch zu der Freigabe /PFAD/ZUR/FREIGABE3 verbinden kann, muss er mit der IP-Adresse in der Datei /etc/hosts [3] stehen.
#/etc/hosts wieder kopieren
192.168.1.12 notebook notebook.meinedomain.local
192.168.1.13 desktop desktop.meinedomain.local
#Freigaben Einbinden
#/etc/fstab
192.168.6.13:/home /media/server nfs rw 0 0


#Symblinks erstellen

#Aliase Git+Docker?

#Kubernate installieren







