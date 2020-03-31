## Instructies voor het draaien en testen van VM's
1. Download en installeer VirtualBox vanuit https://www.virtualbox.org/wiki/Downloads
2. Download het Debian 10 OS als iso bestand vanuit https://www.debian.org/distrib/netinst
3. Koppel het gedownloade ISO bestand aan een nieuwe VM in VirtualBox
4. Start de VM op en doorloop de installatie van Debian
5. Installeer nginx op de VM door middel van ```apt install nginx```
6. Verplaats eventueel websitebestanden naar de locatie ```/usr/share/nginx/html/```
7. In VirtualBox, verander in de netwerkinstellingen van de VM de adapter naar "Host-only adapter"
8. Kloon in VirtualBox de VM zo vaak als je wil
9. Wanneer de VM's opgestart zijn draaien meerdere Nginx servers tegelijk, benaderbaar via de ip 192.168.56.100
