# Terraform AWS K3s Cluster Setup

This project deploys a [k3s](https://k3s.io/) cluster on AWS using Terraform. The cluster includes one server and two agents (count adjustable via variables).

---

## 📐 Architecture

### 1. Network Infrastructure (VPC)
- Creates a VPC with CIDR block `10.0.0.0/16`.
- Public and private subnets distributed across multiple Availability Zones.

### 2. Subnets
- Public subnets: for Bastion host and NAT instance.
- Private subnets: for K3s server and agents.

### 3. Internet Access
- Internet Gateway attached to public subnets.
- Routes configured via NAT instance for private subnet access.

### 4. NAT and Bastion
- NAT instance: provides internet access for private instances.
- Bastion host: single SSH entry point.

### 5. Security
- Security Groups:
    - Separate for bastion, NAT, and K3s instances.
- Network ACL:
    - Applied to private subnets for additional control.

---

## 🧱 Resources

### K3s Cluster
- 1 master node (k3s server).
- 2 agent nodes (k3s agents) — count adjustable via `agent_count` variable.

---

## ⚙️ How to Use

### Locally

```bash
git clone https://github.com/your-org/your-repo.git
cd your-repo/terraform

terraform init
terraform apply
```
