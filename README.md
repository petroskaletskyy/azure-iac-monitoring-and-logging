# Azure Infrastructure as Code (IAC), Monitoring and Logging

## Practical Task 1: Install, Configure, and Manage Terraform State in Azure

1. Install Terraform on your local machine.
2. Verify the installation by checking the Terraform version.
3. Authenticate with Azure using az login and configure Terraform for Azure authentication.
4. Create a Terraform backend configuration using an Azure Storage Account to store the Terraform state remotely:
   - Define a storage account, a container, and a blob in Terraform configuration.
   - Use terraform init to initialize the backend.
   - Run terraform apply to deploy the storage account for state management.
   - Verify that the Terraform state file is stored in the Azure Storage Account.
   - Implement basic state locking using Azure blob storage.
   - Destroy the storage account (after confirming the state behavior).

![img](/screenshots/1_1.png)
![img](/screenshots/1_2.png)
![img](/screenshots/1_3.png)
![img](/screenshots/1_4.png)
![img](/screenshots/1_5.png)
![img](/screenshots/1_6.png)
![img](/screenshots/1_7.png)
![img](/screenshots/1_8.png)

## Practical Task 2: Deploy an Azure Virtual Machine with a Custom Network and Security Rules

Extend the Terraform configuration to deploy:

1. An Azure Virtual Network (VNet) with a custom subnet.
2. A Network Security Group (NSG) with the following rules:
   - Allow SSH (port 22) inbound for a specific IP range.
   - Allow HTTP (port 80) inbound for all users.
   - Deny all other inbound traffic.
3. A Public IP Address assigned to the VM.
4. An Azure Virtual Machine (VM) using an Ubuntu image, attached to the subnet and NSG.
5. A Terraform output variable to display the public IP of the VM after deployment.
6. Use Provisioners to run a startup script that installs and starts an Nginx web server on the VM.
7. Verify:
   - That SSH access works for the specified IP range.
   - That the Nginx web page is accessible via the VM's public IP.
8. Destroy the infrastructure when complete.

![img](/screenshots/2_1.png)
![img](/screenshots/2_2.png)
![img](/screenshots/2_3.png)
![img](/screenshots/2_4.png)

## Practical Task 3: Implement a Scalable Infrastructure with Load Balancer and Auto Scaling

Extend the Terraform configuration to create a highly available infrastructure by deploying:

1. A Virtual Network (VNet) with multiple subnets across two Azure Availability Zones.
2. An Azure Load Balancer with:
   - A backend pool of multiple Virtual Machines (VMs).
   - A health probe for HTTP on port 80.
   - A load-balancing rule to distribute traffic across VMs.
3. A Virtual Machine Scale Set (VMSS) with:
   - At least two VM instances that auto-scale based on CPU usage.
   - A startup script to install Apache and deploy a sample website.
4. A Storage Account to store Terraform state remotely.
5. Verify that:
   - The Load Balancer IP distributes traffic between VM instances.
   - Auto-scaling works when CPU usage spikes.
6. Implement Terraform modules to modularize networking, compute, and security configurations.
7. Destroy the infrastructure when testing is complete.

![img](/screenshots/3_1.png)
![img](/screenshots/3_2.png)
![img](/screenshots/3_3.png)
![img](/screenshots/3_4.png)
![img](/screenshots/3_5.png)
![img](/screenshots/3_6.png)
![img](/screenshots/3_7.png)
![img](/screenshots/3_8.png)
![img](/screenshots/3_9.png)

## Practical Task 4: Install and Configure Ansible for Azure

1. Install Ansible on your local machine.
2. Verify the installation by checking the Ansible version.
3. Install the Azure Ansible Collection.
4. Authenticate Ansible with Azure using service principal authentication:
   - Create an Azure Active Directory Service Principal with the necessary permissions.
   - Retrieve the client ID, tenant ID, and secret key.
   - Store credentials securely in an Ansible Vault.
5. Write a basic Ansible inventory file that defines Azure as the target environment.
6. Create a simple Ansible playbook that:
   - Retrieves a list of all Azure resource groups.
   - Prints the result as output.
   - Execute the playbook and verify the output.

![img](/screenshots/4_1.png)
![img](/screenshots/4_2.png)
![img](/screenshots/4_3.png)

## Practical Task 5: Deploy an Azure Virtual Machine with Ansible

Extend the Ansible configuration to deploy an Azure Virtual Machine (VM):

1. Create an Ansible playbook that:
   - Defines an Azure Virtual Network (VNet) and a Subnet.
   - Creates a Network Security Group (NSG) with rules:
     - Allow SSH (port 22) inbound from a specified IP.
     - Allow HTTP (port 80) inbound for all users.
   - Deploys an Ubuntu VM in the subnet with an attached public IP address.
   - Uses SSH key-based authentication for the VM.
   - Write an Ansible role to configure the VM by:
   - Installing Nginx and starting the service.
   - Copying a custom HTML file to serve as the default web page.
2. Run the playbook and verify:
   - The VM is successfully deployed in Azure.
   - Nginx is running and the custom webpage is accessible via the public IP.
3. Implement idempotency by running the playbook multiple times and ensuring no unintended changes occur.

![img](/screenshots/5_1.png)
![img](/screenshots/5_2.png)
![img](/screenshots/5_3.png)
![img](/screenshots/5_4.png)

## Practical Task 6: Deploy a Scalable Azure Infrastructure with Ansible and Dynamic Inventory (optional)

Extend the Ansible configuration to deploy a highly available infrastructure with:

1. Azure Load Balancer to distribute traffic across multiple VMs.
2. Virtual Machine Scale Set (VMSS) with at least three VM instances running Ubuntu.
3. A custom Ansible role to configure each VM in the scale set:
   - Install Docker and run a containerized web application.
   - Configure UFW (Uncomplicated Firewall) to allow necessary ports.
4. Azure Dynamic Inventory to automatically manage VM instances in Ansible.
5. Implement a rolling update strategy with Ansible:
   - Update the web application without downtime.
   - Ensure only one VM updates at a time using serial and delay settings.
6. Implement Ansible Tower/AWX for centralized playbook execution and monitoring.
7. Verify that:
   - The load balancer distributes traffic evenly.
   - The scale set auto-scales based on CPU usage.
   - The rolling update mechanism works correctly.
8. Implement Ansible Vault for secure credential storage.
9. Tear down the infrastructure using Ansible after verification.

## Practical Task 7: Deploy a Resource Group Using an ARM Template

1. Create a JSON-based ARM Template that defines a resource group named ARMResourceGroup in the East US region.
2. Use az deployment sub create to deploy the resource group using the ARM template.
3. Verify the deployment in the Azure Portal or using the Azure CLI (az group list).
4. Modify the template to add tags to the resource group and redeploy it.
5. Remove the resource group after verification.

![img](/screenshots/7_1.png)
![img](/screenshots/7_2.png)
![img](/screenshots/7_3.png)
![img](/screenshots/7_4.png)
![img](/screenshots/7_5.png)
![img](/screenshots/7_6.png)

## Practical Task 8: Deploy an Azure Storage Account Using an ARM Template

Extend the ARM template to define an Azure Storage Account with:

1. A unique name and StorageV2 account type.
2. Standard_LRS as the replication type.
3. Disable public access to the storage account by setting the public access level to Private for all containers.
4. Add parameters for the storage account name and location.
5. Deploy the template using az deployment group create.
6. Validate the deployment using az storage account list.
7. Modify the template to enable Blob soft delete, then redeploy it.
8. Delete the storage account when done.

![img](/screenshots/8_1.png)
![img](/screenshots/8_2.png)
![img](/screenshots/8_3.png)
![img](/screenshots/8_4.png)
![img](/screenshots/8_5.png)

## Practical Task 9: Terraform: Deploy a Production-Ready AKS Cluster with GitOps & Secret Management & Monitoring

1. Deploy an AKS cluster with Terraform, ensuring production readiness.
2. Integrate ArgoCD for GitOps-based application deployment.
3. Set up an Ingress Controller for ArgoCD access.
4. Enable Azure Key Vault CSI Driver for secure secrets management.
5. Deploy an application via ArgoCD, using a Git repository as the source.
6. Implement application health checks in ArgoCD using Kubernetes readiness/liveness probes.
7. Configure automated sync policies in ArgoCD to enable self-healing and pruning of outdated resources.
8. Enable Monitoring and Logging using:
   - Azure Monitor & Log Analytics for cluster-wide observability
   - Prometheus & Grafana for in-depth Kubernetes metrics
   - Container Insights for real-time pod and node monitoring

## Practical Task 10: Deploy a Virtual Machine with Networking Using an ARM Template

Create an ARM template that deploys:

1. An Azure Virtual Network (VNet) with a custom subnet.
2. A Network Security Group (NSG) allowing SSH and HTTP traffic.
3. A Virtual Machine (VM) running Ubuntu 20.04.
4. A Public IP Address assigned to the VM.
5. Use parameters for VM name, admin username, and authentication type.
6. Deploy the template and verify:
   - The VM is accessible via SSH.
   - The public IP is assigned correctly.
7. Modify the template to enable boot diagnostics and redeploy.
8. Delete the VM and associated resources after verification.

![img](/screenshots/10_1.png)
![img](/screenshots/10_2.png)
![img](/screenshots/10_3.png)
![img](/screenshots/10_4.png)
![img](/screenshots/10_5.png)
![img](/screenshots/10_6.png)
![img](/screenshots/10_7.png)
![img](/screenshots/10_8.png)

## Azure Bicep Tasks

## Convert an ARM Template to Bicep

Take an existing ARM Template (e.g., from Task 8) and convert it to Azure Bicep format using:

1. az bicep decompile --file <arm-template.json>
2. Refactor the Bicep template to:
   - Remove unnecessary metadata.
   - Use variables instead of hardcoded values.
   - Use parameters for the storage account name, SKU, and location.
3. Deploy the Bicep file using az deployment group create.
4. Validate the deployment and compare it to the original ARM deployment.
5. Delete the storage account after testing.

## Practical Task 11: Deploy a Multi-Resource Azure Infrastructure Using Bicep

Create an Azure Bicep file that deploys:

1. A Virtual Network (VNet) with multiple subnets.
2. A Storage Account for VM diagnostics.
3. A Linux Virtual Machine with SSH authentication.
4. A Network Security Group (NSG) with restricted SSH access.
5. Implement modules in Bicep for:
   - Networking
   - Virtual Machine Deployment
6. Deploy the Bicep file and verify:
7. The VM is reachable via SSH.
8. The NSG allows the correct traffic.
   - Modify the configuration to increase VM size and redeploy.
   - Destroy the infrastructure after verification.

## Practical Task 12: Implement Parameterization and Secrets Management in Bicep (optional)

Extend the Bicep configuration to include:

1. Parameter files (.bicepparam) for different environments (e.g., Dev, Prod).
2. A Key Vault to store sensitive values such as admin credentials.
3. Securely retrieve the admin password from Azure Key Vault using @secure() annotation in Bicep.
4. Deploy the infrastructure with environment-specific parameters.
5. Implement conditional logic in Bicep to:
   - Deploy a different VM size for Prod vs. Dev.
   - Enable different security rules based on the environment.
6. Verify that:
   - The correct configuration is applied for each environment.
   - The VM retrieves its credentials securely from Key Vault.
7. Clean up the deployment.

## Azure Monitor Tasks

## Practical Task 13: Configure Azure Monitor to Track VM Metrics and Alerts

1. Enable Azure Monitor for a Virtual Machine (VM).
2. Configure monitoring for the following metrics:
   - CPU utilization
   - Disk read/write operations
   - Network In/Out
3. Set up an alert rule that triggers when CPU utilization exceeds 80% for 5 minutes.
4. Configure the alert to send a notification to an email address.
5. Verify the alert trigger by running a CPU-intensive process on the VM.
6. Delete the alert rule after testing.

## Practical Task 14: Create a Custom Dashboard in Azure Monitor (optional)

1. Navigate to Azure Monitor Dashboards.
2. Create a custom dashboard that includes:
   - A line graph for CPU usage of a Virtual Machine.
   - A bar chart for disk utilization across multiple VMs.
   - A table showing the top 5 VMs consuming the most network bandwidth.
3. Customize the dashboard layout and apply filtering options.
4. Share the dashboard with another Azure user (with Reader access).
5. Save and export the dashboard configuration for reuse.

## Application Insights Tasks

## Practical Task 15: Enable Application Insights for a Web Application

1. Enable Application Insights for an existing Azure Web App.
2. Configure automatic instrumentation for the application (for .NET, Node.js, or Python).
3. Monitor the following performance metrics:
   - Response time
   - Request count
   - Failed request rate
4. Generate load on the application using Apache JMeter or a similar tool.
5. View the performance metrics in Application Insights.
6. Set up an alert for high response times (above 2 seconds).

## Practical Task 16: Analyze Application Telemetry and Dependency Tracking

Use Application Insights to:

1. Enable Live Metrics Stream for real-time monitoring.
2. Capture custom events and telemetry from an application.
3. Track dependencies (database calls, external API calls).
4. Write a simple Kusto Query to retrieve and analyze:
   - The slowest 10 requests in the last 24 hours.
   - The most frequently failing requests.
5. Visualize the results in Application Insights Workbooks.

## Log Analytics Tasks

## Practical Task 17: Query and Analyze Azure Logs with Kusto Query Language (KQL)

1. Connect Azure Log Analytics to a Virtual Machine.
2. Use Azure Monitor Logs to ingest system logs.
3. Write basic KQL queries to analyze logs:
   - Retrieve all logs from the last 3 hours.
   - Find failed login attempts on the VM.
4. Identify the top processes consuming CPU resources.
5. Create a scheduled query rule to trigger an alert when a process exceeds 90% CPU usage.
6. Export the query results to a CSV file for reporting.

## Practical Task 18: Implement Advanced Log Analytics Queries and Alerts (optional)

1. Extend Log Analytics to monitor an Azure Kubernetes Service (AKS) cluster.
2. Configure logs to capture:
   - Pod crashes
   - Memory and CPU utilization per container
   - Network failures between services
3. Write advanced KQL queries to:
   - Detect trends in pod failures over time.
   - Identify the most resource-intensive services in AKS.
4. Generate an anomaly detection report based on historical log patterns.
5. Create an alert rule that triggers when the number of pod restarts exceeds 5 per minute.
6. Integrate the alert with Azure Logic Apps to automatically restart failing pods.
