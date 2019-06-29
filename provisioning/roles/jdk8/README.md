WebApp Server
============

This is Spring Boot Restful Server serving the http Requests as GET,PUT,POST,DELETE. This uses MySQL Connector to 
communicate with the MySQL Server on default port 3306 

Requirements
------------

This role requires Ansible 1.4 or higher, and platform requirements are listed in the metadata file.

Playbooks
---------

Vagrant executes the playbook by vagrant provisioning features.
Features of Vagrant VM Definition.

SpringBoot Executable Jar
--------------------------
1) Under Files directory under nginx role, you have `autologic.jar`
2) Task for Copying, providing permissions and executing this jar is as follows
    ``

```
WEBAPP_1_IP = "10.0.50.42"
WEBAPP_2_IP = "10.0.50.43"
```
The above hostname can be created on loadbalancer as webapp01,webapp02.
All VM's start in  **promiscuous mode** and allow all hosts to communicate.


Two Web App Servers
--------------------------

Currently for this excercise, i have used 2 web servers with same jar on 2 different VM's and 
then these 2 two are loadbalanced in NGINX. 

Spring Boot Configuration
---------------------------
Port is Open on 9999 for webserver, this will be masked  from User with the 
loadbalancer.So user can Just use the below URL to access the Server
`http://loadbalancer/user` assuming loadbalancer is your alias for IP 10.0.50.41(nginx loadbalancer)


```javascript
server.port=9999
spring.datasource.url = jdbc:mysql://10.0.50.44:3306/autologic?useSSL=false
spring.datasource.username=alogic
spring.datasource.password= alogic
spring.jpa.show-sql = true
spring.jpa.hibernate.ddl-auto = none
spring.jpa.properties.hibernate.dialect = org.hibernate.dialect.MySQL5Dialect
spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver

#### Logging Level from Spring
logging.level.root=INFO
logging.level.org.hibernate=INFO

```

Assumptions
------------------------
1) Since the VM only require JDK, not many Variables have been defined, except checking JDK installation.


Improvements
-----------------------

1) Vagrant Scripts for these 2 servers can be refactored with a Loop.
2) Since most of the data is not requried for this VM, so not
