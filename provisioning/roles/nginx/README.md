NGINX LoadbLancer Server
============

This VM has NGINX Community Server.

Requirements
------------

This role requires 
1) Ansible 1.4 or higher, and platform requirements are listed in the metadata file.
2) Nginx latest from the repository.
3) 

Improvements
--------------
1) 

Playbooks
---------

Vagrant executes the playbook by vagrant provisioning features.
Features of Vagrant VM Definition.

Memory Requirements
1) 1024 MB RAM
2) 1 CPU

IP Address Used: `10.0.50.41`

`Note: These can be upgraded, as per availability of resources.`

Starting the VM
-------------------
To Bring up the VM, below is the command to execute.

`vagrant up --provision loadbalancer`

IP Address:  `10.0.50.41` has been assigned, if you want to change, then you can update the vagrant file at root of the project.

Load balancing Web Servers of below IP address as alias are done in the nginx.conf
Aliasing of hte IP's are updated in the Hosts file. 
this has been update in the templates and copied to the Server as a Task.
```ruby
WEBAPP_1_IP = "10.0.50.42"
WEBAPP_2_IP = "10.0.50.43"
```
###Load Balancing the Webserver Snippet.

Snippet of the Task to copy the NGINX Conf (nginx.conf should be copied at /etc/nginx)

```ruby
events {}
http {
  upstream autologic {
    server webapp01:9999;
    server webapp02:9999;
  }
  server {
    listen 80;
    listen [::]:80;
    location /user/ {
      proxy_pass http://autologic;
    }
  }
}

```
Assumptions
-----------------
The above hostname can be created on loadbalancer as webapp01,webapp02.
All VM's start in  **promiscuous mode** and allow all hosts to communicate.

###Update your hosts files
```javascript
Note: 
----
your local hosts file should be updated for alias names as below, as my hosts OS is MacOS, windows users should use  hosts.ini

10.0.50.41  loadbalancer
10.0.50.42  webapp01
10.0.50.43  webapp02

```

Improvements
-----------------------

1) All the files copied can be used as templates and variables.
2) Since i spent lot of time in fixing some issues, so tasks for templates have not been completed.