Task: Create virtual machine and setup LEMP.
 

Step: create enviroment:
	1.1 Install for your machine hypervisor (hyper-V, Vmware, VirtualBox and etc.) 
If you use Windows(8, 10, 11) Pro version, you can use hyper-v component iclude in your OS.
If you use other version windows, you must find and download this software.
Virtualbox https://www.virtualbox.org/wiki/Downloads
Vmware https://customerconnect.vmware.com/en/downloads/#all_products
In GNU/Linux OS for  installation nesessary software you can use 2 ways:
- download packages in website (watch up) For Ubuntu # sudo apt install /"path .deb" or dubleclick on download package
- with help package manager in your OS (apt, yum and etc.)
!!! REMEMBERS !!!
On BIOS your machine must be iclude support virtualization(AMD-V or VT-X). 
 
	1.2 Install vagrant #sudo apt install vagrant -y
Step: create project: 
	2.1 Create folder for project # mkdir "project"
	2.2 Enter this folder # cd ~/"project"
	2.3 
