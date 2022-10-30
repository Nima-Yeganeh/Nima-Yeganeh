# Prometheus

Prometheus is developed at soundcloud and integrated into the CNCF, it has the ability for creating user specific customs alerts and notifications which is based on the data through metrics.
Prometheus is also used for running ad-hoc queries and minor issues during debugging, its aspect is utilized when integrating with visualization backends.

2.What is the Architecture of Prometheus Monitoring?
- Prometheus can run with both Go and Docker applications. The monitoring application consists of a time-series database, a user interface, and the PromQL query language, which is a flexible and intelligent query language.
- Prometheus gathers metrics via instrumented jobs. The samples can be kept locally. It can also be scanned using rules to record or collect any new time-series via existing data and generate design alerts. Histograms, gauges, and counters are used to display these metrics. Plaintext data can be transmitted over HTTP.

3. How do we manage and monitor Spring boot application in production using Prometheus?
- Spring Boot Actuator is a Spring Boot sub-project that adds monitoring and management capabilities for your production-ready apps. It offers a number of HTTP or JMX endpoints with which you can communicate.
- The Prometheus (a tool for monitoring) endpoint is provided by the Spring Boot Actuator, which regularly pulls this endpoint for metric data and offers graphic representation for data. We can see Api latency, performance etc in Prometheus Graph.
Below is Prometheus graph for testApi endpoint.

4. What are the Features of Prometheus?
The following are some of the most important aspects of Prometheus:
- Numerous dashboards and graphing modes are available.
- Representation of a time series grouping from any HTTP pull model.
- Abilities to use PromQL to support a data model’s multidimensionality feature.
- Individual server nodes are self – reliant and do not rely on distributed storage.
- It display time series data, i.e., identified with the metric’s name or with KVP (Key-value pairs)

5. What are the Components of Prometheus?
The majority of Prometheus components are written in a programming language, namely Go, and can be deployed and built as static binaries. A large number of its components are optional.

Prometheus Server
Prometheus’ server stores and scrapes metrics. It makes use of the persistence layer. This layer is part of the server and is not explicitly defined in the documentation. This server’s nodes are all self-contained and do not rely on distributed storage.

Prometheus UI
We can see charts/graphs, visualise, and access stored data using the web UI. Prometheus simplifies its user interface. We can also configure other visualisation tools, such as Grafana, to connect to the Prometheus server via the Prometheus Query Language (PromQL).

Prometheus Alertmanager
Alertmanager sends alerts via client applications like the Prometheus server. It has advanced features for routing, grouping, and deduplicating alerts, and it can
route alerts from other services like OpsGenie and PagerDuty.

6. What database is used by Prometheus?
Disk Time Series Database
Prometheus comes with a local on-disk time series database and also can integrate with remote storage systems.

7. What is PromQL?
Prometheus helps make its query language, Prometheus Query Language, easier to use (PromQL). It allows users to aggregate and select data. PromQL is specifically designed for use in conjunction with the Time-Series database. Prometheus includes four different types of metrics, that are mentioned below:
Prometheus Gauge
Prometheus Counter
Prometheus Summary
Prometheus Histogram

8. What is Gauges in Prometheus?
A gauge is any metric that shows an individual value that can vary randomly up and down. Gauges are used to measure the values that are typically or recently used in memory.

9. What are Counters in Prometheus?
A counter is any cumulative metric that shows an individual increasing counter monotonically and whose value could only reset or increase to zero over a restart. For example, we can use a counter to represent the number of errors, completed tasks, and requests served.

10. What do you mean by Summaries and Histograms in Prometheus?
Prometheus supports two kinds of complex metrics: Summaries and Histograms.
These metrics are being used to keep track of the number of observations and the sum of observed values. It generates time series in the database. For example, they all add the suffix _sum to the observed value’s sum.

Histogram
A histogram is used to represent the counts and observations (typically response size and request durations) in the configuration buckets. It also makes the sum of each observed value easier.
It makes a histogram an important choice for tracking things like latency, which may have SLO (Service Level Objective) defined across it.

Summary
A summary is used to represent different observations (like response size or request durations usually). It also displays the total number of observations and the sum of each observed value. On any sliding time window, it can calculate configurable quantities.

11. What is the default data retention period in Prometheus?
The default data retention period is 15 days in Prometheus. Data would be automatically deleted after the data storage default retention duration has passed.

13. What is Prometheus exporter?
A Prometheus Exporter is a part of software that allows it to fetch statistics from another, non-Prometheus system. It converts those statistics into Prometheus metrics, using a client library. You can start a web server which exposes a /metrics URL, and can see that URL display the system metrics.

14. What is Thanos Prometheus?
hanos is a “highly available Prometheus setup with long-term storage capability,” to put it simply. Thanos enables you to query and aggregate data from several Prometheus instances from a single endpoint. Thanos also handles duplicate measurements that may result from several Prometheus instances automatically.

15. What is Grafana Cloud?
Grafana Cloud is highly available, fast fully managed and an open SaaS software as a service metrics platform.I takes the load of hosting the solution on prem and helps in free managing the entire development infrastructure and it runs on Kubernetes clusters.

16. What types of Monitoring can be done via Grafana?
There are 4 tyes of Monitoring that can be done by Grafana are:
- CPU
- Disk Space
- Memory
- Top Process

22. What is Prometheus good for?
Prometheus can scrape metrics from jobs directly or, for short-lived jobs by using a push gateway when the job exits. The scraped samples are stored locally and rules are applied to the data to aggregate and generate new time series from existing data or generate alerts based on user-defined triggers.

23. What protocol does Prometheus use?
Prometheus is primarily based on a pull model, in which the prometheus server has a list of targets it should scrape metrics from. The pull protocol is HTTP based and simply put, the target returns a list of ” “.

24. Is Prometheus hard to learn?
Prometheus is easy to setup but it barely does anything. It gets really messy when one needs to gather application metrics (postgresql, cassandra, haproxy, java, etc…) and have dashboards and alerts going to different places (slack, email, etc…).

25. What can be monitored using Prometheus?
Prometheus is an open-source technology designed to provide monitoring and alerting functionality for cloud-native environments, including Kubernetes. It can collect and store metrics as time-series data, recording information with a timestamp. It can also collect and record labels, which are optional key-value pairs.

26. What is Prometheus alerting?
Prometheus alerting is powered by Alertmanager. Prometheus forwards its alerts to Alertmanager for handling any silencing, inhibition, aggregation, or sending of notifications across your platforms or event management systems of choice.

27. Is Prometheus better than Zabbix?
Prometheus is faster because of the database and Zabbix has a smaller footprint (because it’s written in C). In Zabbix you can do most things in the web GUI, but in Prometheus you must edit files like in Nagios.

28. How fast can Prometheus scrape?
Let’s do an example to better explain the lifecycle of an alert. We do have a simple alert that monitors the load 1m of a node, and fires when it’s higher than 20 for at least 1 minute. Prometheus is configured to scrape metrics every 20 seconds, and the evaluation interval is 1 minute.

30. What is a Prometheus endpoint?
Prometheus is a monitoring platform that collects metrics from monitored targets by scraping metrics HTTP endpoints on these targets. … Our first exporter will be Prometheus itself, which provides a wide variety of host-level metrics about memory usage, garbage collection, and more.

32. How do you write Prometheus rules?
To include rules in Prometheus, create a file containing the necessary rule statements and have Prometheus load the file via the rule_files field in the Prometheus configuration. Rule files use YAML. The rule files can be reloaded at runtime by sending SIGHUP to the Prometheus process.

33. What is a Prometheus exporter?
A Prometheus Exporter is a piece of software that. Can fetch statistics from another, non-Prometheus system. Can turn those statistics into Prometheus metrics, using a client library. Starts a web server that exposes a /metrics URL, and have that URL display the system metrics.

34. What is remote write in Prometheus?
Prometheus remote write is a great feature that allows the sending of metrics from almost any device to a Prometheus server. Just install a service Prometheus instance in the device, enable remote_write , and you’re good to go! … In that case, you can use OpenTelemetry instead of Prometheus.

36. What is runbook in Prometheus?
Prometheus is a systems and service monitoring system. It collects metrics from configured targets at given intervals, evaluates rule expressions, displays the results, and can trigger alerts if some condition is observed to be true; Runbook: Infrastructure Monitoring with Automated Remediation.

37. How does Prometheus Alert Manager work?
The Alertmanager handles alerts sent by client applications such as the Prometheus server. It takes care of deduplicating, grouping, and routing them to the correct receiver integration such as email, PagerDuty, or OpsGenie. It also takes care of silencing and inhibition of alerts.

38. How does Prometheus operator work?
Prometheus Operator
The Operator ensures at all times that a deployment matching the resource definition is running. ServiceMonitor, which declaratively specifies how groups of services should be monitored. The Operator automatically generates Prometheus scrape configuration based on the definition.

39. How do I check my Prometheus configuration?
Thus it’s wise to check that the configuration is good before deploying it. To facilitate this, promtool which comes with Prometheus has a check config command. Let’s check a prometheus config: Download and extract prometheus.

40. How do you run background in Prometheus?
You could name your job anything you want, but calling it “node” allows you to use the default console templates of Node Exporter. Save the file and exit. Start the Prometheus server as a background process. Note that you redirected the output of the Prometheus server to a file called prometheus.

41. What is a Prometheus collector?
The Sensu Prometheus Collector is a Sensu Check Plugin that collects metrics from a Prometheus exporter, metric HTTP endpoint, or the HTTP Query API. The collected metrics are outputted to STDOUT in one of three formats: Influx (the default), Graphite, or JSON.

44. What are the ways of Visualising that Prometheus supports?
When it comes to dashboards or visualizations with Prometheus, there are three options: Prometheus Expression Browser, Grafana, and Prometheus Console Templates.

47. What is the climax of the story of Prometheus?
To begin, the climax was that Prometheus gave the humans fire. … Second, the falling action started when Zeus found out that Prometheus gave the humans fire. So then Zeus imprisoned Prometheus and had birds eating away at him. Finally, Hercules rescued Prometheus from his imprisonment.

48. What is histogram in Prometheus?
A Prometheus histogram consists of three elements: a _count counting the number of samples; a _sum summing up the value of all samples; and finally a set of multiple buckets _bucket with a label le which contains a count of all samples whose value are less than or equal to the numeric value contained in the le label.

49. What is Prometheus in Kubernetes?
Prometheus is an open-source application used for metrics-based monitoring and alerting. Prometheus calls out to your application, pulls real-time metrics, compresses and stores them in a time-series database. Moreover, it offers a powerful data model and a query language and can provide detailed and actionable metrics. When you deploy a new version of the app, k8s creates a new pod (container) and after the pod is ready k8s destroy the old one. It is on a constant vigil, watching the k8s API and when detects a change it creates a new Prometheus configuration, based on the services (pods) changes.

50. What can you monitor with Prometheus?
Prometheus is a monitoring solution for recording and processing any purely numeric time-series. It gathers, organizes, and stores metrics along with unique identifiers and timestamps. Prometheus is open-source software that collects metrics from targets by “scraping” metrics HTTP endpoints.

