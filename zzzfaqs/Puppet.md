# Puppet

Puppet is an open source systems management tool for centralizing and automating configuration management. Configuration management is the detailed recording and updating of information that describes an enterprise's hardware and software. 

Puppet has two layers: a configuration language to describe how the hosts and services should look, and an abstraction layer that allows the administrator to implement the configuration on a variety of platforms, including Unix, Linux, Windows and OS X.  Administrators can encode the configuration of a service as a policy, which Puppet then monitors and enforces. 

Puppet is written in Ruby and uses its own domain specific language (DSL) for creating and managing modules. The basic version of Puppet configuration management, which is called Open Source Puppet, is available directly from Puppet's website and is licensed under the Apache 2.0 system. Puppet Enterprise has additional functionality including orchestration, role-based access control (RBAC) and compliance reporting.

Popular Puppet ecosystem modules include: 
Puppet Forge - a repository that provides access to over 4,000 pre-built user contributed modules.
Beaker - a test harness focused on acceptance testing for interactions between multiple virtual machines (VMs).
Facter - a tool for gathering basic facts about nodes, including hardware details, network settings, operating system (OS) type and version.
Hiera - a key/value lookup tool for configuration data.
MCollective - a framework for building server orchestration or parallel job execution systems.
PuppetDB - a searchable database that stores information about every node. 
Razor - an advanced provisioning application for discovering and deploying bare-metal VMs and virtual systems.
Trapperkeeper - a Clojure framework for hosting long-running applications

# Video Links
https://www.youtube.com/watch?v=llcjg1R0DdM
https://www.youtube.com/watch?v=lV1g9-Zta1M

Automation is the present-day keyword for every business. Automation of business processes is ideal for reducing costs as well as gaining a competitive advantage over peers. Therefore, many tools gained popularity for providing the advantages of automation. One of the most prominent tools in this context is Puppet.

Various organizations employ Puppet for configuration management in automation. Therefore, the demand for IT professionals skilled in Puppet is increasing gradually every day. Along the same lines, the demand for puppet interview questions is also increasing. Many candidates want to know more about the interview questions so that they can have a basic idea.

1. What is Puppet?
Answer: This is one of the most common interview questions on the puppet. Puppet is an open-source configuration management tool for deployment, configuration, and management of servers. You can also define Puppet Enterprise as a DevOps software platform tailored for automating infrastructure administration tasks. The different features of Puppet include infrastructure automation, automated provisioning, task management, code management, visualization, and reporting. Puppet also provides features for orchestration as well as discovery & insights.

2. Explain Puppet architecture.
Answer: Candidates will find this as a follow-up question among other puppet interview questions. Puppet follows a Master-Slave architecture. The Puppet Slave has to send a request to the Puppet Master for establishing a secure connection. The Puppet Master sends the Master Certificate along with a request for Slave Certificate. Then, the Puppet Slave sends the Slave Certificate to the Puppet Master along with a request for data. The Puppet Master receives the request and then pushes the configuration on the Puppet Slave.

Also Check: Chef vs Puppet

3. Can you tell how Puppet works?
Answer: You should always expect this as one of the most common puppet interview questions. The response to this question should deal with Puppet architecture again. First of all, a node or a Puppet Agent sends Facts or data pair representing the state of Puppet Slave. The Facts can include details of the Puppet Slave up-time, IP address or operating system. The Puppet Master utilizes the Facts for developing a Catalog.

The Catalog defines the specifications for configuration of the Slave. It describes the desired state for each resource managed by the Puppet Master on Slave. In the next step, the Puppet Slave sends Reports to the Master informing about the completion of the configuration process. The Reports could be seen in the Puppet dashboard. Candidates should keep in mind that comprehensiveness is the key factor for responding to interview questions on Puppet.

4. What do you know about Puppet manifests?
Answer: This is a very important mention among puppet interview questions. The definition of Puppet Manifests is the best way to respond to this question. The Puppet Master contains the configuration details of all nodes or Puppet Agents documented in native Puppet language. These documentations are known as Puppet Manifests. So, you can find that Manifests are built of Puppet code. You can distinguish manifests with the .pp extension. Therefore, Manifests are puppet programs.

5. What do you know about the Puppet module?
Answer: Another common mention among top puppet interview questions relates to puppet modules. Puppet modules are collections of manifests and data such as files, templates, and facts. Modules also have a particularly defined directory structure. Modules are ideal instruments for organizing Puppet code into different manifests. Therefore, Puppet Modules are the recommended best practice for organizing all Puppet Manifests.

6. Do you know about Facter?
Answer: Facter is one of the basic topics in common puppet interview questions. Facter is a library that identifies and reports Facts relevant to each Agent to the Puppet Master. Facts can include SSH keys, network settings, hardware details, IP addresses, OS type, and version, and Mac addresses. The facts are then found as variables in the Manifests of the Puppet Master.

7. What do you know of the Puppet Catalog?
Answer: You can find this mention in the best puppet interview questions for fresher candidates. The Puppet Catalog is a document used by Puppet Agent for configuration of a node. The agent downloads the catalog from the Puppet Master. The catalog describes the desired state of each resource that has to be managed.

Also, the catalog can contain information about dependencies among resources for their effective management. Candidates can also improve their answer to this mention among top puppet interview questions. You can state information about the sources of configuration info used for the compilation of a catalog. The three sources of configuration info are puppet manifests, data provided by the agent, and external data.

8. Can you explain about a class in Puppet?
Answer: The best puppet interview questions for fresher would always deal with basic information on the puppet. Class is a block of puppet code stored in modules for using later on. Unless you invoke classes in puppet by name, they are not applied. You can add a class to a node’s catalog by assigning them from an ENC. Classes could be added to catalog by declaring them in the manifests. Classes are ideal for configuration of large or medium-sized bits of functionality. The functionalities can include all the packages, services needed for running an application, and config files.

9. How do Puppet Agent nodes communicate with Puppet Masters and vice-versa?
Answer: You can find out-of-the-blue puppet interview questions just like this one. The communication between Puppet agent nodes and Puppet Masters depends on HTTPS with client verification. The Puppet Master has an HTTP interface with different endpoints. Agents make an HTTPS request to the endpoints for requesting or submitting anything to the master. Client verification, in this case, implies the need for SSL certificate. The SSL certificates help in verifying the identity of the other party. Puppet also has an in-built certificate authority for effective management of certificates.

10. What is the stand-alone architecture in Puppet?
Answer: Candidates should also be prepared for tricky puppet interview questions. In the stand-alone architecture, every managed node has a complete copy of configuration info. Each managed node also compiles its catalog. The stand-alone architecture in Puppet involves running the Puppet apply application on managed nodes. The Puppet applies application is generally a scheduled task that can be used for smaller configuration tasks. The Puppet applies application also requires access to different sources of configuration data like the Puppet master application.

11. How can you upgrade Puppet and Facter?
Answer: Even though this may not be one of the frequently asked puppet interview questions, it is important. The package management system of an operating system is the best approach for installation and upgrading Puppet and Facter. You can use either a public repository in Puppet Lab or the repository of your vendor. In cases of installation of Puppet from source, ensure removal of old versions completely before the upgrade. However, you don’t have to worry about configuration data between installation processes.

12. Does the organization size matter for using Puppet?
Answer: This is also a common entry among puppet interview questions for fresher candidates. You cannot find a specific organization size that could obtain advantages of Puppet. However, certain organization sizes can get the most from the use of Puppet. Organizations which have more servers could gain major benefits from Puppet by eliminating various tasks involving manual management. On the other hand, organizations with few servers would not gain much from the puppet. Smaller organizations could carry out maintenance of their servers without using the puppet.

13. According to you, what type of organizations can utilize Puppet?
This is one of the most popular puppet interview questions that are asked to interview candidates. There is no specific rule relating to the application of Puppet, the open-source configuration management tool. But the entities that have a large number of servers will significantly benefit by using Puppet in the organizational setting.

Puppet will make sure that it eliminates the need for manually managing the firm’s servers. The organizations which have few servers are less likely to derive high benefits from the Puppet tool. This is because manual management of a few servers will not be a tough thing to do.

14. What do you know about Puppet Labs?
It is one of the most frequently asked puppet interview questions that interviewees might face during the interview process. Puppet Labs is an organization that is interested in addressing the problems and issues that arise relating to the Puppet automation process. In the year 2016, the organization changed its name from “Puppet Labs” to “Puppet.”

The objective of doing so was to reflect the fact that the Puppet community has a strong link with the business entity. The mission of Puppet organization is to lend support to every organization so that they can improve the software in service and serve their clients better.

15. What is unique about the Puppet’s model-driven design?
This is one of the latest puppet interview questions that interviewers ask the candidates. Conventionally, the management of configurations of a large group of computers was quite complex as it involved a series of steps. But with time, the approach has become more sophisticated. Puppet takes an altogether unique approach. It models everything, including the intended configuration state, the prevailing state of the node, the actions undertaken during the configuration enforcement process.

It helps to resolve issues relating to configuration drift as well as the unknown system state. The system admins can add significant value to their puppet deployments by using the tool.

16. Why Must Puppet be considered for an organization’s cloud and servers?
The Puppet tool must be considered for an organization’s cloud, and servers as the innovative tool have the potential to define infrastructure as code. It can even manage a large number of servers in a highly efficient and dynamic manner. Puppet is considered to be one of the greatest DevOps programs that can be used to enforce system configurations.

This deployment tool can be used on Windows, Linux, and several other platforms to pull the string on numerous application servers simultaneously. It has wide industry support across the DevOps and cloud environment. By using Puppet, firms can ensure that it will work with all kinds of servers that are available today.

17. What are some of the Puppet use cases?
The Puppet tool can be used in various scenarios, which is why it is considered to be extremely crucial in the DevOps setting. Puppet is used for giving distinct configurations to every host. The on-going checking is necessary to make sure whether the necessary configuration is in place or not. Puppet helps to minimize the overall cost and effort that is required to make slight alterations in a large number of systems. The deployment tool gives a clear insight into the change control mechanism. The tool will help to upgrade the entire software package throughout the entire organization.

18. How is the Puppet tool trending currently?
The Puppet tool is gaining a lot of attention in the digitalized times form various reasons. A large number of developers add value to the source of the management tool. It has a large user base. This is because almost 30,000 organizations and numerous universities make use of the deployment tool regularly.

Puppet has a decent commercial use since the day of its inception. The puppet servers can run on any kind of platform that can host Ruby, such as Microsoft Windows Server and Oracle Enterprise Linux. It can also run on different deployment models like private, public, and hybrid clouds.

19. What are some of the key areas that can improve by using Puppet?
By implementing Puppet in the organizational setting, several functional areas can be streamlined and improved. Puppet helps business organizations to strengthen their infrastructure so that they can keep pace with the industry. It improves the overall scalability and consistency throughout the enterprise. The level of flexibility can be increased by implementing Puppet in the organizational context.

A firm will be in a position to effectively and efficiently match the desired configuration for the appropriate machines. The Puppet tool will also enable business entities to get a proper infrastructural insight so that a large number of servers can be efficiently managed.

20. Which command helps in checking certificate requests to the Puppet Master from Puppet Slave?
Answer: Puppet interview questions and answers for experienced candidates will deal with practical aspects like this one. The command for checking the list of Certificate signing requests to the Puppet Master from Puppet Agent is “puppet cert list.” You have to run the command on Puppet Master. You can also sign a specific Certificate execute through the command “puppet cert sign <Hostname of agent>.” The command “puppet cert sign all” is ideal for signing all certificates at once.

21. What are the “etckeeper-commit-post” and “etckeeper-commit-pre” commands?
Answer: Candidates can find puppet interview questions related to specific commands and requirements. The “etckeeper-commit-post” is a configuration file for defining scripts and commands. The configuration file runs after the Master pushes configuration on the slave or the agent. The “etckeeper-commit-pre” is also a configuration file for definition of scripts and commands. This command executes before the Master pushes configuration on the Agent.

22. Which characters are allowed in a class name, module name, and identifiers?
Answer: This entry is one of the simplest puppet interview questions and answers for experienced candidates. Class names could have lowercase letters, underscores, and numbers. Class names should always start with a lowercase letter. The Scope Resolution Operator (“::”) is the namespace separator for class names. The characters allowed in the case of Class names are also applicable in the case of defining module names.

The rules are also applicable to the definition of resource types and parameters. However, modules and parameters cannot apply the namespace operator. Variables or identifiers are also subject to certain rules for permitted characters. Variable names are case-sensitive and could include underscores as well as alphanumeric characters.

23. What versions of Ruby are supported by Puppet?
Answer: There are specific versions of Ruby tested specifically for Puppet while some versions are not tested. You can run the command “ruby -version” for checking the version of Ruby on the system. Puppet versions after Puppet 4 do not depend on Ruby version of the OS because it bundles own Ruby environment.

Now, you could install a puppet agent with any version of Ruby or for any systems without installing Ruby. Puppet Enterprise does not depend on the Ruby version of the OS because of the bundling of its own Ruby environment. PE installation with another version of Ruby or in systems without Ruby installation is possible.

24. What happens if you don’t sign a CLA?
Answer: This entry among puppet interview questions is ideal for experienced candidates. Without signing a CLA, code contributions to Puppet or Facter are not accepted. Users should log in their GitHub account for signing the agreement on the CLA page.

25. What is the process for documentation of manifests?
Answer: You can also find this mention among frequently asked puppet interview questions for experienced candidates. The puppet language has a simple documentation syntax. You can find the syntax on the Puppet Manifest Documentation Wiki page. The puppet doc command leverages this syntax for automatic generation of RDoc or HTML documents for modules and manifests.

26. What is the codedir in Puppet?
Answer: Candidates can find this entry among puppet interview questions commonly. The codedir in Puppet is the main directory ideal for puppet data and code. The codedir contains environments that hold manifests and modules. Also, you can find Hiera data and a global modules directory.

27. Where is the codedir configured in Puppet?
Answer: Practical puppet interview questions can fetch better chances of employment. The puppet.conf is ideal for configuration of the location of codedir with the codedir setting. However, Puppet Server uses its JRuby-puppet.master-code-dir Setting with the puppetserver.conf. In the case of non-default codedir, you have to change both settings.

28. What are permanent and temporary test environments?
Answer: Permanent test environment involves a stable group of test nodes. All the changes should be successful for integration with the production code. Test nodes in permanent test environments are smaller versions of the complete production infrastructure. Temporary test environment allows testing of a single change or group of modifications. The testing process involves a review of changes out of version control into the $codedir/environments directory. Temporary test environments have descriptive names or a commit ID from the underlying version.

29. What is Hiera?
Answer: Hiera is a key-value lookup ideal for separation of data from Puppet code. Hiera serves as the in-built key-value configuration data lookup apparatus of Puppet. Hiera is ideal for storing configuration data in key-value pairs. It is also ideal for finding out data needed by a specific module for a given node.

30. What are Virtual Resources in Puppet?
Answer: Virtual Resources in Puppet are instruments for the specification of a particular state of a resource. However, Virtual Resources do not require the implementation of the specific state for the resource. You can declare virtual resources once but can realize them many times.

31. Is Puppet suitable for managing workstations?
Answer: A puppet is an ideal tool for managing almost any machine. Puppet is a major tool for managing various organizations that have various systems.

32. What are the open-source or community tools for making Puppet more powerful?
Answer: Jira is a preferred tool for ticketing changes and requests, thereby providing ease of management through internal processes. Git and Puppet Code Manager app is suitable for managing Puppet code in unison with best practices. Furthermore, the breaker testing framework in the continuous integration pipeline in Jenkins can help in running all Puppet modifications.

33. What is the difference between a Manifest and a Module?
It is one of the top puppet interview questions that interviewers during the interview. In Puppet, a Manifest is a file that contains Puppet DSL code. It is a .pp file with DSL commands which could contain the necessary, desired, and relevant state configurations. A manifest could be node-specific, and it can be organized into a catalog. Manifests are applicable on a Puppet Agent server or a local server.

Modules can be defined as the structure that is used to create ‘portable cords.’ Mostly, modules encompass manifests, they also generally encompass templates, files, test cases along with metadata. A module that does not contain manifest can also be created.

34. What do you know about MCollective?
It is one of the best puppet interview questions that candidates are expected to answer to impress the interviewer. MCollective is also known as the Marionette Collective. It refers to a framework that is used for creating parallel job-execution systems or server orchestration. A majority of the users can programmatically execute varying administrative tasks on the collection of servers.

MCollective is the tool that has been designed by Puppet labs so that it can help to run thousands of jobs in parallel while making use of the existing plugins. For interacting parallelly with multiple hosts simultaneously, it uses publish/subscribe middleware.

35. Why does the Puppet tool have its very own language? Why YAML and XML are considered incompatible?
This is one of the top puppet interview questions that is asked to the candidates during the interview process. The language that is used for manifests is finally the Puppet’s human interface. YAML and XML are the data formats that are developed around the processing capabilities of computer systems, and thus they are not appropriate human interfaces.

Even though there are individuals who can read and write them, YAML and XML restrict the assurance that the specific interface was declarative. There is a possibility that one process will treat a YAML configuration or XML configuration different from another process.

36. If the servers are all unique, can Puppet be helpful?
This is one of the best puppet interview questions that might seem to be puzzling for an interviewee. The Puppet tool will be helpful even if all the servers are unique. All servers are unique in some way or another, but they are not unique. For instance, even if the IP addresses or the hostname might be different, generally servers run on relatively standard Operating System (OS).

In case a server is unique, Puppet can be useful as it will help in terms of uniqueness as well as consistency. It will help to express the expected consistency, and it can allow special provisions so that the server’s uniqueness can be handled.

37. What do you understand by module-path in Puppet?
It is one of the most popular puppet interview questions that interviewees are likely to come across during an interview. In Puppet, the puppet master server, as well as the puppet, apply command load a majority of their content from modules that are found in one or more directories.

The list or record of directories where the Puppet tool searches for modules is known as a module path. The environment of the current node sets the module-path. module-path can also be defined as the ordered list of directories where the former directories are given priority over the latest ones.

38. What is the cache directory in Puppet?
This is one of the most frequently asked puppet interview questions that candidates will come across during the interview process. In Puppet, the cache directory is also known as ‘vardir.’ It refers to the location which contains growing and dynamic data that the Puppet tool creates in the course of the typical and normal operational activities.

Some of the data that is stored in the cache directory can be mined so that interesting analysis can be carried out. It can also be used for integrating other tools with the Puppet tool. Cache directory acts as an indispensable component of the Puppet tool.

39. What are ‘Divided Infrastructure’ in Puppet?
In case, specific parts of the infrastructure are managed and handled by different teams that do not need to coordinate and align their code; they can be categorized into varying environments. This refers to divided infrastructure in Puppet. The splitting of the different parts of the infrastructure in Puppet is known as “Divided Infrastructur”.

It is one of the key types of “Environments” in Puppet. The other categories of the environment include permanent test environments and temporary test environments. There is no interdependence between the teams that work on the infrastructure, so the splitting of the environment seems to be a feasible option.

40. What do you understand by “Environments” in Puppet?
It is one of the latest puppet interview questions that are asked to interview candidates. In Puppets, the term “Environments” refers to the isolated groups of Puppet agent nodes. An environment is a branch that converts into a directory in the master.

A Puppet master is responsible for serving every environment with its central manifest as well as a module path. This enables to utilize varying versions of the same modules for different categories of nodes. Thus, it is considered to be extremely useful for making testing changes to the Puppet code before their implementation of the production equipment and machines.

What is Puppet?
I will advise you to first give a small definition of Puppet. Puppet is a Configuration Management tool which is used to automate administration tasks.

Features of Puppet
Feature	Description
Infrastructure Automation	It defines and continuously enforces the IT configurations no matter where your infrastructure lives.
Automated
Provisioning	It provides an automated provisioning across your heterogeneous IT infrastructure.
Task
Management	It can make changes or remediate urgent problems alongside the model-driven automation management.
Visualization & Reporting	It gives you an insight into your infrastructure, audit changes, & get rich reporting in a graphical console.
Code
Management	It manages the infrastructure as code using version control systems to enable continuous delivery.
Discovery &
Insights	It can quickly discover resources that need automated management and drive change.
Orchestration	It lets you orchestrate change with control, visibility, & automated intelligence.

Now, you should describe how Puppet Master and Agent communicates.
Puppet has a Master-Slave architecture in which the Slave has to first send a Certificate signing request to Master and Master has to sign that Certificate in order to establish a secure connection between Puppet Master and Puppet Slave as shown on the diagram below. Puppet Slave sends a request to Puppet Master and Puppet Master then pushes configuration on Slave.

What are Puppet Manifests?
It is a very important question and just make sure you go in a correct flow according to me you should first define Manifests.
Every node (or Puppet Agent) has got its configuration details in Puppet Master, written in the native Puppet language. These details are written in the language which Puppet can understand and are termed as Manifests. Manifests are composed of Puppet code and their filenames use the .pp extension.
Now give an example, you can write a manifest in Puppet Master that creates a file and installs apache on all Puppet Agents (Slaves) connected to the Puppet Master. 

What is Puppet Module and How it is different from Puppet Manifest?
For this answer I will prefer the below mentioned explanation:
A Puppet Module is a collection of Manifests and data (such as facts, files, and templates), and they have a specific directory structure. Modules are useful for organizing your Puppet code, because they allow you to split your code into multiple Manifests. It is considered best practice to use Modules to organize almost all of your Puppet Manifests.
Puppet programs are called Manifests. Manifests are composed of Puppet code and their file names use the .pp extension. 

What is Facter in Puppet?
You are expected to answer what exactly Facter does in Puppet so, according to me you should start by explaining:
Facter is basically a library that discovers and reports the per-Agent facts to the Puppet Master such as hardware details, network settings, OS type and version, IP addresses, MAC addresses, SSH keys, and more. These facts are then made available in Puppet Master’s Manifests as variables.

What is Puppet Catalog?
I will suggest you to first, tell the uses of Puppet Catalog.
When configuring a node, Puppet Agent uses a document called a catalog, which it downloads from a Puppet Master. The catalog describes the desired state for each resource that should be managed, and may specify dependency information for resources that should be managed in a certain order.
If your interviewer wants to know more about it mention the below points:
Puppet compiles a catalog using three main sources of configuration info:
Agent-provided data
External data
Puppet manifests

What size organizations should use Puppet?
There is no minimum or maximum organization size that can benefit from Puppet, but there are sizes that are more likely to benefit. Organizations with only a handful of servers are unlikely to consider maintaining those servers to be a real problem, Organizations with many servers are more likely to find, difficult to manage those servers manually so using Puppet is more beneficial for those organizations.

How should I upgrade Puppet and Facter?
The best way to install and upgrade Puppet and Facter is via your operating system’s package management system, using either your vendor’s repository or one of Puppet Labs’ public repositories.
If you have installed Puppet from source, make sure you remove old versions entirely (including all application and library files) before upgrading. Configuration data (usually located in/etc/puppet or /var/lib/puppet, although the location can vary) can be left in place between installs.

Puppet Questions

Q1) What is Puppet?
Ans: Puppet is a tool utilized for configuration management on both UNIX based and Microsoft windows working frameworks. Its principal objective is to make the administration of countless machines less complex, progressively solid, and with more automation. Puppet utilizes its own definitive language to depict the arrangement of a framework or system of frameworks. It is likewise generally used to automate system administration tasks.

Q2) What is store configs?
Ans: Storeconfigs is a puppetmaster option that stores the hub's genuine design to a database. It does this by contrasting the aftereffect of the last aggregation against what is in the database, asset per asset, then parameter per parameter, etc.

Q3) How can you use store configs?
Ans: The quick utilization of store configs is exported assets. Exported assets are assets that are prefixed by @@. Those assets are checked extraordinarily so they can be gathered on a few different hubs. Some example use cases are:

Share/disseminate open keys (ssh or OpenSSL or different sorts)
Build rundown of hosts running a few administrations (for checking)
Build arrangement documents that require numerous hosts (for example/and so on/resolve.conf can be the link of records sent out by your DNS cache hosts
Q4) What do you mean by facter and explain some use cases for the same?
Ans: At some point, you have to compose shows on contingent articulation dependent on conditional expression based data which is accessible through Facter. Facter gives data like Kernel adaptation, Distribution discharge, IP Address, CPU information, and so forth. You can characterize your own custom realities. Facter can be utilized autonomously from Puppet to accumulate data about a framework. Regardless of whether it's parsing the/proc/xen index on Linux or running prtdiag order on Solaris, the tool works superbly abstracting the particular working framework orders used to decide the collection of facts. At the point when utilized related to Puppet, realities assembled through the framework permits the manikin ace to settle on savvy choices during show gathering.

Inside your manikin show, you can reference any key worth sets given by facter by prefixing the hash key with "$". If the default set of realities are not adequate, there are two different ways to stretch out Facter to give extra truth. One route is to utilize Ruby, the other path is by utilizing condition factors prefixed with FACTER_. S. This permits one to set for every node data and use it in our shows.

Q5) What are Manifests?
Ans: In Puppet, the files in which client configuration is specified are known as Manifests.

Q6) What is MCollective?
Ans: MCollective is a powerful orchestration framework. Run actions on thousands of servers simultaneously, using existing plugins or writing your own.

Q7) What are classes?
Ans: Classes are named squares of Puppet code that are put away in modules for some time in the future and are not applied until they are invoked by name. They can be added to a node’s list by either announcing them in your shows or allocating them from an ENC. Classes for the most part arrange huge or medium-sized lumps of usefulness, for example, the entirety of the bundles, config records, and administrations expected to run an application.

Q8) How can you test manifest files?
Ans: Clarify how you will initially run linguistic structure checks with manikin parser approval order. In the event that you are utilizing VIM, you can utilize modules like Syntastic to confirm code (or else) utilize a full-fledged IDE like Geppetto. Additionally use puppet build-up to confirm notwithstanding puppet parser. You can add RSpec/cucumber tests to your application. (Be Careful: RUBY aptitudes are required) and use Cucumber in independent mode to test your manifests.

Q9) Why should you use MCollective over plain vanilla Puppet?
Ans: The Marionette Collective, otherwise called MCollective, is a structure for building server coordination or equal occupation execution frameworks. Most clients automatically execute authoritative assignments on groups of servers. MCollective has some special qualities for working with huge quantities of servers:

Rather than depending on a static rundown of hosts to order, it utilizes metadata-based revelation and sifting. It can utilize a rich information source like PuppetDB or can perform constant disclosure over the system.

Rather than legitimately associating with each host (which can be asset serious and moderate), it utilizes distribute/buy-in middleware to impart in corresponding with numerous hosts on the double.

Q10) What data source types are supported in HIERA?
Ans: JSON and YAML

Q11) What is the LDAP node classifier?
Ans: LDAP can be used to store information about nodes and servers. The LDAP Node Classifier is used to query LDAP for node information instead of an ENC.

Q12) Explain the use of etckeeper-commit-post and etckeeper-commit-pre-on Puppet Agent.
Ans: etckeeper-commit-post: In this configuration file, you can define command and scripts which executes after pushing configuration on Agent Etckeeper-commit-pre: In this configuration file you can define command and scripts which executes before pushing configuration on Agent

Q13) Explain Puppet Kick.
Ans: By default, Puppet Agent requests a Puppet Master after a periodic time which is known as “run interval”. Puppet Kick is a utility that allows you to trigger the Puppet Agent from Puppet Master.

Q14) Differentiate between class definition and class declaration.
Ans: Defining a class makes it accessible for later use. It doesn't yet add any assets to the index; to do that, you should declare it or assign it from an ENC.

Q15) Explain ordering and relationship.
Ans: As a matter of course, Puppet applies assets in the request they're proclaimed in their show. Be that as it may, if a gathering of assets should consistently be overseen in a particular request, you should unequivocally declare such relationships with relationship meta parameters, chaining arrows, and the required function. Puppet utilizes four meta parameters to set up connections, and you can set every one of them as a trait in any asset. The estimation of any relationship meta parameter should be an asset reference (or array of references) highlighting at least one objective asset.

before - Applies an asset before the objective asset

requires - Applies an asset after the objective asset

notifies - Applies an asset before the objective asset. The objective asset revives if the advising asset changes.

subscribe - Applies an asset after the objective asset. The subscribing resource refreshes if the objective asset changes. 

If the two assets need to occur altogether, you can either place a preceding characteristic in the earlier one or a required property in the resulting one; either approach makes a similar relationship. The equivalent is valid for notify and subscribe.

Puppet Interview Questions And Answers For Experienced
Q16) Explain the design patterns you have used in your Puppet code.
Ans: Here is a tip to answer this question: Be exceptionally clear on this as this tests your development knowledge rather than sysadmin aptitudes. In any event, you will be tested profoundly on job/profile designs – this is the best and most complex way to deal with looking after code. Notice Anchor patterns and clarify why you are utilizing it. You should just utilize this example before Puppet 3.4 or PE 3.2.

Q17) Share some best practices for Puppet.
Ans: Some accepted procedures are recorded beneath:

Use Modules and Role/Profile design however much as could reasonably be expected.

Keep all code in form control with distributed modules/manifests being sourced from formally tested/released branches.

Utilize environments - Each environment is attached to a particular branch in the version control system.

Utilize Dry runs – use puppet agent  - verbose -noop - test. 

Manage Puppet module dependencies utilizing librarian Puppet. Version control and manage your Puppetfile

Keep data and code separate. Explicitly keep delicate data inside Hiera YAML documents (which are additionally form controlled).

The trick to doing the above is to utilize JSON records for classified information and YAML for non-confidential data and guarantee physical security to the JSON Folder where nobody aside from the root/puppet client can get to.

Q18) Explain r10k.
Ans: R10k gives a universally useful toolset to conveying Puppet conditions and modules. It executes the Puppetfile design and gives a local usage of Puppet dynamic situations. R10k has two essential jobs: introducing Puppet modules utilizing an independent Puppetfile, and overseeing Git and SVN based unique conditions

Q19) What common workflow is used for r10k?
Ans: A great part of the basic work process relies upon the standard git-flow to create highlight branches and rolling out all improvements in include branches, conveying the earth in test mode, and on the confirmation, converging to a branch before tidying up the highlighted branch. On the off chance that you are not utilizing the standard git-flow, receive likewise.

Q20) Can Puppet run on unique servers?
Ans: Puppet can run on servers that are interesting. Despite the fact that there may be exceptionally fewer odds of servers being special since inside an association there are a ton of likenesses that exist like the working framework that they are running on, etc.

Q21) Explain the architecture of Puppet.
Ans: Puppet is Open Source programming. It depends on the Client-server design. It is a Model-Driven framework. The customer is likewise called Agent. What's more, the server is known as the Master. It has the accompanying building parts:

Configuration Language: Puppet gives a language that is utilized to design Resources. We need to indicate what Action must be applied to which Resource. The Action has three things for every Resource: type, title, and rundown of characteristics of an asset. Puppet code is written in Manifests documents. 

Resource Abstraction: We can make Resource Abstraction in Puppet with the goal that we can design assets on various stages. The puppet operator utilizes a Factor for passing the data of a domain to the Puppet server. In Fact, we have data about IP, hostname, OS, and so on of the earth.

Transaction: In Puppet, Agent sends Factor to the Master server. Ace sends back the inventory to the Client. The specialist applies any arrangement changes to the framework. When all progressions are applied, the outcome is sent to the Server.

Q22) Can Puppet manage workstations?
Ans: Yes, Puppet can manage any machine and is used to manage many organizations that have a mix of laptops and desktops.

Q23) What size of organizations utilize Puppet?
Ans: There is no base or most extreme organization size that can profit by Puppet, however, there are sizes that are bound to profit. Organizations with just a bunch of servers are probably not going to consider keeping up those servers to be a genuine issue, while those that have more need to consider cautiously how they dispense with manual management tasks.

Q24) What characters are permitted in a class name? In a module name or in other identifiers?
Ans: Class names can contain lowercase letters, numbers, and underscores, and should begin with a lowercase letter. It can be used as a namespace separator. The same rules should be used when naming defined resource types, modules, and parameters, although modules and parameters cannot use the namespace separator. Variable names can include alphanumeric characters and underscore, and are case-sensitive.

Q25) How can I manage passwords on Red Hat Enterprise Linux, CentOS, and Fedora Core?
Ans: You need the Shadow Password Library, which is provided by the ruby-shadow package. The ruby-shadow library is available natively for fc6 (and higher) and should build on the corresponding RHEL and CentOS variants.

Puppet Technical Interview Questions
Q26) What if I am using Puppet 2.6x or earlier?
Ans: There will be no change. Puppet 2.6.x remains licensed as GPLv2. The license change is not retroactive.

Q27) Explain the Puppet catalog.
Ans: When configuring a node, the Puppet Agent uses a document called a catalog, which it downloads from a Puppet Master. The catalog describes the desired state for each resource that should be managed and may specify dependency (pivotal training) information for resources that should be managed in a certain order. Puppet compiles a catalog using three main sources of configuration info:

Agent-provided data

External data

Puppet manifests

Q28) What commands are used to sign requested certificates?
Ans: Below are the commands to sign requested certificates:

puppet –sign hostname-of-agent (2.6)
puppet ca sign hostname-of-agent (3.0)
Q29) What does it mean if I or my company wants to contribute to Puppet?
Ans: As a major aspect of this permit change, Puppet Labs has moved toward each current supporter of the undertaking and requested that they consent to a Contributor License Arrangement or CLA. Marking this CLA for yourself or your organization furnishes both you and Puppet Labs with extra lawful insurances and affirms:

That you own and are qualified for the code you are adding to Puppet 

That you are eager to have it utilized in circulations 

This gives confirmation that the causes and responsibility for code can't be questioned in case of any lawful test.

Q30) Explain some facts related to Puppet.
Ans: Puppet uses a system called Facter to collect system information. This information is related to as “Facts”, and they can automatically be used as variables within your Puppet manifest files. Factor provides data in your manifest files like Kernel version, CPU info, IP Address of the machine, dist release number, and more.

Q31) What is PSON?
Ans: If you perceive JSON, you would perceive PSON for its similarities. Puppet utilizes PSON so as to serialize information that would then be able to be sent over a system or put away on the nearby document framework. JSON necessitates that the type of the serialized information is UTF-8, Unicode encoded, PSON is a progressively nonexclusive 8-piece ASCII. As a result of its one of a kind encoding, PSON can speak to any succession of bytes as a string. While indicating the PSON MIME type, the best possible sort is "text/pson".

Q32) What is a Puppet server?
Ans: Puppet Server offers indistinguishable processes and highlights from the exemplary Puppet master program; in any case, Puppet Server runs on the JVM (Java Virtual Machine), doing as such by running the Puppet master codebase inside JRuby interpreters. A few pieces of the exemplary Puppet ace program are reimplemented in Closure in Puppet server.

Q33) Explain the potential that could be created by automating a process through Puppet.
Ans: In robotizing the setup and sending of different machines in your organization using Puppet, you could abbreviate the procedure from being weeks long to under 30 minutes. In the wake of building up an automation infrastructure configuration and deployment, the procedure you made can be broken into modules and depicted completely in a README, which is then looked into form control like git or svn. This permits future Dev Ops groups to refresh the Puppet modules, change the framework arrangements, and access history or even move back to previous versions of the configured infrastructure.

Q34) Explain Puppet Resource.
Ans: Puppet assets are the littlest unit of a framework setup. An asset gives a depiction to some part of the framework, for instance, a bundle that must be introduced for help with which the machine must convey. Puppet Catalogs contain arrangements of assets, which together in a Catalog depict the objective condition of the framework and deal with the entirety of the assets introduced on the framework.

Q35) Explain Resource type.
Ans: A Resource type portrays the sort of configurations managed by a given asset. Puppet comes out of the box with a few resource types, for instance, CRON jobs, service connections, files, and more. Resource types can likewise be extended.

Q36) Explain Puppet parser and what’s it uses?
Ans: Puppet parser glances through your manifest files to ensure the code inside them contains the right syntax. Puppet parser is particularly valuable as a component of a persistent mix pipeline, since it very well may be utilized as an automated check that forestalls invalid Puppet code from making it into your production environment and damaging infrastructure configurations.

Q37) What is divided infrastructure in Puppet?
Ans: If parts of your infrastructure are managed by different teams that don’t need to coordinate their code, you can split them into environments.

Q38) Explain module layout in Puppet.
Ans: On disk, a module is a directory tree with a specific, predictable structure:

<MODULE NAME> manifests

Files

Templates

Lib

Facts

Examples

Spec

Functions

Types

Q39) Explain modules in Puppet.
Ans: Modules are self-contained bundles of code and data. These reusable, shareable units of Puppet code are a basic building block for Puppet. Nearly all Puppet manifests belong in modules. The sole exception is the main site.pp manifest, which contains site-wide and node-specific code.

Q40) What is Hiera and what is its use in Puppet?
Ans: Hiera is a key/value lookup used for separating data from Puppet code. Hiera is Puppet’s built-in key-value configuration data lookup system. Puppet’s strength is in reusable code. Code that serves many needs must be configurable: put site-specific information in external configuration data files, rather than in the code itself. Puppet uses Hiera to do two things:

Store the configuration data in key-value pairsLook up what data a particular module needs for a given node during catalog compilation. This is done via:

Automatic Parameter Lookup for classes included in the catalog

Explicit lookup call

1) Why is the puppet important?
Ans: Puppet develops and increases the social, emotional and communication skills of the children.

2) What are the works and uses of puppets?
Ans: Puppet defines the software and configuration your system requires and has the ability to maintain an initial setup. Puppet is a powerful configuration management tool to help system administrators and DevOps to work smart, fast, automate the configuration, provisioning, and management of a server.

3) Why is a puppet used by an organization?
Ans: Puppet is used to fulfill cloud infrastructure needs, data centers and to maintain the growth of phenomenal. It is very flexible to configure with the right machine. Puppet helps an organization to imagine all machine properties and infrastructure.

4) What are the functions of Puppet?
Ans:

Ruby is the base development language of puppet and supports two types of functions are Statements and Rvalue.

There are three types of Inbuilt functions

File function
Include function
Defined function
5) What are Reductive labs?
Ans:

Puppet labs are to target the reAns: framing of the automation problem of the server.

6) How is puppet useful for developers?
Ans: Puppet is a reliable, fast, easy, and automated infrastructure to add more servers and the new version of the software in a single click. You can fully focus on productive work because it is free from repetitive tasks.

7) What is the language of the puppet?
Ans: Puppet has its language known as eponymous puppet available in open and commercial versions. It uses a declarative, modelAns: based approach for IT automation to define infrastructure as code and configuration with programs.

8) Does puppet have its programming language, why?
Ans: Yes, because it is very easy and clear to understand quick by developers

9) What puppet will teach you?
Ans: Puppet will teach you how to write the code to configure an automated server, to use preAns: build and create modules, how to use resources, facts, nodes, classes and manifests, etc.

10) What are the effects of puppet on children?
Ans: There are many surprising and amazing effects of puppets such as it encourages and improves the imagination, creativity, motorcycle and emotional health of the children to express inner feelings. The main thing is that you can communicate and give a valuable message to your children funnily and unusually and also to get rid of your child from the shyness of reading, pronouncing and speaking loud in front of everybody.

11) How to install a puppet master?
Ans: First update your system and install the puppet labsAns: release repository into Ubuntu. Always install the latest and updated version of the puppet “puppetmasterAns: passenger” package.

12) What is configuration management?
Ans: Configurations management handles the changes systematically to confirm the system design and built state. It also maintains the system integrity and accurate historical records of system state for audit purposes and management of the project.

13) How do puppet slaves and masters communicate?
Ans: First slave sends the request for the master certificate to sign in and then the master approves the request and sends it to the slave and slave certificate too. Now the slave will approve the request. After completing all the formalities, the date is exchanged very securely between two parties.

14) How does the DevOps puppet tool work?
Ans: Facts details of the operating system, the IP address of the virtual machine or not, it is sent to the puppet master by the puppet slave. Then the fact details are checked by the puppet master to decide how the slave machine will configure and wellAns: defined document to describe the state of every resource. The message is shown on the dashboard after completing the configuration.

15) Describe puppet manifests and puppet module?
Ans:

Puppet manifests – Are puppet code and use the. pp extension of filenames. For example, write a manifest in the puppet master to create a file and install apache to puppet slaves that are connected to the puppet master.
Puppet module – It is a unique collection of data and manifests like files, facts, templates with a special directory structure.
16) What are the main sources of the puppet catalog for configuration?
Ans:

Agent provided data, Puppet manifests, external data.

17) Is 2.7.6 puppet run on the window and server?
Ans:

Yes, it will run to ensure future compatibility. Puppets can work on servers in an organization because there are a lot of similarities in the operating system.

18) How can we manage the workstation with a puppet?
Ans:

BY using “puppet tool” for managing workstations, desktops, laptops.

19) What is Node?
Ans:

It is a block of puppet code included in matching nodes catalogs which allow assigning configurations to specific nodes.

20) What are facts, name the facts puppet can access?
Ans:

System information is facts which are preAns: set variables to use anywhere in manifest. Factor builtAns: in core facts, custom and external facts.

21) What is Puppet?
Ans: Puppet is a tool utilized for configuration management on both UNIX based and Microsoft windows working frameworks. Its principal objective is to make the administration of countless machines less complex, progressively solid, and with more automation. Puppet utilizes its own definitive language to depict the arrangement of a framework or system of frameworks. It is likewise generally used to automate system administration tasks.


22) What is store configs?
Ans: Storeconfigs is a puppetmaster option that stores the hub’s genuine design to a database. It does this by contrasting the aftereffect of the last aggregation against what is in the database, asset per asset, then parameter per parameter, etc.


23) How can you use store configs?
Ans: The quick utilization of store configs is exported assets. Exported assets are assets that are prefixed by @@. Those assets are checked extraordinarily so they can be gathered on a few different hubs. Some example use cases are:

Share/disseminate open keys (ssh or OpenSSL or different sorts)
Build rundown of hosts running a few administrations (for checking)
Build arrangement documents that require numerous hosts (for example/and so on/resolve.conf can be the link of records sent out by your DNS cache hosts
24) What do you mean by facter and explain some use cases for the same?
Ans: At some point, you have to compose shows on contingent articulation dependent on conditional expression based data which is accessible through Facter. Facter gives data like Kernel adaptation, Distribution discharge, IP Address, CPU information, and so forth. You can characterize your own custom realities. Facter can be utilized autonomously from Puppet to accumulate data about a framework. Regardless of whether it’s parsing the/proc/xen index on Linux or running prtdiag order on Solaris, the tool works superbly abstracting the particular working framework orders used to decide the collection of facts. At the point when utilized related to Puppet, realities assembled through the framework permits the manikin ace to settle on savvy choices during show gathering.

Inside your manikin show, you can reference any key worth sets given by facter by prefixing the hash key with “$”. If the default set of realities are not adequate, there are two different ways to stretch out Facter to give extra truth. One route is to utilize Ruby, the other path is by utilizing condition factors prefixed with FACTER_. S. This permits one to set for every node data and use it in our shows.


25) What are Manifests?
Ans: In Puppet, the files in which client configuration is specified are known as Manifests.


26) What is MCollective?
Ans: MCollective is a powerful orchestration framework. Run actions on thousands of servers simultaneously, using existing plugins or writing your own.


27) What are classes?
Ans: Classes are named squares of Puppet code that are put away in modules for some time in the future and are not applied until they are invoked by name. They can be added to a node’s list by either announcing them in your shows or allocating them from an ENC. Classes for the most part arrange huge or medium-sized lumps of usefulness, for example, the entirety of the bundles, config records, and administrations expected to run an application.


28) How can you test manifest files?
Ans: Clarify how you will initially run linguistic structure checks with manikin parser approval order. In the event that you are utilizing VIM, you can utilize modules like Syntastic to confirm code (or else) utilize a full-fledged IDE like Geppetto. Additionally use puppet build-up to confirm notwithstanding puppet parser. You can add RSpec/cucumber tests to your application. (Be Careful: RUBY aptitudes are required) and use Cucumber in independent mode to test your manifests.


29) Why should you use MCollective over plain vanilla Puppet?
Ans: The Marionette Collective, otherwise called MCollective, is a structure for building server coordination or equal occupation execution frameworks. Most clients automatically execute authoritative assignments on groups of servers. MCollective has some special qualities for working with huge quantities of servers:

Rather than depending on a static rundown of hosts to order, it utilizes metadata-based revelation and sifting. It can utilize a rich information source like PuppetDB or can perform constant disclosure over the system.

Rather than legitimately associating with each host (which can be asset serious and moderate), it utilizes distribute/buy-in middleware to impart in corresponding with numerous hosts on the double.
30) What data source types are supported in HIERA?
Ans: JSON and YAML

Inclined to build a profession as Puppet Developer? Then here is the blog post on, explore Puppet Training
31) What is the LDAP node classifier?
Ans: LDAP can be used to store information about nodes and servers. The LDAP Node Classifier is used to query LDAP for node information instead of an ENC.


32) Explain the use of etckeeper-commit-post and etckeeper-commit-pre-on Puppet Agent.
Ans: etckeeper-commit-post: In this configuration file, you can define command and scripts which executes after pushing configuration on Agent Etckeeper-commit-pre: In this configuration file you can define command and scripts which executes before pushing configuration on Agent


33) Explain Puppet Kick.
Ans: By default, Puppet Agent requests a Puppet Master after a periodic time which is known as “run interval”. Puppet Kick is a utility that allows you to trigger the Puppet Agent from Puppet Master.


34) Differentiate between class definition and class declaration.
Ans: Defining a class makes it accessible for later use. It doesn’t yet add any assets to the index; to do that, you should declare it or assign it from an ENC.


35) Explain ordering and relationship.
Ans: As a matter of course, Puppet applies assets in the request they’re proclaimed in their show. Be that as it may, if a gathering of assets should consistently be overseen in a particular request, you should unequivocally declare such relationships with relationship meta parameters, chaining arrows, and the required function. Puppet utilizes four meta parameters to set up connections, and you can set every one of them as a trait in any asset. The estimation of any relationship meta parameter should be an asset reference (or array of references) highlighting at least one objective asset.

before - Applies an asset before the objective asset

requires - Applies an asset after the objective asset

notifies - Applies an asset before the objective asset. The objective asset revives if the advising asset changes.

subscribe - Applies an asset after the objective asset. The subscribing resource refreshes if the objective asset changes. 
If the two assets need to occur altogether, you can either place a preceding characteristic in the earlier one or a required property in the resulting one; either approach makes a similar relationship. The equivalent is valid for notify and subscribe.


36) Explain the design patterns you have used in your Puppet code.
Ans: Here is a tip to answer this question: Be exceptionally clear on this as this tests your development knowledge rather than sysadmin aptitudes. In any event, you will be tested profoundly on job/profile designs – this is the best and most complex way to deal with looking after code. Notice Anchor patterns and clarify why you are utilizing it. You should just utilize this example before Puppet 3.4 or PE 3.2.

37) Explain r10k.
Ans: R10k gives a universally useful toolset to conveying Puppet conditions and modules. It executes the Puppetfile design and gives a local usage of Puppet dynamic situations. R10k has two essential jobs: introducing Puppet modules utilizing an independent Puppetfile, and overseeing Git and SVN based unique conditions


38) What common workflow is used for r10k?
Ans: A great part of the basic work process relies upon the standard git-flow to create highlight branches and rolling out all improvements in include branches, conveying the earth in test mode, and on the confirmation, converging to a branch before tidying up the highlighted branch. On the off chance that you are not utilizing the standard git-flow, receive likewise.


39) Can Puppet run on unique servers?
Ans: Puppet can run on servers that are interesting. Despite the fact that there may be exceptionally fewer odds of servers being special since inside an association there are a ton of likenesses that exist like the working framework that they are running on, etc.


40) Explain the architecture of Puppet.
Ans: Puppet is Open Source programming. It depends on the Client-server design. It is a Model-Driven framework. The customer is likewise called Agent. What’s more, the server is known as the Master. It has the accompanying building parts:

Configuration Language: Puppet gives a language that is utilized to design Resources. We need to indicate what Action must be applied to which Resource. The Action has three things for every Resource: type, title, and rundown of characteristics of an asset. Puppet code is written in Manifests documents.

Resource Abstraction: We can make Resource Abstraction in Puppet with the goal that we can design assets on various stages. The puppet operator utilizes a Factor for passing the data of a domain to the Puppet server. In Fact, we have data about IP, hostname, OS, and so on of the earth.

Transaction: In Puppet, Agent sends Factor to the Master server. Ace sends back the inventory to the Client. The specialist applies any arrangement changes to the framework. When all progressions are applied, the outcome is sent to the Server.

41) Define devops puppet?
Answer : Puppet can define infrastructure as code, manage multiple servers, and enforce system configuration. … Puppet is used by 42 percent of businesses that use DevOps methodologies, followed closely by Chef with 37 percent. Puppet is an open source software configuration management and deployment tool.

42) What is puppet and how does it work?
Answer: It works like this..Puppet agent is a daemon that runs on all the client servers(the servers where you require some configuration, or the servers which are going to be managed using puppet.) All the clients which are to be managed will have puppet agent installed on them, and are called nodes in puppet.

43) What is puppet?
Answer: puppet.com. In computing, Puppet is an open-core software configuration management tool. It runs on many Unix-like systems as well as on Microsoft Windows, and includes its own declarative language to describe system configuration. Puppet is produced by Puppet, founded by Luke Kanies in 2005.

44) What is puppet and Jenkins?
Answer: Jenkins is by far the most widely used tool for managing continuous integration builds and delivery pipelines. Puppet Enterprise provides many tools to automate the testing, promotion, and delivery of infrastructure changes with Jenkins, plus tools to deploy and manage Jenkins itself.

45) What is a DevOps role?
Answer: DevOps Engineer works with developers and the IT staff to oversee the code releases. They are either developers who get interested in deployment and network operations or sysadmins who have a passion for scripting and coding and move into the development side where they can improve the planning of test and deployment.

46) Which is better chef or puppet?
Answer: To use an analogy, using Puppet is like writing configuration files whereas using Chef is like programming the control of your nodes. If you or your team have more experience with system administration, you may prefer Puppet. On the other hand, if most of you are developers, Chef might be a better fit.

47) Is Ansible better than puppet?
Answer: In very, very, short, there are some differences between Ansible and Puppet. … However, Puppet is more of a configuration management tool, whereas Ansible is more of a provisioning, configuration and deployment tool.

48) Why puppet is used in DevOps?
Answer: As with other DevOps programs, Puppet automates changes, eliminating manual script-driven changes. … Instead, Puppet uses a declarative, model-based approach to IT automation. This enables Puppet to define infrastructure as code and enforce system configuration with programs.

49) What is Chef and Puppet?
Answer: Puppet is a powerful enterprise-grade configuration management tool. Both Chef and Puppet help development and operations teams manage applications and infrastructure. However they have important differences you should understand when evaluating which one is right for you.

50) What is puppet written in?
   Ruby
   C++
   Clojure

