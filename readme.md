Task: Create virtual machine and setup LEMP.
 

Step: create enviroment:
	1.1 Install for your machine hypervisor (hyper-V, Vmware, VirtualBox and etc.) 
If you use Windows(8, 10, 11) Pro version, you can use hyper-v component iclude in your OS.
If you use other version windows, you must find and download this software.
Virtualbox https://www.virtualbox.org/wiki/Downloads
Vmware https://customerconnect.vmware.com/en/downloads/#all_products
In GNU/Linux OS for  installation nesessary software you can use 2 ways:
- download packages in website producent software. For Ubuntu # sudo apt install /"path .deb" or dubleclick on download package
- with help package manager in your OS (apt, yum and etc.)

!!! REMEMBERS !!!
On BIOS your machine must be include support virtualization(AMD-V or VT-X). 
 
	1.2 Install vagrant #sudo apt install vagrant -y
Step: create project: 
	2.1 Create folder for project # mkdir "project"
	2.2 Enter this folder # cd ~/"project"
	2.3 Iniciate # vagrant init
	2.4 Verified status # vagrant status. You can see, what vagrant create new files. And VM not created
	2.5 Edit VagrantFile. Write needed properties for your VM
	2.6 Create & Start VM # vagrant up
	2.7 Enter to the VM # vagrant ssh

###Congratulation###
Step: Preperetions VM:
	3.1 For preparations VM, we must update list repository in package manager. # sudo apt update 
Step: Install webserver on VM, and setup:
	4.1. Install nginx on Ubuntu # sudo apt install nginx -y
	4.2. And now we can verified work nginx. For them open your browser and enter in adress string "localhost:8080"
	4.3. Setup access rigths on folder with our site # sudo chown vagrant:vagrant /var/www/html
	4.4. Exit at the VM # exit or press Ctrl+D
	4.5. Create folder materials and other files # mkdir dist
	4.6. Move you materials in ./dist
	4.7. Upload materials on VM # vagrant upload ./dist /var/www/html

Step: Install MySQL:
	5.1. Install MySQL # sudo apt install -y mysql-server
