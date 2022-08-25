Sample Site Reliability Engineer Job Description
Do you enjoy working with a highly motivated and talented team to deliver mission critical software? [company name] is growing our Site Reliability Engineering team to help deploy, manage, troubleshoot, and enhance our complex cloud-based services for a wide variety of customers.

As a Site Reliability Engineer you will design and implement web applications and REST API services using a microservice-based infrastructure to replace our current monolith implementation. The new technology stack includes [Amazon Web Services (AWS)/Google Cloud/etc.], [Docker/Kubernetes/other], [relational database], [NoSQL/NewSQL database], and [monitoring tool]. Your focus will be on maximizing system uptime. Team members all participate in an on-call rotation.

You will build innovative automated solutions and tools to help debug and resolve problems in production and prevent them from recurring. Further, you will proactively seek out system weaknesses and find ways to fix them before they cause production issues using monitoring data, watching trends, and using Chaos Engineering.

Responsibilities
Keeping your assigned site or service up and running or getting it back up and running quickly when failure occurs
Working closely with internal partners and teams to ensure that we ship software that meets security, SLA, and performance requirements
Writing, updating, and using documentation, including runbooks/playbooks
Automating work including infrastructure needs, testing, failover solutions, failure mitigation, and much more
Debugging complex problems across an entire stack and creating solid solutions
Developing CI/CD processes to improve cadence
Using Chaos Engineering to test what you build under real-world conditions
Key Skills and Attributes
Required
7 years experience with software engineering, software development, or system operations
Excellent communication skills, both verbal and written
Knows their way around a Unix/Linux shell, can write shell scripts, and understands Linux internals
Experience debugging complex problems
Experience designing, building, and operating large-scale production systems
Knows Python, Java, Go, Rust, or similar
Understands networking and messaging, especially between services
Has hands-on experience using source control (Git, GitHub) and feature branching strategies
Has experience with a variety of open-source databases (MySQL, Postgres, Redis, Cassandra, etc.)
Preferred
Experience with DevOps engineering or SRE
Experience with containers, such as with Docker or Kubernetes
Experience with monitoring and observability such as with Datadog, Sensu, New Relic, and Nagios
Experience automating infrastructure, testing, and deployments using tools like Ansible, Chef, or Terraform and can explain the Infrastructure as Code paradigm
Experience with configuration management, such as with Puppet
Understands the idea behind Chaos Engineering, even if they haven't yet implemented it themself
It's not expected that any single candidate would have expertise across all of these areas - we're looking for candidates that are particularly strong in a few areas, and have some interest and capabilities in others.

At [company name] our mission is to [insert company mission]. Our products help software companies [do something awesome] - thereby empowering businesses and individuals to [save time and money]. Our customers include [name], [name], [name], and [name]. [company] is a unique place to work and offers competitive compensation packages that include medical, dental, and vision benefits with flexible PTO and a 401k with company-matched contributions [up to X%].

[company] has a [industry] startup culture that emphasizes transparency, collaboration and career growth, with the ability to work on small, nimble teams. Employees are able to create change at scale and have an opportunity to truly disrupt and shape [industry].

[company] is an equal opportunity employer. Qualified applicants will receive consideration for employment without regard to race, color, religion, sex, sexual orientation, gender perception or identity, national origin, age, marital status, protected veteran status, or disability status.

Learn more at [company URL].

Sample Site Reliability Engineer Interview Questions
Our sample questions do not form a complete set and we do not recommend that anyone use them without first looking at the hiring company and team needs. Modify the questions to help find someone who is a great fit for the role the team needs filled. Many would work well as DevOps interview questions as well. The big thing is to see how the questions may fit well into your interview process. Most of our sample questions are focused on the technical interview.

The goal of these questions is to help gauge a candidate's knowledge, experience, and ability to interact with the interviewer while answering with technical competence and clarity. We wouldn't expect any but the top candidates for senior-level positions to answer all of these, but how a candidate handles not knowing the answer with transparency and discusses how they would approach solutions is one of the most valuable indicators to look for in a job interview.

What is an SLO?
A service-level objective (SLO) defines the target availability (uptime) we want for a system or service. We define reliability as meeting our SLOs.

Follow up: What is an SLA? An SLI?
A service-level agreement (SLA) is the uptime promise that we make to a customer. These are often legally-defined with penalties for missing the target availability. For this reason, SLAs are generally set using figures that are easier to meet than SLOs.

A service-level indicator (SLI) is something you can measure with precision to help you think about, define, and determine whether you are meeting SLOs and SLAs. They are generally reported as the ratio between the number of good events divided by the total number of events. A simple example would be the number of successful HTTP requests / total HTTP requests. SLIs are frequently reported as a percentage with 0% meaning everything is broken and 100% meaning everything is working perfectly.

What is a linked list?
It's a data structure where each data element is a separate element in a list. Elements are connected (linked) using pointers. The list starts with a head, which is a reference to the first node in the list. The head is followed by nodes, which include a data element and a reference to the next data element. The final node, the tail, includes the data element and a reference to null, indicating the end of the list.

Name some other data structures.
Queue, stack, heap, hash table, binary tree, etc.

Depending on your needs, this could be followed up with a question about data algorithms.

What is DNS?
This is a BIG question and it will be interesting how the candidate answers. Ultimately, you aren't looking necessarily for comprehensive knowledge, but rather whether they can name the main points of interest and do so with clear definitions.

The domain name system (DNS) is a decentralized naming system for resources connected to the internet or a private network. These resources are assigned internet protocol (IP) addresses, which are defined strings of unique identifying numbers that follow a precise format. However, humans cannot feasibly remember IP addresses, so DNS allows the assigning of a human-readable name, such as google.com, to use in place of the IP address.

They may also talk about IPv4 versus IPv6, DNS records and the fields involved and how to create one, nameservers and decentralization and the existence of a set of canonical root nameservers, queries, caching, primary versus secondary DNS settings, reverse DNS lookups, DNS zones, and security concerns. All of these are important, but you are really looking at whether the candidate understands the big picture and how they communicate it to you.

Name three types of databases and an example of each. Name some you have used.
They must name relational databases as one of the types, like MySQL, Postgres, Oracle and so on.

After that, we are looking for what sorts of other databases they may know of or have familiarity working with. The candidate should be able to describe the difference between each type they name. Here are some examples:

Key/value stores: BerkeleyDB, Cassandra, etcd, Memcached and MemcacheDB, Redis, Riak

Document stores: CouchDB, MongoDB

Wide column stores: BigTable, HBase

Graph stores: FlockDB, Neo4j, OrientDB

What is an inode?
An inode is a data structure in Unix/Linux that contains metadata about a file. Some of the items contained in an inode are:

mode
owner (UID, GID)
size
atime, ctime, mtime
acl's
a blocks list of where the data is
The filename is present in the parent directory's inode structure.

What's the difference between RAID 0 and RAID 5 and when would you choose one over the other?
RAID 0 uses striping, which splits the data across two or more disks. RAID 5 is striping with parity, which provides some error detection. RAID 0 strictly emphasizes performance while RAID 5 introduces fault tolerance at the expense of somewhat lower performance.

If a filesystem is full, and you see a large file that is taking up a lot of space, how do you make space on the filesystem?

There are several options. We want at least one or something just as good. Perhaps follow up with a question about when/why their answer might be suitable and when a different option would be better.

If no process has the filehandle open, you can delete the file.
If a process has the filehandle open, it is better if you do not delete the file, instead you can cp /dev/null on the file, which will reduce it's size to 0.
A filesystem has a reserve, you can reduce the size of this reserve to create more space using tunefs.
What are the most commonly used signals with the Linux kill command? What does each do? What is the default? When is each appropriate?
kill -15 sends a TERM signal, which attempts to gracefully stop a process. It is the default.
kill -1 sends a HUP signal, which reloads a process.
kill -9 sends a KILL signal, which kills a process.
You can follow this up nicely with a discussion of important system calls.

Give a definition of virtualization, containers, and Kubernetes and tell how the three relate to and differ from each other.
Bonus points if they start by talking about a bare metal server.

Virtualization installs a control layer on top of a set of bare metal servers to create a pool of resources from the combination of the physical resources of those servers. It then allows you to create "virtual machines" that have a varied combination of memory, storage, and processor resources according to need, each machine with its own operating system. Virtual machines can be created and destroyed quickly and easily.

Containers are similar, except they do not contain the base layer operating system. Instead the control layer provides the operating system access while also keeping the containers and their processes isolated from one another. Containers include software such as a microservice along with all of the software dependencies required to run that software. This provides isolation and flexibility.

Kubernetes adds an orchestration layer to containers, making the management of them, especially large systems, easier.

What is cloud computing?
Common answers are "using someone else's computer" or running services on equipment in someone else's data center. Follow up with a question about why companies use any of the various cloud platforms (save money, offload maintenance, etc.).

Please describe a problem you had to troubleshoot, how you went about finding it, and how you fixed it.
You are looking for their thinking process, their organization, and how methodical they are in finding problem sources. You are also looking for how creative they can be in solving them.

What are some common architecture bottlenecks and some possible ways to mitigate against problems?
Every architecture is different, so you are looking for them to mention networking problems, resource allocation, unusual service interactions, and so on.

What steps would you take to secure a container image?
Do the candidate's steps match with your company's? Close? Is the candidate open to suggestions or do they act like they have the definitive answer (like a know-it-all)?

How do you prefer to interact with team members? Describe your ideal team. Describe the best team you have worked with. Describe a time when you had a problem with a coworker and what you did to make the relationship work.
You want to learn about how the candidate thinks about interacting with coworkers to gauge how those thoughts fit with your company's current culture as well as the culture you want in the future.