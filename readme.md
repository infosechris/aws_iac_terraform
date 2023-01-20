<!-- ABOUT THE PROJECT -->
## Deploy AWS Resources using Terraform - IaC Demonstration

### IAM (Identity)
- Create users, groups, policies: admin and mfa enforcement, etc

### VPC (Network)
- Deploy VPC, Subnets, Route Tables, Security Groups, etc.

### EC2 (Servers)
- Create Key pairs and Deploy linux ec2 server with root/ebs devices, security groups, 

<!-- USAGE EXAMPLES -->
## Usage
1. Set up Free Tier AWS Account
2. Configure AWS profile
2. Install Terraform
3. Clone Repo
4. Init - Plan - Apply!

You can use it as a standalone but also use it as a module like this:

```
module "my_aws_vpc" {
source = "./modules/aws_vpc"
  region               = "us-west-2"
  environment          = "staging"
  vpc_cidr             = "10.0.0.0/16"
  public_subnets_cidr  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets_cidr = ["10.0.3.0/24", "10.0.4.0/24"]
  availability_zones   = ["us-west-2a", "us-west-2b"]
}
```
