# Introduction to Terraform
In this demo we will be looking to deploy Infrastructure as Code (IaC) using Terraform to the Azure environment   
I am using Azure as it has free credits with a valid MSDN license

## Goals
1. Successfully use [Terraform](https://www.terraform.io) to setup the required infrastructure of our fake 2 teir application in Azure
2. Become more familiar with Terraform compared to Ansible / Ansible Tower
3. Be able to output machine values after the setup is completed

## Fake Scenario
- Azure
- DNS Record
- Web Server
- Database Server

# Notes
Terraform Brings:
1. Consistency
2. Scalability
3. Reusable
4. Repeatable
5. Source Code - removal of human errors & documentation
6. Declaritive over imperative 

# Steps
1. Install Terraform (locally)   
Done on a Linux machine following terraform.io
```
$ terraform version
Terraform v0.13.4
```
2. Initialize Terraform
```
terraform init
```
3. Run

## Tools
- Visual Studio Code
- Terraform (HashiCorp) Extension