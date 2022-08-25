The site reliability engineer role can be both challenging and rewarding for IT pros. To stand out in a competitive job market, aspiring SREs must understand exactly what organizations look for in a candidate.

SRE is a specialized IT role that involves the automation of operations tasks. The role can be a good fit for systems engineers looking to improve programming skills, as well as developers seeking to manage large-scale infrastructures. Candidates with demonstrated strength in IT systems, software development, automation and a broad cross-section of related tools have a competitive advantage during the interview.

Any SRE interview will present a candidate with an array of questions or hands-on exercises intended to evaluate their knowledge of key site reliability skill sets. While these questions or tests can vary depending on the specific needs of the hiring organization, an SRE candidate can expect to see a smattering of interview questions across five major domains: software development, monitoring and troubleshooting, networking, infrastructure and operations, and business-side issues.

Software development
The first interview questions in this domain usually explore a candidate's basic knowledge of programming languages -- such as Perl or Java -- the organization uses, along with data structures such as queues, stacks, heaps and algorithms. This portion of the interview might entail a candidate's review of poorly written code to identify errors, inefficiencies and places where the code might fail or produce undesirable results -- key concerns for software reliability. Other software development questions might involve major applications and interfacing, such as databases, with an emphasis on interoperability and configuration issues that can affect application performance and stability.

A hiring organization will rarely ask a candidate to actually code, but the evaluation might include architectural discussions of using code to address certain problems.

There is some overlap between DevOps and SRE roles. Software development is a central issue for SREs, and DevOps focuses on general software development, testing and deployment. SREs focus on the reliability issues of code development and deployment across the organization. Thus, an SRE is not a dedicated developer, but a specialized player within DevOps groups. SREs can review code and spot potential coding problems or consult with the DevOps staff about coding and configuration best practices that bolster software reliability. The actual amount of coding that an SRE performs can vary between employers, DevOps staff size and software importance.

Common development-related questions include the following:

Tell me about your background with [a certain programming language].
What are your thoughts about [this snippet of code]?
How do you interact with a DevOps team?
What are your most important criteria in developing an algorithm?
How do you create tests for software performance and reliability?
Monitoring and troubleshooting
SRE interview questions in this category typically examine the candidate's understanding of monitoring principles and their practical knowledge of specific tools or practices. For example, the interviewer might ask how to monitor database query times -- a central element of performance monitoring -- or how to parse a log file to create a CSV of specific events or processes.

Unsurprisingly, SRE interview questions often involve workflow and process automation.
In other cases, an interviewer might present a candidate with a list of monitoring alerts from a tool and ask them to rate the alerts in terms of priority or severity. Such questions gauge the candidate's ability to prioritize and manage time appropriately.

Troubleshooting discussions can also include various anecdotal scenarios. These explore how a candidate might resolve certain problems -- ranging from a failed VM to a full-blown site disaster. An interviewer might also ask about the most serious problems the candidate has encountered in vital areas such as servers, networks or services, and how they resolved those issues.

An interview will likely involve observability and its implementation. Observability is the natural extension of monitoring and management that builds upon traditional logs, metrics and traces to produce comprehensive hardware and software telemetry. IT admins use this detailed telemetry to create a continuous and dynamic assessment of the IT environment. When implemented properly, observability helps SREs detect and resolve complex issues faster and more reliably than traditional troubleshooting methodologies.

Common monitoring- and troubleshooting-related questions include the following:

What metrics do you use for system or application performance monitoring?
Tell me about your backup practices.
Do you use any tools for log analytics?
What is the single most serious -- hardware or software -- problem that you've resolved?
How would you implement or improve observability in an enterprise environment?
Networking
SREs are not network engineers, but networks are critical to computing and service delivery. SRE candidates should have solid networking skills and the answers to an array of practical network questions.

These questions range from extremely easy to extremely difficult. For an easy question, the interviewer might ask a candidate to define or describe basic networking concepts such as DNS, Dynamic Host Configuration Protocol or TCP/IP. But networking questions can quickly become more granular and detailed. For example, an interviewer might ask how to calculate the number of usable IP addresses on a /23 network or about the nuances of a TCP connection setup.

SRE interview questions related to networking can also prompt architectural discussions, such as how to identify single points of failure in a basic network map or how to locate potential network bottlenecks as it relates to workload accessibility and reliability.

Common networking-related questions include the following:

Can you spot the bottleneck in this network map?
How would you resolve network bottlenecks or troubleshoot network performance issues?
How do you monitor network operation?
Have you been involved with software-defined networking?
Infrastructure and operations
An SRE candidate will usually face an array of infrastructure and operations questions -- and some of the basic ones will typically involve OSes and security. For example, an interviewer might ask what happens when the ps command is entered into a UNIX prompt. Candidates might need to explain how to secure a container image, or the difference between RAID 0 versus RAID 5 -- and when to use one over another. Other basic questions involve the difference between a service-level agreement (SLA) and service-level indicator, or the differences between virtualization, containers and Kubernetes.

Infrastructure questions can become increasingly complex. Candidates might be asked to explain how they would scale certain elements of IT infrastructure, such as a vital service. A candidate's approach to this task can reveal a lot about their expertise and confidence as an SRE. Another complex example might involve distributing 1 TB of data to 5,000 different nodes, and then keeping those nodes up to date. If it takes two hours to copy the data to just one server, the interviewer might ask how the candidate would approach that task so that it doesn't take 10,000 hours to update all the servers and so that the data transfer wouldn't be corrupted.

Common infrastructure questions include the following:

What is your approach to system or data backups? How do you test recovery processes?
What metrics do you use to monitor infrastructure performance?
What scripting languages do you use? How do you use scripts for automation?
How do you handle routine system maintenance tasks while minimizing service disruptions?
Unsurprisingly, SRE interview questions often involve workflow and process automation. These questions might be as simple as "How do you create and review an automation script?" But they can also require the candidate to demonstrate knowledge of prominent IT automation tools, such as Ansible, Datadog, Puppet and Vagrant. Fortunately, such detailed knowledge requirements are typically outlined in SRE job postings, but even when specific tools are not involved, candidates should be ready to discuss basic automation approaches and practices.

SREs generally use a wide range of tools that support five key infrastructure areas:

Application performance monitoring. Tools might include Datadog, New Relic or NetApp Cloud Insights.
Communication and collaboration. Tools might include Slack, Zoom and Microsoft Teams.
Help desk or incident log and response. Systems might include PagerDuty, VictorOps or Opsgenie.
Configuration management. Tools such as Ansible, Chef, SaltStack or Terraform.
Specialized SRE. Tools such as NetApp Cloud Volumes OnTap.
The scope and number of tools will depend on the size and complexity of the organization.

Common tool-related questions include the following:

What tools do you use to monitor and enhance site reliability?
How do you collaborate between teams and assign tasks from help desk systems?
Tell me about your experience with [a specific tool].
How do you keep tools updated and interoperable across the SRE tool set?
Business-side issues
SREs focus mainly on technology operations, but the high level and broad scope of SRE activities can overlap with business initiatives and decision-making. Successful SREs need a solid understanding of important business-side issues.

SRE candidates might be asked to discuss the importance of error budgets. An error budget is the maximum amount of time a system can be unavailable without violating an SLA or other performance obligation. For example, a system that promises 99.99% uptime can be unavailable for up to 52 minutes and 35 seconds per year -- that margin of possible downtime is the error budget.

While some organizations see uptime and downtime as a performance metric, perceiving potential downtime as an error budget enables technology teams to take risks. They can try new innovations by identifying tangible limits for risks and "spending" some of the error budget.

Another point that often arises in an interview is task prioritization. IT organizations are constantly juggling the need for new features and capabilities with the need for technical debt reduction -- fixing issues that are ignored or delayed in hardware or software deployments. Because both needs can affect site reliability, performance and availability, SREs are naturally involved with project decision-making alongside business leaders and project managers.

Finally, SREs are often involved with multiple IT teams, multiple project managers and varied development groups. Effective project execution depends on effective communication and collaboration among these different teams. SREs facilitate collaboration and help resolve potential conflicts between teams or silos. SRE interviews might touch on personnel management, conflict resolution and other HR issues.

Common business-side questions include the following:

How do you communicate with people? What's your communication style?
What's the error budget for 99.95% uptime and how would you use that error budget?
How do you decide whether to assign a team new feature work or technical debt reduction?
How can you remove silos or foster positive collaboration between different IT teams?
