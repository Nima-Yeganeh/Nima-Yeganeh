# OpenStack Notes
https://docs.openstack.org/neutron/latest/ovn/faq/index.html
https://mindmajix.com/openstack-interview-questions-answers
https://intellipaat.com/blog/interview-question/openstack-interview-questions/
https://career.guru99.com/top-23-openstack-interview-questions/
https://www.zeolearn.com/interview-questions/openstack
https://svrtechnologies.com/openstack-interview-questions/
https://www.linuxtechi.com/openstack-interview-questions-answers/

2. What is OpenStack?
OpenStack is a cloud computing system that manages a large volume of storage, compute, and networking resources in a data center with the help of APIs having common authentication methods. It is an open-source software freely available for both public and private clouds where networking resources and virtual servers are made available to users

3. Mention the three main components of OpenStack? 
The architecture of the OpenStack developmental software program is made of three main components -  

The image service - The virtual disk images are registered and also discovered by this service provided by OpenStack. 
Computing - The management of a large network over the Internet is also done in a good way by OpenStack. 
Storing Object - Two types of storage, block and object are both supported by the system of OpenStack.
4. What benefits do you get by using the OpenStack? 
For the development of any software or for the improvements of any solution, OpenStack can be of great help. It can also develop a SAAS application. These are the following benefits of using OpenStack

IT users can be provided with some service storage with the help of OpenStack which acts as a very powerful foundation.  
The storage, both block, and objective are provided by OpenStack. This storage provided by OpenStack can be handled easily.  
The fees for licensing of running a software program on OpenStack are also less than running on any other platform like VMware.  
5. How many types of block storage ads are provided by OpenStack?  
Mainly two types of block storage are provided by OpenStack - 

Volume Storage - This type of storage refers to the independent ones. These are persistent in nature.  
Ephemeral Storage - This type of storage is an example of a single storage instance. After the termination of a virtual machine, or generally disappears.  

6. Where are the VM images stored in OpenStack?  
The list of locations of VM images are as follows - 

File system
HTTP  
Object storage by OpenStack
GridFS
Rados Block Device  
S3 
7. What is the meaning of Cell?  
For scaling the compute cloud of OpenStack, Cell is used. It functions in a very simple way. Basically, the host gets divided into various groups and these are called cells.  

8. List the most important components of identity user management?
These are the most important components of identity user management -  

User - A person, a system, or even a service of the OpenStack is often digitally represented.  
Tenants - The objects get grouped according to their specific identity. Tenants are the ones who map this grouping to a particular organization, user, or even a project.  
Roles - It consists of various privileges and rights of users getting to operate a particular function. 
9. What is the meaning of the word Token in OpenStack?  
The token is referred to as the validation required for any kind of authentication. The generation of Token mainly occurs after the insertion of the various credentials which are done by the users. Any type of services provided by OpenStack can be accessed by Token. However, the token can be used for a specified time period, and after that, it has to be renewed. The credentials of the users must be authentic in order to create a token. 

10. What is the meaning of the term 'Flavor' in OpenStack?  
OpenStack provides various hardware templates which are found virtually and are known as Flavor. Generally, the size of the memory of any hard disk and RAM is defined by it. In fact, various components like Name, ID, Disk, Memory are all illustrated by it. The flavor can be modified in the OpenStack.  

11. What are the vital components of OpenStack?
Horizon: OpenStack has only 1 GUI and that is the horizon. The component administrators take ideas of the current operations in the cloud after seeing the horizon.
Nova: It is the major computing engine that handles various virtual machines (VMs) and computing tasks
Swift: It is a robust and reliable storage space for files so that it becomes easy for developers to locate files using a unique identifier.
Cinder: It is a block storage system for files just like traditional systems so that files can be accessed speedily.
Neutron: It ensures proper connectivity of components while deploying the applications.
Keystone: It is a central list to identify all cloud users. It provides mapping techniques to access methods against Keystone.
Glance: It is a service provider for images that offers virtual copies of hard disks as images. Images can be used as templates while deploying new applications.
Ceilometer: This component is used to provide billing and telemetry services to cloud users. It also maintains a record of component usage by each cloud user.
Heat (Orchestration Engine): It is one of the essential components that is used to maintain the cloud infrastructure. Developers can store and orchestrate/illustrate the requirements and resources needed in a cloud application.
12. How are the services provided by OpenStack being managed? 
The services provided by OpenStack are managed with the help of a dashboard named Horizon and are web-based.  

13. How does Account Reaper works?  
Data in the deleted accounts which are not used by the users are removed with the help of Account Reaper.  

14. Volume often gets transferred from a user of OpenStack to another. How? 
Cinder transfer which is considered to be a special kind of command is mainly used to transfer volume between owners.  

15. Define bare-metal node. What are its components?  
The hardware resources can be controlled by users with the help of bare metal nodes which gives the users the right to control the bare metal driver. Its components are -  

Bare metal node operating system - The is considered to be the software base for various nodes present in the cluster.  
Bare metal node orchestrator - All the nodes when dispatched in the cluster are managed by this software.
16. How can the network interface be removed from the bare metal node?  
By using the command known as the bare metal interface remove, the network interface can be removed from the bare metal node.

17. What do you mean by the term 'Cinder'?  
The storage in the OpenStack is mainly handled by using Cinder.  

18. What types of commands are used for the generation of Key pairs?  
The following are the different commands which can be used - 

cd.ssh
ssh-keygen
Nova keypair - add -
pub_key id_rsa.pub
 mykey
19. How can a user be created in the OpenStack? 
The user name is mainly created by the command, sudo nova-manage user.  

20. List the functions of Identity Service?
There are two main functions. These are as follows - 

Service Catalog - The existing services are provided along with the catalog. 
User management - Users get tracked and managed in this way.  
21. What is Hypervisor?  
VMM which is the abbreviation of virtual machine monitor is basically defined by the Hypervisor. It is also used to define various components like firmware, hardware, and software. All these are part of the virtual machine. A hypervisor is mainly consisted of or included by the host machine or various other virtually available machines. Multiple Hypervisor is also available in the OpenStack developmental software program and can choose accordingly catering to specific uses.

22. What are the different types of Hypervisor available in the OpenStack developmental software program? 
The following are the lists of Hypervisors available in the OpenStack developmental software program are -  

KVM - Kernel Virtual Machine  
QEMU - Quick EMUlator and these are used for the purpose of development  
LXC - Linux VMs are present in this Linux Containers
UML - For the development of the system, User Mode Linux can be used  
Hyper-V - Virtualization of the server  
VMware vSphere - Includes VMware Linux  
23. What work does the Filter Scheduler do?  
If there is an instance of creating some new functions, the notification is mainly given by the Filter Scheduler. It also helps in filtering these notifications according to their importance. Compute Nodes are the ones with whom it works. The hosts which are unfiltered get created at first and with the help of their specific properties, it gets filtered. Such filtered hosts are needed according to the total number of instances.  

24 What are the different networking options that are available in OpenStack?  
The following are the different types of networking options -  

Capacity Filter - This type of filtering is mainly based on the capacity consumption of the volume host.  
Availability Zone Filter - Filter did according to the zones available.  
Different Backend Filter - Done by the volume scheduled to the various back end.  
Retry Filter - Filtering existing hosts.  
JSON Filter  
Some other types of networking options available are - 

Flat network-manager 
VLAN network-manager  
Flat DHCP network-manager  
Hence, OpenStack allows various kinds of networking options to choose from.  

25. What is the meaning of OpenStack Python SDK?  
SDK is the abbreviation form of the Software Development Kit and these are used for writing various python scripts and also managing them. These scripts are well connected with the OpenStack API with the help of SDK. Tasks in Python are also obtained with the help of this by calling on the Python Objects.   

26. How can an instance be paused and also unpaused?  
Two types of commands like $ nova pause

INSTANCE_NAME
and $ nova unpause

INSTANCE_NAME
are used to pause and unpause instances. 

Related Article: Openstack Installation    
27. What are the various functions of the command 'nova'? 
The functions of nova are as follows -  

Compute resources are well managed  
Authorization and networking  
API based on the REST  
Communication which is asynchronous  
Supports Xen several and is hence considered to be Hypervisor agnostic 
Helps in the management of instances  
28. How do Swift functions?  
Swift helps in storing various objects. It helps in storing objects which are bigger in size and is also numerous in numbers. It helps in reducing data by storing such objects. Its works are often associated with a large number of sets of data. It contains data that is needed for virtual machines and other apps. Swift also has the capability of media streaming and can also secure a large number of objects stored by it. It has extreme scalability skills and can also help in backing up files and data.  

29. Define the Sanitization Process.  
The sanitization process refers to the process of the removal of certain information which is present in the media. This type is information is basically useless as these can't be reconstructed or retrieved. This process mainly includes various techniques like purging, clearing, erasing cryptographically, and also destruction. Such a process prevents the information to get out to any individuals who are unauthorized during the releases of such information in the media. 

Related Article: Workflow in ServiceNow
30. How can you overcome any type of sudden server failure?  
During the failure of the server or when the server is not seen to be perfectly functioning then the Object Storage services should not be running. Hence, it is best to close them if this problem arises. This is because to know the solution, troubleshooting must be done.

Closing the object storage service will allow it to work or function while troubleshooting is still going on. However, often such failure just needs rebooting and hence for this work which doesn't require much time, the object storage service doesn't need to be closed.  Update to this service will be added once the machine gets online after rebooting.

Removing the drive from the ring is the best idea when the driver can't be replaced. But if it can be replaced, then it can be added back to the ring.

31. List the modular architectural components of OpenStack?
Dashboard
Networking
Compute
Block Storage
Object Storage
Identity service
Telemetry
Image Service
Database Service etc.
Orchestration
32. Name the types of storage supported by OpenStack?
Persistent Storage / Volume Storage: This storage type is created by users and they are independent and persistent of any specific instance. Persistent storage in OpenStack are:

Object storage: binary objects can be accessed in this storage via REST API.
Block storage: block storage devices can be accessed with this storage by affixing volume with their contemporary VM instances.
Shared File System storage: Multiple files can be managed by using this storage system for the exchange and storage of files with multiple users simultaneously.
Ephemeral Storage: It is used to specify a single instance. It is temporary storage that gets vanished once the VM is terminated.
33. What is an Identity Service in OpenStack?
Keystone executes the complete API for OpenStack therefore it is the most preferred identity service in OpenStack. The Keystone Identity offers service cataloging and user management.  In the service catalog, a list of available services is listed in API while in user management users and their respective access permissions are tracked. They are also responsible for providing authentication credential information of users, tenants, and roles. Policy and token services are also carried out by Keystone Identity.

34. Explain networking techniques used in OpenStack?
Flat DHCP Network Manager: In this technique, IP addresses are fetched from the subnet for virtual machine instances but IP addresses to VM are allocated by using DHCP (Dynamic Host Configuration Protocol).

Flat Network Manager: In this technique, IP addresses are fetched from the subnet for VM instances, and then inserted into the image while launching.

VLAN Network Manager: VLAN is better and more preferred than the above two techniques as it offers a separate and secure network to virtual machines. There is a physical switch to provide a separate virtual network and separate IP range and bridge to every tenant.

35.  Name the Networking hardware used in OpenStack?
Networking hardware used in OpenStack are Networks, Subnets, Routers, and Ports Vendor Plugins

Related Article: OpenStack Networking Concepts  
36. Write down the order in which nova services can be restarted on a controller node?
Nova services can be restarted in the following order

service nova-conductor restart
service nova-cert restart
service nova-scheduler restart
service nova-console auth restart
service nova-API restart
37. Write a command to get the list of available Floating IPs from the command line?
The below command can be used to get the list of available floating IPs

~]# openstack ip floating list | grep None | head -10
38. What role does the API server play in OpenStack?
An API server is used to provide an interface to communicate with the cloud infrastructure or the external world.

39. How to retrieve the console URL of an OpenStack instance from the command line?
It can be retrieved by using the below command:

~# openstack console url show {instance-id}
40. What are the endpoints of OpenStack services?
Endpoints of Openstack services are classified as:

  Public Endpoint
  Internal Endpoint
  Admin Endpoint
To view endpoints of each OpenStack service, the below command is used

~# openstack catalog list
To list the endpoints of a specific service, the below command is used

~# openstack catalog show keystone
41. What is the role of cells in OpenStack?
The hosts get partitioned into groups of cells when the cell functionality gets enabled. These cells are arranged as trees and they have the ability to scale up the OpenStack cloud in a simpler way.

42. Name the services that run on a controller node?
The services that run on a controller node are:

  Identity Service ( KeyStone)
  Nova Services like Nova API, Nova Scheduler & Nova DB
  Image Service ( Glance)
  Block & Object Service
  MariaDB / MySQL and RabbitMQ Service Ceilometer Service
  Orchestration Service (Heat)
  Management services of Networking (Neutron) and Networking agents
 Explore OpenStack Sample Resumes Download & Edit, Get Noticed by Top Employers!  
43. Where VMs are located on the Compute Nodes by default?
VMs, by default, are stored in 

“/var/lib/nova/instances”
44. Write down the command to spin a VM from Command Line?
The command to spin a virtual machine from a command-line interface is

#openstack server create --flavor {flavor-name} --image {Image-Name-Or-Image-ID}  --nic net-id={Network-ID} --security-group {Security_Group_ID} –key-name {Keypair-Name} <VM_Name>
45. Can we see the list of roles and associated IDs in the OpenStack environment?
Yes, we can see the list of roles and associated IDs by using keystone role-list

46. How to assign a project/tenant to a user?
Project/tenant can be assigned to a user by writing the command Sudo nova-manage user create user-name

2. Describe OpenStack.
Most multinational organizations define OpenStack as the future of Cloud Computing. The Internet and large volumes of data together have instigated the purpose of cloud computing, and OpenStack is one such platform to create and handle massive groups of virtual machines through a Graphical User Interface. It is a set of efficient software tools to manage private and public cloud computing platforms.
Openstack is free, open-source software and works similar to Linux.

3. Explain the benefits of using OpenStack Cloud.
Openstack is useful in developing any software-as-a-service (SAAS) applications, for new developments or to improve existing solutions.

Can serve as a strong foundation to deliver self-service storage to IT users.
Can deliver on-demand objective or block storage with higher scalability and easy-to-handle storage at lower costs.
Most enterprises can save bigger on licensing fees by switching virtual machines running on VMware to OpenStack.

4. What are the key components of OpenStack?
Horizon: the only GUI in OpenStack; the first component administrators see and get an idea of the current operations in the cloud.
 Nova: chief computing engine to handle multiple virtual machines and computing tasks
Swift: reliable and robust storage system for files and objects helping developers to refer to a unique identifier and Openstack decides where to store the info.
Cinder: similar to traditional computer storage system, it is a block storage system in OpenStack for accessing files at faster speed.
Neutron: ensures efficient connectivity between components during deployment.
Keystone: a central identity list of all OpenStack cloud users and provides various mapping techniques to access methods against Keystone.
Glance: image service provider where images are the virtual copies of hard disks. Allows using the images as templates during deployment of new instances.
Ceilometer: component providing billings services and other telemetry services to cloud users. Maintains an account of component system usage by each user.
Heat (Orchestration Engine): Allows developers to orchestrate/illustrate and store the cloud application requirements and resources needed in a file, thereby maintaining the cloud infrastructure.

5. What storage types are allowed by OpenStack Compute?
OpenStack Cloud Operating system supports two types of storage:
Persistent Storage: Persistent and independent of any particular instance, created by users. This further includes three storages:

Object storage: to access binary objects through the REST API.
Block storage: offers access-to-block storage devices by affixing volumes their current VM instances.
Shared File System storage: provides a set of services to manage multiple files together for storage and exchange with multiple users at one time.
Ephemeral Storage: Referring to a single instance. As the name suggests, these storage options are temporary and short-lived and disappear once the VM is terminated.

6. Define ‘users,’ ‘role’ and ‘tenant’ in OpenStack.
Users can be members of multiple projects
Tenant is a group of users and an alternative term for Project/accounts where projects are organizational units in cloud processing
Role is the position to which a user is mapped (the authorization level). Roles are usually assigned to project-user duos.

7. Define Identity Service in OpenStack.
Keystone is the most important and preferred Identity Service in OpenStack and executes the complete OpenStack Identity API. The Keystone Identity Service is responsible for user management and service catalog. In user management, it tracks users and their permissions while Service Catalog offers a list of services available with their API. The former provides authentication credential details of users, tenants and roles.
Internal services like Token and Policy are also part of Keystone Identity

8. Define the Networking Managers in OpenStack Cloud.
Flat Network Manager: This places all VMs on a single network utilizing the same subnet and bridge as created by the administrator. Thus, all VMs share the same network that can be interconnected and are known to have a Flat Network Manager.

Flat DHCP Network Manager: Much similar to the above except that the IP addresses to VM are assigned via DHCP (Dynamic Host Configuration Protocol).
VLAN: Unlike the single network concept, VLAN facilitates a more secure and separate network for VMs. It has a physical switch to offer a separate virtual network and separate IP range and bridge for each tenant. This is indeed most preferable choice for a multi-tenant/project environment.

9. Name the commands used to pause and un-pause(resume) an instance
$ novaunpause INSTANCE_NAME
$ nova pause INSTANCE_NAME
10. List the storage locations for VM images in OpenStack
• OpenStack Object Storage
• Filesystem
• S3
• HTTP
• RBD or Rados Block Device
• GridFSMaster Openstack from industry experts.

11. What is Token?
Token is a type of authentication similar to password-based validation. A token gets generated once the user inserts the credentials and authenticates as a Keystone user. The token can then be used to access OpenStack services without any revalidation. It is interesting to note that a token is active for a limited period and must be renewed after regular intervals.
To create a token, users first need to authenticate their Keystone credentials.

12. What is OpenStack Python SDK?
Python SDK (Software Development Kit) helps users to write applications for performing automation tasks in Python by calling Python objects. It provides a platform to work with multiple OpenStack services at one place. It consists of language bindings to access OpenStack clouds, complete API reference, easy interaction with REST API and sample code for initial applications.

13. Describe the function of Filter Scheduler.
The Filter Scheduler facilitates filtering and weighting to notify where a new instance can be created. It supports working with Compute Nodes. Filter Scheduler firstly creates an unfiltered dictionary of hosts and then filter them using related properties and makes the final selection of hosts for the number of instances as needed.

14. Define the Networking option in OpenStack.
AvalabilityZoneFilter: filters hosts by their availability zone.
CapacityFilter: filtering based on volume host’s capacity consumption
DifferentBackendFilter: Scheduling volumes to a different back-end
DriverFilter: filters based on ‘filter function’ and ‘metrics’
InstanceLocalityFilter
JSONFIlter
RetryFilter: Filter the previously attempted hosts
SameBackendFilterMost in-depth, industry-led curriculum in Openstack.
15. List down the Networking hardware in OpenStack.
Networks
Routers
Subnets
Ports Vendor Plugins

16. Define Hypervisor
For all cloud computing paltforms, Hypervisor is a term to define virtual machine monitor (VMM) including hardware, software and firmware components running on a virtual machine. Host machine is the one having hypervisor with one or more virtual machines.
OpenStack Compute allows multiple hypervisors. There are functionalities to choose one among them for a specific purpose.

17. List down the type of Hypervisors supported by OpenStack.
KVM (Kernel-based Virtual machine)
LXC: Linux Containers having Linux-based VMs
QEMU: Quick EMUlator used for development purposes
UML: User Mode Linux used for development purposes
VMware vSphere: VMware-based Linux and Windows via vCenter server connection.
Hyper-V: Server virtualization with Microsoft’s Hyper-V

18. Explain in brief the modular architecture of OpenStack.
The three important components of OpenStack modular architecture are:

OpenStack Compute: For managing large networks on the virtual machine
Image Service: The delivery service provides discovery and registration for virtual disk images
OpenStack Object Storage: A storage system that provides support for both block storage and object storage

19. What command manages floating IP addresses in OpenStack
nova floating-ip-*

20. Define bare-metal node.
Bare-metal node grants access to control bare-metal driver that handles the provisioning of OpenStack Compute physical hardware utilizing the standard cloud APIs and tools like Heat. It is generally used for single tenant clouds like high-performance cluster computing. For using the bare-metal driver, a network interface must be created with the bare-metal node inserted into it. Afterwards, users can launch an instance from the node. Users can also list and delete bare-metal nodes by removing the associated network instances

21. List down the components of OpenStack Compute
Nova (Compute) Cloud comprises following components:

API server
Message Queue (Rabbit-MQ Server)
Compute Workers (Nova-Compute)
Network controller (Nova-Network)
Volume Worker
Scheduler
22. Define the role of API Server.
It provides an interface for the external world to interact with the cloud infrastructure.

23. List the commands to generate Key pairs.
ssh-keygen
cd .ssh
nova keypair-add –pub_key id_rsa.pub mykey

24. Define Flavor
Flavors are virtual hardware templates present in OpenStack, which define the memory sizes of RAM, hard disk, etc. Flavors illustrate a number of parameters like ID, Name, Memory_MB, Disk and others, giving a choice of Virtual Machine to the user just like having a physical server. OpenStack dashboard also allows users to modify a flavor by deleting the existing one and creating a new with the similar name and parameters.

25. How to create a user in OpenStack?
sudo nova-manage user create user-name
26. How to assign a project/tenant to a user?
By using the command sudo nova-manage user create user-name

27. Can we see the list of roles and associated IDs in OpenStack environment?
Yes, by using keystone role-list

1)      Explain what is OpenStack?

OpenStack is a set of software tools for managing and building cloud computing platforms for private and public clouds. It’s a free and open source software cloud computing platform.

2)      Mention what are the three components that make modular architecture of OpenStack?

The three components that make modular architecture for OpenStack are

OpenStack Compute: For managing large networks of the virtual machine
OpenStack Object Storage: A storage system that provides support for both block storage and object storage
Image Service:  The delivery service provides discovery and registration for virtual disk images

3)      Give an overview of OpenStack Services?

OpenStack offers services like

Keystone: Provides authorization and authentication for users
Glance: Manages images in different formats
Cinder: Provides persistent block storage
Neutron: Enables users to create and attach interfaces to networks
Nova: Provides instances on user’s demand
Swift: Storage platform integrated directly into applications
Ceilometer: Openstack for billing
Heat: Allows automated infrastructure deployment

4)      What does “role” and “tenant” indicates in OpenStack?

In OpenStack, a tenant is referred for the group of users while role indicates the authorization level of the user.

5)      Explain what hypervisor is and what type of hypervisor does OpenStack supports?

Hypervisor is a piece of computer software or hardware that creates and run virtual machines. A system on which one or more virtual machines is defined is referred as host machine.

The types of hypervisor that supports OpenStack are

KVM
VMware
Containers
Xen and HyperV

6)      What are the two types of storage does OpenStack Compute provides?

OpenStack provides two classes of block storage,

Ephemeral Storage:  It is associated with a single unique instance. Based on the instance, the size is defined. When the instance associated with it is terminated, data on ephemeral storage ceases to exist
Volume Storage:   This storage is not dependent on any particular instance and is persistent.  Volumes are user created and within Quota

7)      What are the basic functions of Identity Service in OpenStack?

The basic functions of Identity Service is

User Management:  It tracks the users and their permissions
Service Catalog: It provides a catalog of available services with their API endpoints

8)      What are the main components of identity user management?

Users: It is a digital representation of a person, service or system who uses OpenStack cloud services
Tenants: A container used to group or isolate resource or identity objects.  Depending on service operator a tenant may map to a customer, account, organization or project
Roles:  A role includes a set of rights and privileges.  A role determines what operations a user is permitted to perform in a given tenant

9)      Mention what are the networking options used in OpenStack?

The networking options used in OpenStack are

Flat Network Manager: IP addresses for VM instances are fetched from the subnet, and then injected into the image on launch
Flat DHCP Network Manager:  IP addresses for VM instances are fetched from the subnet specified by the network administrator
VLAN Network Manager: Compute creates a VLAN and bridge; DHCP server is started for each VLAN to pass out IP addresses to VM instances.

10)   What is the meaning of term “Cinder” in OpenStack service?

For handling persistent storage for virtual machines, OpenStack provides the service referred as Cinder. There are multiple backends for cinder.  The one that is utilized by default is LVM, called Cinder-Volumes.

11)   List out the storage locations for VM images in OpenStack?

OpenStack Object Storage
Filesystem
S3
HTTP
RBD or Rados Block Device
GridFS

12)   Explain what is Cells in OpenStack?

Cells functionality enables you to scale an OpenStack Compute cloud in a more simplistic way.  When this functionality is enabled, the hosts in an OpenStack Compute cloud are partitioned into group called cells. Cells are configured as trees.

13)   For networking, what hardware is used in OpenStack?
In OpenStack, networking is done in following ways

Networks
Routers
Subnets
Ports
Vendor Plugins

14)   Explain how you can transfer volume from one owner to another in OpenStack?

You can transfer a volume from one owner to another by using the command cinder transfer*.

15)   What is the command to manage floating IP addresses in OpenStack?

nova floating-ip-*

16)   What is bare-metal node and what does it comprised of?

It gives access to control bare metal driver, through which you can control physical hardware resources on the same network.

Bare metal node is comprised of two separate components

Bare metal node Orchestrator: It’s a management software, which acts as a dispatcher to all nodes in the cluster.
Bare metal node Operating System: It is a base software, which runs on each node in the cluster.

17)   Mention what is the command to remove network interface from bare-metal node?

To remove network interface from bare-metal node command used is bare-metal – interface remove.

18)   Explain what is the function of Cinder Scheduler?

Cinder Scheduler or routing volume create requests to the appropriate volume service

19)   Explain what is Token in OpenStack?

Token is an alpha-numeric string which allows access to a certain set of services depending upon the access level of the user

20)   Explain about OpenStack Python SDK?

For writing python scripts and managing in Openstack cloud, SDK (Software Development Kit) is used.  The SDK implements Python binding to the OpenStack API, which enables you to achieve automation tasks in Python by making calls on Python objects instead of making REST calls directly.

21)   What is the command used for pause and unpause an instance?

To pause an instance, command used is $ nova pause INSTANCE_NAME
To unpause an instance, command used is $ nova unpause INSTANCE_NAME
22)   What is the command used to list IP address information?

$ nova floating-ip-pool-list

23)   What is the meaning of term “flavor” in OpenStack?

A flavour is an available hardware configuration for a server, which defines the size of a virtual server that can be launched.

1. Explain the benefits of using OpenStack Cloud?
Answer: Openstack is useful in developing any software-as-a-service (SAAS) applications, for new developments or to improve existing solutions. (openstack interview questions)

It can serve as a strong foundation to deliver self-service storage to IT users.
It can deliver on-demand objective or block storage with higher scalability and easy-to-handle storage at lower costs.
Most enterprises can save bigger on licensing fees by switching virtual machines running on VMware to OpenStack.
Learn OpenStack in 16 hrs from experts

2. What is the meaning of Cell?
Answer: For scaling the compute cloud of OpenStack, Cell is used. It functions in a very simple way. The host gets divided into various groups and these are called cells.

3. What is Hypervisor?
Answer: VMM which is the abbreviation of a virtual machine monitor is defined by the Hypervisor. It is also used to define various components like firmware, hardware, and software. All these are part of the virtual machine. A hypervisor is mainly consisted of or included by the host machine or various other virtually available machines. Multiple Hypervisor is also available in the OpenStack developmental software program and can choose accordingly catering to specific uses.

4. How do Swift functions?
Answer: Swift helps in storing various objects. It helps in storing objects which are bigger and is also numerous in numbers. It helps in reducing data by storing such objects. Its works are often associated with a large number of sets of data. It contains data which are needed for virtual machines and other apps. Swift also has the capability of media streaming and can also secure a large number of objects stored by it. It has extreme scalability skills and can also help in backing up files and data.

5. Explain the Modular Architecture Of Openstack?
Answer: The three components that make modular architecture for OpenStack are:

OpenStack Compute: For managing large networks of the virtual machine.
Image Service: The delivery service provides discovery and registration for virtual disk images.
OpenStack Object Storage: A storage system that provides support for both block storage and object storage. 

6. What Is Bare-metal Node And What Does It Comprised Of?
Answer: It gives access to control bare metal driver, through which a user can control physical hardware resources on the same network.

Bare metal node is comprised of two separate components

Bare metal node Operating System: It is a base software, which runs on each node in the cluster.

Bare metal node Orchestrator: It’s management software, which acts as a dispatcher to all nodes in the cluster.

7. What Are Components Of Openstack Compute?
Answer: Nova Cloud Fabric is composed of the following major components:

API Server (nova-API)

Message Queue (rabbit-mq server)

Compute Workers (nova-compute)

Network Controller (nova-network)

Volume Worker (nova-volume)

Scheduler (nova-scheduler)

8. What Are Data Privacy Concerns In Openstack, How Those Can Be Remediated?
Answer: Data residency: Concerns over who owns data in the cloud and whether the cloud operator can be ultimately trusted as a custodian of this data have been significant issues in the past.(IT Certification Courses – E Learning Portal)

Data disposal:– Best practices suggest that the operator sanitize cloud system media (digital and non-digital) before disposal, release out of organization control or release for reuse.

Data not securely erased:- This may be remediated with database and/or system configuration for auto vacuuming and periodic free-space wiping.

Instance memory scrubbing, Cinder volume data, Image service delay delete feature.

9. What You Will Do In Case Of Server Failure?
Answer: If a server is having hardware issues, it is a good idea to make sure the Object Storage services are not running. This will allow Object Storage to work around the failure while you troubleshoot.

If the server just needs a reboot or a small amount of work that should only last a couple of hours, then it is probably best to let Object Storage work around the failure and get the machine fixed and back online. When the machine comes back online, replication will make sure that anything missing during the downtime will get updated.

If you cannot replace the drive immediately, then it is best to leave it unmounted, and remove the drive from the ring. This will allow all the replicas that were on that drive to be replicated elsewhere until the drive is replaced. Once the drive is replaced, it can be re-added to the ring.

10. What Does It Mean For The Cloud Ecosystem?
Answer: Wide adoption of an open-source, open-standards cloud should be huge for everyone. It means customers won’t have to fear lock-in and technology companies can participate in a growing market that spans cloud providers. Companies are already using OpenStack to provide public clouds, support, training and system integration services, and hardware and software products.

A great analogy comes from the early days of the Internet: the transition away from fractured, proprietary flavors of UNIX toward open-source Linux. An open cloud stands to provide the same benefits for large-scale cloud computing that the Linux standard provided inside the server.

11. What are the modular architectural components of OpenStack?
Answer: Following is a list of OpenStack modular architectural components:

Dashboard
Compute
Networking
Object Storage
Block Storage
Identity service
Image Service
Telemetry
Orchestration
Database Service
etc.
12. What are the different networking options used in OpenStack?
Answer: The networking options used in Open Stack are:

Flat DHCP Network Manager: It is used to fetch IP addresses from the subnet for VM instances but IP addresses to VM are assigned via DHCP (Dynamic Host Configuration Protocol).
Flat Network Manager: It is used to fetch IP addresses from the subnet for VM instances, and then injected into the image on launch.
VLAN Network Manager: VLAN provides a more secure and separate network to VMs. It has a physical switch to offer separate virtual networks and separate IP range and bridge for each tenant. It is a more preferable choice.

13. What is OpenStack and explain its uses?
Answer: The OpenStack is the most popular open source cloud computing platform that provides virtual machine resources and IaaS (Infrastructure as a Service) services to most of the customers. It captures the market in the future of cloud computing. All the services provided by the OpenStack can be accessed and managed through the GUI based user interface. The several benefits of the OpenStack Cloud Computing are mentioned below –

OpenStack boosts the business by eliminating maintenance services.
It improves agility and high availability.
Improves Efficiency and provides cloud infrastructure.
It provides great services for on-demand infrastructure services within no time.
OpenStack gives the opportunity of building own data center in turn which provides more control over the data being managed and controlled.
OpenStack enables rapid development.
OpenStack boosts high scalability and effective resource utilization.

14. What is Hypervisor and what are the different types of Hypervisors supported by the OpenStack Cloud?
Answer: The Hypervisor is defined as firmware or computer hardware used to provide virtual machine instances for the cloud computing instances and has different types of Hypervisors such as KVM, VMware, Containers, Xen, and Hyper-V which are explained as below –

KVM – This hypervisor is a virtualization layer in the Kernel-based Virtual Machine (KVM).
VMWare – This hypervisor is of type ESXi Hypervisor and enterprise-class version hypervisor.
Containers – This hypervisor is of cloud-native type hypervisor
Xen– This hypervisor is of type microkernel designed that provides services that allow multiple computer operating systems to execute the processes on the same computer hardware in concurrent mode.
Hyper-V – This hypervisor is also called Windows Server Virtualization used to create virtualized machines on Windows OS x86 – 64 version.

15. What is OpenFlow rule in OpenStack Cloud Networking?
Answer: This is the most asked Openstack Interview Questions in an interview. OpenFlow rule is defined as the reaching path of the data packet from source to destination in cloud computing. 

16. What Will You Do In Case Of Server Failure?
Answer: If a server is having hardware issues, it is a smart thought to ensure the Object Storage services are not running. This will permit Object Storage to work around the disappointment while you investigate.
If the server simply needs a reboot or a little measure of work that should just last two or three hours, at that point, it is most likely best to let Object Storage work around the disappointment and recover the machine settled and on the web. At the point, when the machine returns online, replication will ensure that anything absent amid the downtime will get refreshed.

If you can’t supplant the drive instantly, at that point, it is best to abandon it unmounted and expel the drive from the ring. This will permit every one of the limitations that were on that drive to be reproduced somewhere else until the point when the drive is supplanted. Once the drive is supplanted, it can be re-added to the ring.

17. What do you mean by OpenStack?
Answer: Most multinational firms characterize OpenStack as the bright future of Cloud Computing. The Internet and extensive volumes of data together have incited the reason for cloud computing, and OpenStack is one such platform to make and handle the vast group of virtual machines through the Graphical User Interface. It is an arrangement of proficient software tools to oversee private and open distributed computing stages.
OpenStack is free, open-source software and works like Linux.

18. What are the essential components of OpenStack?
Answer: Horizon: the main GUI in OpenStack; the primary part administrators see and get a thought of the present tasks in the cloud.
Nova: head figuring engine to deal with various virtual machines and computing tasks.
Swift: robust and reliable storage framework for objects and files helping engineers to allude to an extraordinary identifier and OpenStack chooses where to store the information.
Cinder: like a common PC storage system, it is a block storage framework in OpenStack for getting files speedier speed.
Neutron: guarantees proficient availability between parts amid deployment.
Keystone: a focal character list of all OpenStack cloud clients and gives different mapping systems to get to strategies against Keystone.
Glance: picture specialist provider where pictures are the virtual copies of the hard disks. Permits utilizing the images as layouts amid sending of new occasions.
Ceilometer: part giving billings services and other telemetry facilities to cloud clients. Keeps up a record of the part framework used by every client.
Heat (Orchestration Engine): Allows designers to organize/show and store the cloud application prerequisites and assets required in the file, in this manner keeping up the cloud framework.

19. What is OpenStack Python SDK?
Answer: Python SDK (Software Development Kit) helps users to write applications for performing automation tasks in Python by calling Python objects. It provides a platform to work with multiple OpenStack services in one place. It consists of language bindings to access OpenStack clouds, complete API reference, easy interaction with REST API and sample code for initial applications.

20. What is the meaning of the word Token in OpenStack?
Answer: Token is referred to as the validation required for any kind of authentication. The generation of Token mainly occurs after the insertion of the various credentials which are done by the users. Any type of services provided by OpenStack can be accessed by Token. However, the token can be used for a specified period and after that, it has to be renewed. The credentials of the users must be authentic to create a token.

21. What is Nova Scheduler?
Answer: Nova scheduler dispatches the request for new virtual machines to the correct to compute nodes based on configured weights and filters. Basically, it checks the different compute nodes based on some algorithms which helps it to create a virtual machine on which compute node.

22. Define the bare-metal node. What are its components?
Answer: The hardware resources can be controlled by users with the help of bare metal nodes which gives the users the right to control the bare metal driver. Its components are –

1. Bare metal node operating system – The is considered to be the software base for various nodes present in the cluster.
2. Bare metal node orchestrator – All the nodes when dispatched in the cluster is managed by this software.

23. What work does the Filter Scheduler do?
Answer:  If there is an instance of creating some new functions, the notification is mainly given by the Filter Scheduler. It also helps in filtering these notifications according to their importance. Compute Nodes are the ones with whom it works. The hosts which are unfiltered get created at first and by the help of their specific properties, it gets filtered. Such filtered hosts are needed according to the total number of instances.

24. What are the various functions of the command ‘nova’?
Answer: The functions of nova are as follows –

1. Compute resources are well managed
2. Authorization and networking
3. API based on the REST
4. Communication which is asynchronous
5. Supports Xen several and is hence considered to be Hypervisor agnostic
6. Helps in the management of instances

25. How can you overcome any type of sudden server failure?
Answer: During the failure of the server or when the server is not seen to be perfectly functioning then the Object Storage services should not be running. Hence, it is best to close them to this problem arises. This is because to know the solution, troubleshooting must be done. Closing the object storage service will allow it to work or function while troubleshooting is still going on. However, often such failure just needs rebooting and hence for this work which doesn’t require much time, the object storage service doesn’t need to be closed. Update to this service will be added once the machine gets online after rebooting. Removing the drive from the ring is the best idea when the driver can’t be replaced. But if it can be replaced, then it can be added back to the ring.

26. What Types Of Storage Openstack Compute Provides?
Answer: OpenStack provides two classes of block storage:

Volume Storage: It is persistent and not dependent on any particular instance. Volumes are created by users and within Quota
Ephemeral Storage: It is associated with a single instance. They effectively disappear when a virtual machine is terminated.

27. What are the two types of storage does OpenStack Compute provides?
Answer: OpenStack provides two classes of block storage,

Ephemeral Storage: It is associated with a single unique instance. Based on the instance, the size is defined. When the instance associated with it is terminated, data on ephemeral storage ceases to exist

Volume Storage: This storage is not dependent on any particular instance and is persistent. Volumes are user-created and within Quota.

28. Explain about OpenStack Python SDK?
Answer: For writing python scripts and managing in Openstack cloud, SDK (Software Development Kit) is used. The SDK implements Python binding to the OpenStack API, which enables you to achieve automation tasks in Python by making calls on Python objects instead of making REST calls directly.

29. Explain What Is Token In Openstack?
Answer: Token is an alpha-numeric string that allows access to a certain set of services depending upon the access level of the user.

30. What Is The Meaning Of Term “flavor” In OpenStack?
Answer: A flavor is an available hardware configuration for a server, which defines the size of a virtual server that can be launched.

31. What Are Functions And Features Of Swift?
Answer:

Storage of large-sized objects
Storage of a large number of objects
Data Redundancy
Archival capabilities – Work with large datasets
Data container for virtual machines and cloud apps
Media Streaming capabilities
Secure storage of objects
Extreme scalability
Backup and archival.
32. Why Compliance Is Required In Openstack?
Answer: Compliance means adhering to regulations, specifications, standards, and laws.

An OpenStack deployment may require compliance activities for many purposes, such as regulatory and legal requirements, customer needs, privacy considerations, and security best practices. The Compliance function is important for the business and its customers. 

33. What Is Sanitization Process?
Answer: The sanitization process removes information from the media such that the information cannot be retrieved or reconstructed. Sanitization techniques, including clearing, purging, cryptographic erase, and destruction, prevent the disclosure of information to unauthorized individuals when such media is reused or released for disposal.

34. What Is Alarm In Openstack?
Answer: Alarms provide user-oriented Monitoring-as-a-Service for resources running on OpenStack. This type of monitoring ensures you can automatically scale in or out a group of instances through the Orchestration module, but you can also use alarms for general-purpose awareness of your cloud resources’ health.

35. What Is Orchestration?
Answer: Orchestration is an orchestration engine that provides the possibility to launch multiple composite cloud applications based on templates in the form of text files that can be treated like code.

36. Mention What Are The Three Components That Make Modular Architecture Of Openstack?
Answer: The three components that make modular architecture for OpenStack are:

OpenStack Compute: For managing large networks of the virtual machine
OpenStack Object Storage: A storage system that provides support for both block storage and object storage
Image Service: The delivery service provides discovery and registration for virtual disk images.

37. What is CPU Pinning in OpenStack Cloud Computing?
Answer: The CPU Pinning is defined as the process of reserving the physical core parts of virtual machines specified as per the requirement. It is also called the process of isolating the CPU.

38. What are the secluded design segments of OpenStack?
Answer: OpenStack is an open source and free arrangement of programming instruments or distributed computing stage which is used for overseeing and building distributed computing stage for the private and open cloud.

39. Specify what are the three parts that make the OpenStack modular architecture?
Answer: The three parts that make modular architecture for OpenStack are:
OpenStack Compute: For overseeing extensive systems of the virtual machine.
OpenStack Object Storage: The storage framework that offers help for both object storage and block storage.
Image Service: The conveyance service gives disclosure and enlistment to virtual disk pictures. 

40. What is Token?
Answer: Token is a type of authentication similar to password-based validation. A token gets generated once the user inserts the credentials and authenticates as a Keystone user. The token can then be used to access OpenStack services without any revalidation. It is interesting to note that a token is active for a limited period and must be renewed after regular intervals.
To create a token, users first need to authenticate their Keystone credentials.

41. What are the components of OpenStack?
Answer: The following is the list of the components of OpenStack –

1. Horizon – This is the basic component of OpenStack and is also the most important operator
2. Swift – Files, and objects are mainly stored here and certain information also gets stored.
3. Nova – Various kinds of computing tasks are handled by this engine called Nova.
4. Cinder – This refers to a specific kind of block storage system and files can be accessed at a very fast rate with the help of this.
5. Keystone – All the identities of the various users of OpenStack is known to be the Keystone.
6. Neutron – It connects the various deployment components.
7. Glance – The hard disk consists of various copies virtually and these are provided by Glance.
8. Heat – This is known to be an illustrating engine which stores various cloud applications in files and hence the infrastructure is well maintained.
9. Ceilometer – The users are provided billing services by this.

42. What Are The Main Components Of Identity User Management?
Answer: Users: It is a digital representation of a person, service or system who uses OpenStack cloud services

Roles: A role includes a set of rights and privileges. A role determines what operations a user is permitted to perform in a given tenant

Tenants: A container used to group or isolate resources or identity objects. Depending on service operator a tenant may map to a customer, account, organization or project.

43. Give An Example Where Logs Help In Openstack Security?
Answer: For instance, analyzing the access logs of Identity service or its replacement authentication system would alert us to failed logins, frequency, origin IP, whether the events are restricted to select accounts and other pertinent information. Log analysis supports detection.

44. What Are Data Privacy Concerns In OpenStack? How Can Those Be Remediated?
Answer: Data residency: Concerns over who possesses data in the cloud and whether the cloud administrator can be at last trusted as a caretaker of this data have been critical issues previously.
Data disposal: Best practices recommend that the administrator cleans cloud framework media (non-digital and digital) before to disposal, discharge out of organization or release for reuse.
Data not safely deleted: This might be remediated with the database as well as framework setup for auto vacuuming and intermittent free-space wiping.
Instance memory scouring, Cinder volume data, Image service delay delete feature.

45. Characterize bare-metal mode?
Answer: It grants access to control bare metal driver that handles the provisioning of OpenStack Compute physical equipment using the standard cloud APIs and devices like Heat. It is by and large utilized for single inhabitant clouds like high-performance figuring. For utilizing the exposed metal driver, a system interface must be made with the uncovered metal hub embedded into it. After a while, clients can dispatch an occasion from the node. Clients can likewise list and delete the bare metal nodes by expelling the related system instances. 

46. Explain Flavor. How to assign a task/inhabitant to a client?
Answer: Flavors are virtual equipment layouts exhibit in OpenStack, which characterize the memory sizes of hard disks, RAM, and so on. Flavors represent various parameters like ID, Name, Memory_MB, Disk, and others, giving a decision of Virtual Machine to the client simply like having a physical server. OpenStack dashboard likewise enables clients to alter a flavor by erasing the current one and making another with the comparable name and parameters.
By utilizing command, sudo nova-oversee client makes client name.

47. Define the bare-metal node?
Answer: Bare-metal node grants access to control bare-metal driver that handles the provisioning of OpenStack Compute physical hardware utilizing the standard cloud APIs and tools like Heat. It is generally used for single-tenant clouds like high-performance cluster computing. For using the bare-metal driver, a network interface must be created with the bare-metal node inserted into it. Afterward, users can launch an instance from the node. Users can also list and delete bare-metal nodes by removing the associated network instances.

48. Which configuration management tool is used by pack-stack utility?
Answer: Pack-stack utility uses the puppet as the configuration management tool for automating the OpenStack installation. In the background, the puppet pushes the configuration to the nodes based on the answer file configuration.

49. What is Swift?
Answer: Swift is the object-based storage that bypasses the file system structure. We can directly upload and download the different objects on swift storage. It is used, where the read is more and write, are less to objects. Swift is equivalent to Amazon S3.

50. What are the key components of OpenStack?
Answer: Horizon: the only GUI in OpenStack; the first component administrators see and get an idea of the current operations in the cloud.

Nova: chief computing engine to handle multiple virtual machines and computing tasks

Swift: reliable and robust storage system for files and objects helping developers to refer to a unique identifier and Openstack decide where to store the info.

Cinder: similar to the traditional computer storage system, it is a block storage system in OpenStack for accessing files at a faster speed.

Neutron: ensures efficient connectivity between components during deployment.

Keystone: a central identity list of all OpenStack cloud users and provides various mapping techniques to access methods against Keystone.

Glance: image service provider where images are the virtual copies of hard disks. Allows using the images as templates during deployment of new instances.

Ceilometer: component providing billings services and other telemetry services to cloud users. Maintains an account of component system usage by each user.

Heat (Orchestration Engine): Allows developers to orchestrate/illustrate and store the cloud application requirements and resources needed in a file, thereby maintaining the cloud infrastructure.

Q:1 Define OpenStack and its key components?
Ans: It is a bundle of opensource software, which all in combine forms a provide cloud software known as OpenStack.OpenStack is known as Stack of Open source Software or Projects.

Following are the key components of OpenStack

Nova – It handles the Virtual machines at compute level and performs other computing task at compute or hypervisor level.
Neutron – It provides the networking functionality to VMs, Compute and Controller Nodes.
Keystone – It provides the identity service for all cloud users and openstack services. In other words, we can say Keystone a method to provide access to cloud users and services.
Horizon – It provides a GUI (Graphical User Interface), using the GUI Admin can all day to day operations task at ease.
Cinder – It provides the block storage functionality, generally in OpenStack Cinder is integrated with Chef and ScaleIO to service block storage to Compute & Controller nodes.
Swift – It provides the object storage functionality. Generally, Glance images are on object storage. External storage like ScaleIO can work as Object storage too and can easily be integrated with Glance Service.
Glance – It provides Cloud image services, using glance admin used to upload and download cloud images.
Heat – It provides an orchestration service or functionality. Using Heat admin can easily VMs as stack and based on requirements VMs in the stack can be scale-in and Scale-out
Ceilometer – It provides the telemetry and billing services.

Q:2 What are services generally run on a controller node?
Ans: Following services run on a controller node:

Identity Service ( KeyStone)
Image Service ( Glance)
Nova Services like Nova API, Nova Scheduler & Nova DB
Block & Object Service
Ceilometer Service
MariaDB / MySQL and RabbitMQ Service
Management services of Networking (Neutron) and Networking agents
Orchestration Service (Heat)

Q:3 What are the services generally run on a Compute Node?
Ans: Following services run on a compute node,

Nova-Compute
Networking Services like OVS

Q:4 What is the default location of VMs on the Compute Nodes?
Ans: VMs in the Compute node are stored at “/var/lib/nova/instances”

Q:5 What is default location of glance images?
Ans: As the Glance service runs on a controller node, all the glance images are store under the folder “/var/lib/glance/images” on a controller node.

Q:7 How to list the network namespace of a tenant in OpenStack?
Ans: Network namespace of a tenant can be listed using “ip net ns” command


~# ip netns list 
qdhcp-a51635b1-d023-419a-93b5-39de47755d2d
haproxy
vrouter

Q:8 How to execute command inside network namespace in openstack?
Ans: Let’s assume we want to execute “ifconfig” command inside the network namespace “qdhcp-a51635b1-d023-419a-93b5-39de47755d2d”, then run the beneath command,

Syntax : ip netns exec {network-space} <command>

~# ip netns exec qdhcp-a51635b1-d023-419a-93b5-39de47755d2d "ifconfig"

Q:10 How to reset error state of a VM into active in OpenStack env?
Ans: There are some scenarios where some VMs went to error state and this error state can be changed into active state using below commands,

~# nova reset-state --active {Instance_id}
Q:11 How to get list of available Floating IPs from command line?
Ans: Available floating ips can be listed using the below command,

~]# openstack ip floating list | grep None | head -10

Q:18 How to list the endpoints of openstack services?
Ans: Openstack service endpoints are classified into three categories,

Public Endpoint
Internal Endpoint
Admin Endpoint
Use below openstack command to view endpoints of each openstack service,

~# openstack catalog list
To list the endpoint of a specific service like keystone use below,

~# openstack catalog show keystone

Q:19 In which order we should restart nova services on a controller node?
Ans: Following order should be followed to restart the nova services on openstack controller node,


service nova-api restart
service nova-cert restart
service nova-conductor restart
service nova-consoleauth restart
service nova-scheduler restart


:22 How to view the OVS bridges configured on Controller and Compute Nodes?
Ans: OVS bridges on Controller and Compute nodes can be viewed using below command,

~]# ovs-vsctl show
Q:23 What is the role of Integration Bridge(br-int) on the Compute Node ?
Ans: The integration bridge (br-int) performs VLAN tagging and untagging for the traffic coming from and to the instance running on the compute node.


Packets leaving the n/w interface of an instance goes through the linux bridge (qbr) using the virtual interface qvo. The interface qvb is connected to the Linux Bridge & interface qvo is connected to integration bridge (br-int). The qvo port on integration bridge has an internal VLAN tag that gets appended to packet header when a packet reaches to the integration bridge.

Q:24 What is the role of Tunnel Bridge (br-tun) on the compute node?
Ans: The tunnel bridge (br-tun) translates the VLAN tagged traffic from integration bridge to the tunnel ids using OpenFlow rules.

br-tun (tunnel bridge) allows the communication between the instances on different networks. Tunneling helps to encapsulate the traffic travelling over insecure networks, br-tun supports two overlay networks i.e GRE and VXLAN

Q:25 What is the role of external OVS bridge (br-ex)?
Ans: As the name suggests, this bridge forwards the traffic coming to and from the network to allow external access to instances. br-ex connects to the physical interface like eth2, so that floating IP traffic for tenants networks is received from the physical network and routed to the tenant network ports.


Q:26 What is function of OpenFlow rules in OpenStack Networking?
Ans: OpenFlow rules is a mechanism that define how a packet will reach to destination starting from its source. OpenFlow rules resides in flow tables. The flow tables are part of OpenFlow switch.

When a packet arrives to a switch, it is processed by the first flow table, if it doesn’t match any flow entries in the table then packet is dropped or forwarded to another table.

Q:29 What are Neutron Agents and how to list all neutron agents?
Ans: OpenStack neutron server acts as the centralized controller, the actual network configurations are executed either on compute and network nodes. Neutron agents are software entities that carry out configuration changes on compute or network nodes. Neutron agents communicate with the main neutron service via Neuron API and message queue.

Neutron agents can be listed using the following command,


~# openstack network agent list -c ‘Agent type’ -c Host -c Alive -c State

Q:30 What is CPU pinning?
Ans: CPU pinning refers to reserving the physical cores for specific virtual machine. It is also known as CPU isolation or processor affinity. The configuration is in two parts:

it ensures that virtual machine can only run on dedicated cores
it also ensures that common host processes don’t run on those cores
In other words we can say pinning is one to one mapping of a physical core to a guest vCPU.
