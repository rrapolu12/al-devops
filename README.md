Documentation for Technical Test
-------------------------------------
 
   Nginx Loadbalancer  (https://github.com/rrapolu12/al-devops/provisioning/roles/nginx/README.md)
   
| Role                      |         README                       |
| --------------------------|--------------------------------------|
| Nginx Load Balancer       | [provisioning/roles/nginx/README.md] |
| Web Servers               | [provisioning/roles/nginx/README.md] |
| MySQL                     | [provisioning/roles/nginx/README.md] |

Pre-Requisites & Requirements
------------
 - Virtual Box (latest), currently i am using v6.0 
 - Ansible > 2.0
 - VM Provided in the Test to be used and Variables Created in the Vagrant File: 
    ```ruby
    UBUNTU_BIONIC64 = "ubuntu/bionic64"
    UBUNTU_BIONIC64_URL = "https://app.vagrantup.com/ubuntu/boxes/bionic64"
    ```
 - OpenJDK Version1.8 used to create Spring Boot Web Servers `openjdk-8-jdk` nad used oracle repos.
 - Spring Boot 2.1.6-RELEASE (latest)
 - MySQL 5.1.7 and Java Connector from Spring Boot Dependency tree
 - Nginx 1.7
 
 Assumptions
 ------------
 - I have used a Restful Service to Retrieve Data from MySQL Server with Sample Data Setup for 3 User Records.
 - Load Balance is done on the Nginx Server.
 - Single Instance MySQL Server used and Replication disabled.
 - Vitual Machines Started in `promiscuous mode` with `allow_all` so any host can connect the VM.
 
 IP ADDRESS USED FOR VM's
 ------------------------
 ```
LOAD_BALANCER_IP = "10.0.50.41"
WEBAPP_1_IP      = "10.0.50.42"
WEBAPP_2_IP      = "10.0.50.43"
MYSQL_DB_IP      = "10.0.50.44"
```

HOSTS FILE UPDATED ON MY HOST
---------------------------------
Snippet Below
```
10.0.50.41  loadbalancer
10.0.50.42  webapp01
10.0.50.43  webapp02
```
 Note: 
    `I Use Mac, so the location is /etc/hosts
     Windows users can check, hosts.ini for updation.
    `   
 Improvements
 ----------------------
 1) Refactor of Vagrantfile, can be done to optimise with loops.
 2) Lots of Variables can be used in group_vars, to make roles simpler.
 3) Test VM, for testing all the features can be done in Selenium in better way.
    Because of time constraints, i am avoiding.

Sample Data
------------------------------

```-----------------------------------------------------
|   1   |  Mark Twain        | mtwain@example.com   |
-----------------------------------------------------
|   2   | Charles Darwin     | cdarwain@example.com |
-----------------------------------------------------
|   3   | Automation Logic   | alogic@example.com   |
-----------------------------------------------------
```

Testing URL
----------------
if 