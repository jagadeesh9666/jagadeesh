## create a VM/EC2 and install apache2 and Tomcat web server on ubuntu/Centos and access it through the internet ##
* # Creation 
* Open ec2 and launch instance
* give the name
* select ubuntu OS
* instance type t2.micro
* select keypair
* select existing network
* click launch instance
-
* select the machine
* go to security
* click on security group
* edit inbound rules
* 1. Type - ALL TCP
    source type - custom
    source - 0.0.0.0/0
  2. Type - Custom TCP
    source type - custom
    Port range - 8080
    source - 0.0.0.0/0
* click save rules

* # login to machine in powerShell or gitbash 
* Select created instance
* click on connect
* go to SSH client
* copy example(ssh -i "powershell.pem" ubuntu@ec2-43-204-19-213.ap-south-1.compute.amazonaws.com )
* paste it in powershell
* click enter
* yes
* # run the below commands
* sudo apt update
* sudo apt install apache2 -y
* sudo apt install tomcat9 -y
* # Now access it through the internet
* 1.  copy public ip address of instance/VM 
*     paste it in any browser Url for apache
*     click enter
* 2.  paste public ip of VM in URL and add ":8080" port to it
      ex: 43.204.19.213:8080
      click enter

## upload any image inside the web app path and access it through the web ##
* Select created instance
* click on connect
* go to SSH client
* copy example(ssh -i "powershell.pem" ubuntu@ec2-43-204-19-213.ap-south-1.compute.amazonaws.com )
* go to downloads folder in your powerShell
* paste it in powershell and change 'ssh' to 'sftp' (sftp -i "powershell.pem" ubuntu@ec2-43-204-19-213.ap-south-1.compute.amazonaws.com)
* click enter
* # execute the below command 
* put <give the name of file you want to upload>
* bye
* click enter
* # now login to machine again
* copy your image to folder /var/www/html using below command.
* sudo cp <file name> /var/www/html

* to access the image on web enter the public ip of machine and add '/<filename>' example:43.204.19.213/jaga.png
## Add Users and Groups to the sudoers file , Enable password based authentication method.
* Login to VM
* # to create user follow below command
* sudo adduser <name>
* enter New password: 
* retype new password: 
* click enter for 5 times don't give any data
* enter y
* example :(
 ubuntu@ip-172-31-39-17:/$ sudo adduser jaga
 Adding user `jaga' ...
 Adding new group `jaga' (1001) ...
 Adding new user `jaga' (1001) with group `jaga' ...
 Creating home directory `/home/jaga' ...
 Copying files from `/etc/skel' ...
 New password:
 Retype new password:
 passwd: password updated successfully
 Changing the user information for jaga
 Enter the new value, or press ENTER for the default
        Full Name []:
        Room Number []:
        Work Phone []:
        Home Phone []:
        Other []:
Is the information correct? [Y/n] y)

## Hands-on file Permissions and change ownerships.
* create a file in vm
* run the command "ls -l <file name>" to see the permissions
* r = 4 - Read
* w = 2 - write
* x = 1 - execute
* permissions for any file or folder will be in order of user , group , others.
* # Command to change permissions
* sudo chmod <your choice (744)> <file name>
* sudo chown <user name> file name (- to change user owner) 
* sudo chown <user name>:<group name> <file name>

## create , Delete Users, passwords and groups and verify wheather users , passwords and groups are created or not by its file location.

* ## command for user
* sudo adduser <user name> (to create a user with password)
* sudo useradd <user name> (to create only user without password)
* sudo passwd <user name> (to give password to user)
* sudo usermod -aG <group name> <user name> (to add user to group )
* su <user name> (to switch user)
* sudo groupadd <group name> (to create a group)
* sudo cat /etc/passwd ( to see the users information )
* sudo cat /etc/shadow ( to see the password information )
* sudo cat /etc/group ( to see to group information )
* sudo hostnamectl set-hostname <name> (to set a new host name)