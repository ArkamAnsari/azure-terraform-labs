# ☁️ Azure Infrastructure Deployment with Terraform

This project demonstrates how to automate Azure resource provisioning using **Terraform** — following Infrastructure as Code (IaC) best practices.  
It’s designed as a modular foundation for scalable and secure cloud environments.

---

## 🚀 Overview
The Terraform configuration in this repository provisions the following Azure components:

- 🧩 **Resource Group** – logical container for all deployed resources  
- 🌐 **Virtual Network (VNet)** – isolated network environment  
- 🔒 **Network Security Group (NSG)** – defines inbound and outbound traffic rules  
- 🔌 **Network Interface (NIC)** – attaches to virtual machines  
- 🌍 **Public IP** – enables external access  
- 🗄️ **Storage Account** – supports data and diagnostic storage  

---

## 📁 File Structure
| File | Description |
|------|--------------|
| `main.tf` | Core infrastructure definitions |
| `variables.tf` | Input variables for environment flexibility |
| `output.tf` | Displays essential outputs (e.g., IP, names) |

---

## ⚙️ How to Deploy
1. Initialize Terraform  
   ```bash
   terraform init
   terraform plan
   terraform apply
   terraform destroy

