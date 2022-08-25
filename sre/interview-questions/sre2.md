Site Reliability Engineering is basically creating a bridge between Development and Operations departments. It is a discipline that incorporates aspects of software engineering and applies them to infrastructure and operations problems. The main goals are to create scalable and highly reliable software systems. Read more information about SRE on our article An Insight To Site Reliability Engineering

The job role of a Site Reliability Engineer includes the following responsibilities:

Site reliability engineers communicate with other engineers, product owners, and customers and come up with targets and measures. This helps them to ensure system availability. One can easily understand the perfect time to take action once all have agreed upon a system’s uptime and availability. 
They introduce error budgets in order to measure risk, balance availability and feature development. When there are no unrealistic reliability targets, a team has the flexibility to deliver updates and improvements to a system.
SRE believes in reducing toil. That results in automating tasks that require a human operator to work manually.
A site reliability engineer should have an in-depth understanding of the systems and their connectivity.
Site reliability engineers have the task of discovering the problems early to reduce the cost of failure.
sre-foundation

Pretty interesting. Isn’t it? Well, the job interview of a Site Reliability Engineer, too, is pretty interesting!

Check out these most commonly asked Site Reliability Engineering interview questions to get an idea about how interesting it actually can be!

1. Tell me the difference between DevOps & SRE
A. Reducing Organizational Silos:

SRE treats Ops more like a software engineering problem.

DevOps focuses on both Dev and Ops departments to bridge these two worlds.

B. Leveraging Tooling and Automation

SRE is focused on embracing consistent technologies and information access across the IT teams. 
DevOps focuses on automation and the adoption of technology.
C. Measuring Everything

DevOps is primarily focused on the process performance and results achieved with the feedback loop to realize continuous improvement.
SRE requires measurement of SLOs as the dominant metrics since the framework observes Ops problems as software engineering problems.
2. Why do you think that you will become a Site Reliability Engineer?
I have a practical understanding and working knowledge in DevOps with a deep understanding of:

The inter-relationship of SRE with DevOps and other popular frameworks
The underlying principles behind SRE
Service Level Objectives (SLO’s) and their user focus
Service Level Indicators (SLI’s) and the modern monitoring landscape
Error budgets and the associated error budget policies
Toil and its effect on an organization’s productivity
Some practical steps that can help to eliminate toil
Observability as something to indicate the health of a service
SRE tools, automation techniques, and the importance of security
Anti-fragility, our approach to failure and failure testing
The organizational impact that introducing SRE brings
Hence, I feel Site Reliability Engineer is the perfect job role for me.

3. Have you ever heard of SLO? If yes then explain
An SLO or Service Level Objective is basically a key element of a service-level agreement (SLA) between a service provider and a customer that is agreed upon to measure the performance of service providers and are formed as a way of avoiding disputes. Between two parties.

SLO can be a specific measurable characteristic of SLA like availability, throughput, frequency, response time, or quality. These SLOs togethe define the expected service between the provider and the customer while varying depending on the service's urgency, resources, and budget. SLOs provide a quantitative means to define the level of service a customer can expect from a provider.

4. Explain Data Structure. Name some data structure.
Data structure is a data organization, management, and storage format that enables efficient access and modification. More precisely, a data structure is a collection of data values, the relationships among them, and the functions or operations that can be applied to the data.

The types of data structures are listed below:

Linear: Arrays, lists
Tree: Binary, heaps
Graphs: Decision, Acyclic, etc
Hash: Distributed hash table, hash tree, etc

5. How do you differentiate between process and thread?
When execution of a program allows you to perform the appropriate actions specified in the program, that’s called process.
On the other hand, the thread is the segment of processes.
Process is not lightweight. Threads are lightweight.
The process takes more time to terminate. Threads take more time to terminate.
Process creation takes more time. Thread creation takes less time.
The process takes more time in context switching. Threads take less time in context switching.
The process is more isolated. Threads share memory.
The process does not share data. Threads share data with each other.
6. What is Error Budgets? And for what error budgets is used?
Error budget defines the maximum amount of time a technical system can fail without contractual consequences.

Error budget encourages the teams to minimize real incidents and maximize innovation by taking risks within acceptable limits.

7. Define the Error budget policy?
An error budget policy demonstrates how a business decides to trade off reliability work against other feature work when SLO indicates a service is not reliable enough.

8. What activity means Reducing Toil?
Activities that can reduce toil are:

Creating external automation
Creating internal automation
Enhancing the service to not require maintenance intervention.
9. Define Service Level Indicators
A Service Level Indicator (SLI) is a measure of the service level provided by a service provider to a customer. SLIs form the basis of Service Level Objectives (SLOs), which in turn form the basis of Service Level Agreements (SLAs). An SLI can also be called an SLA metric.

Although every system is different in the services provided, common SLIs are used pretty often. Common SLIs include latency, throughput, availability, and error rate; others include durability (in storage systems), end-to-end latency (for complex data processing systems, especially pipelines), and correctness.

10. Enlist all the Linux signals you are aware of
The common Linux signals are mentioned below:

SIGHUP
SIGINT
SIGQUIT
SIGFPE
SIGKILL
SIGALRM
SIGTERM
11. Have you ever heard of TCP? Please enlist some TCP connection list
The Transmission Control Protocol (TCP) is one of the main protocols of the Internet protocol suite. TCP originated in the initial network implementation in which it complemented the Internet Protocol (IP). Hence, it is broadly referred to as TCP/IP.

12. Few TCP connection states are:
1) LISTEN – Server is listening on a port, such as HTTP

2) SYNC-SENT – Sent a SYN request, waiting for a response

3) SYN-RECEIVED – (Server) Waiting for an ACK, occurs after sending an ACK from the server

4) ESTABLISHED – 3 way TCP handshake has completed

13. Define Inode
An inode is a data structure in Unix that contains metadata about a file. Some of the items contained in an inode are:

1) mode

2) owner (UID, GID)

3) size

4) atime, ctime, mtime

14. What are the Linux kill command? Enlist all the Linux kill commands with its functions
The Linux Kill commands are:

Killall
Pkill
xkill
Killall: Killall command is used to kill all the processes with a particular name.
Pkill: This command is a lot like killall, except it kills processes with partial names.
Xkill: xkill allows users to kill command by clicking on the window
15. What is cloud computing?
Cloud computing is the on-demand availability of computer system resources, especially data storage (cloud storage) and computing power, without direct active management by the user. The term is generally used to describe data centers available to many users over the Internet. Large clouds, predominant today, often have functions distributed over multiple locations from central servers. If the connection to the user is relatively close, it may be designated an edge server.

16. How would you describe the functions of an ideal DevOps team?
The functions of an ideal DevOps team can’t be specifically defined. We all know that the DevOps team bridges the Development and Operations department, and contributes to continuous delivery.

As a starter, the DevOps team should be communicative, well versed in automation, and expert in the tools that are used to build CI/CD pipelines.

Also, they should be efficient enough for small and frequent code releases that address as narrowing the scope of functionality.

17. What is observability, how to improve organizations’ systems observability?
Observability is basically a conversation around the measurement and instrument of an organization.

To improve an organization’s observability, you need to:

Understand what types of data flow from an environment, and which of those data types are relevant and useful to your observability goals
Get a clear vision of what a team cares about and figure out how your strategy is making sense of data by distilling, curating, transforming it into actionable insights into the performance of your systems.
Observability offer potentially useful clues about an organization’s DevOps maturity level.
18. What is DHCP, for what it used? 
The Dynamic Host Configuration Protocol (DHCP) is a network management protocol used on Internet Protocol (IP) networks, whereby a DHCP server dynamically assigns an IP address and other network configuration parameters to each device on the network, so they can communicate with other IP networks.

A DHCP server is used for:

Requesting IP addresses and networking parameters automatically from the Internet service provider (ISP)
Reducing the need for a network administrator or a user to manually assign IP addresses to all network devices.
19. What is the difference between snat and dnat?
Source Network Address Translation (source-nat or SNAT) is a technique that allows traffic from a private network to go out to the internet. 

Destination network address translation (DNAT) is a technique for transparently changing the destination IP address of an end route packet and performing the inverse function for any replies. Any router situated between two endpoints can perform this transformation of the packet.

Difference:

On either side of a NAT device, we have an outside world and inside the world, When the inside world communicates with the outside world SNAT happens. When the outside world communicates with the inside world DNAT happens.
When many internal private IP addresses get translated to one public IP address, it’s called Static SNAT. When many internal private IP addresses get translated to many public IP addresses it’s called Dynamic SNAT
Source NAT changes the source address in the IP header packet. Source NAT changes the destination address in the IP header packet.
SNAT allows multiple hosts on the “inside” to get to any host on the “outside”. DNAT allows multiple hosts on the “outside” to get to any host on the “inside”
sre-foundation

20. Define Hardlink and soft link with examples
A soft link is an actual link to the original file that can cross the file system, allows you to link between directories, and has different inode numbers or file permission to the original file.

A softlink looks like this: $ novel softlink.file

A hard link is a mirror copy of the original file that can't cross the file system boundaries, can't link directories, and has the same inode number and permissions as the original.

Example:   $ novel hardlink.file

21. How will you secure your Docker containers?
To secure your docker container, you need to follow these guidelines:

Choose third party containers carefully
Enable Docker content trust
Set resource limit for your containers
Consider a third-party security tool
Use Docker Bench Security
22. Can you describe the Best SRE Tools for each Stage of DevOps?
The appropriate SRE tools for each stage of DevOps are:

Plan: Jira, Pivotal Tracker, and other task management tool
Create: Source-control tools like GitHub 
Verify: CI/CD tools like Jenkins or  CircleCI
Package: Container orchestration services like Kubernetes or Mesosphere.
Configure: Tools like Terraform and Ansible