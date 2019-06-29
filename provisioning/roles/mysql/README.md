MySQL Server
============

This roles helps to install MySQL Server across Ubuntu variants. Apart from installing the MySQL Server, it applies basic hardening, like
securing the root account with password, removing test databases.The role also be used to add databases to the MySQL server and 
create users in the database. 
Note : It also supports configuring the databases for replication--both master and slave can be configured via this role.
       But Disabled for now.

Requirements
------------

This role requires Ansible 1.4 or higher, and platform requirements are listed in the metadata file.

Playbooks
---------
This Role Contains 2 Playbooks,

1) For custom installing python2.7, This decision has been taken to avoid failures when the VM is deployed, 
   because of gather_facts trying to use 2.7 and some components does not work on python3
2) This installs python 2.7 and gather_facts does not fail and install mysql5.1


Role Variables
--------------

The variables that can be passed to this role and a brief description about them are as follows:

      mysql_port: 3306                 # The port for mysql server to listen
      mysql_bind_address: "0.0.0.0"    # The bind address for mysql server
      mysql_root_db_pass: ''           # The root DB password

      # A list that has all the databases to be
      # created and their replication status disabled:
      mysql_db:                                 
           - name: autologic
             replicate: yes

      # A list of the mysql users to be created
      # and their password and privileges:
      mysql_users:                              
           - name: alogic
             pass: alogic
             priv: "*.*:ALL"      # This will provide all Priviledges to the user 'alogic' for this server.
             host: "%"            # Mysql Allows all Remotes to Communicate with it. Otherwise can be restricted.

      # The role of this server in replication:
      mysql_repl_role: master

      # A unique id for the mysql server (used in replication):
      mysql_db_id: 7

Examples
--------

1) Install MySQL Server and set the root password, but don't create any
database or users.

      - hosts: all
        roles:
        - {role: mysql, mysql_root_db_pass: foobar, mysql_db: none, mysql_users: none }

2) Install MySQL Server and create 2 databases and 2 users.

      - hosts: all
        roles:
         - {role: mysql, mysql_db: [{name: autologic}],
            mysql_users: [{name: alogic, pass: alogic, priv: "*.*:ALL"}] }

Note: If users are specified and password/privileges are not specified, then
default values are set.

3) Install MySQL Server and create 2 databases and 2 users and configure the
database as replication master with one database configured for replication.

      - hosts: all
        roles:
         - {role: mysql, mysql_db: [{name: autologic, replicate: yes }], 
                         mysql_users: [{name: alogic, pass: alogic, priv: "*.*:ALL"}]

4) A fully installed/configured MySQL Server with master and slave
replication.

      - hosts: master
        roles:
         - {role: mysql, mysql_db: [{name: autologic}],
                         mysql_users: [{name: alogic, pass: alogic, priv: "*.*:ALL"}],
                         mysql_db_id: 7 }

Note: Replication is disabled, this is single instance Database server.

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

How to Test
-------------------------
I have Kept it Simple, the Rest Service Returns all the Users from the Database.

`http://loadbalancer/user`

Should return all the Above Data.

Improvements 
-------------
Improvement to Nginx can be made to accomadate all the URL Patterns.
