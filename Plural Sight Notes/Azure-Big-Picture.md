# PluralSight Course - Microsoft Azure: Big Picture
[Course Link](https://app.pluralsight.com/library/courses/microsoft-azure-the-big-picture/table-of-contents)

## Notes
What is cloud?
- A style of computing in which scalable and elastic IT-enabled capabilities are delivered as a service using internet technologies.   
-Gartner
- Rapid ability to increase compute power without having to invest in hardware

Infrastructure as a Service (IaaS)
- Provided bare infrastructure to create your own environment (i.e. virtual machines, harddrive storage, networking, ip addresses, data)

Platform as a Service (Paas)
- Abstract away the infrastructure, by providing a platform 
Generally not managing virtual machines, or other infrastructure components but rather application components

Software as a Service (Saas)
- Higher level of abstraction where you are purchasing or subscribing to software.   
Examples - Salesforce / Twilio / Email

Benefits to cloud:
1.  Reduce time and cost to provision
2.  Lower overall total cost of ownership (rather than purchasing a server, you can just pay for compute that you use)
3.  Increased flexibility in scale and deployment
4.  New solutions possible

## Compute in the Cloud
Types:
1.  Virtual Machines

2.  App Services - PaaS model to hosting a web application or web api

3.  Containers

4.  Serverless - just getting some code running in the cloud without having to worry about any instances or scalability

## Storing and Processing Data
### Self Managed
1.  Virtual Machines or Containers
2.  May be a predfined image
3.  You manage the compute and disks yourself

### Service-Based
1.  Provision an instance
2.  Ability to choose scale characteristics
3.  Managed by Azure
4.  No patching or management needed

### Storage Options
1.  Relational Databases
    1. MySQL
    2. Azure SQL
    3. Maria DB
    4. Many others...
2.  Other Storage Options
    1. Table Storage
    2. Blob Storage (images, files)
    3. Queues
    4. Caching (Redis)
3.  More Self-hosted service options
    1. MongoDB - Document
    2. Cassandra - Graph
    3. Neo4j - Column
4. CosmosDB - many different offerings using one provider

### Networking in the cloud
1.  Virtual Networks are something you can opt into if it makes since for your solution.
- Content Delivery Network
- Traffic Manager
- DNS Zones
- Load Balancer
2.  Allows you to connect your resources together, possibly even between Azure to other external resources.

