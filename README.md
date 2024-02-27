# A4L VPC

- A terraform implementation of the AWS VPC used in Adrian Cantrill's AWS training courses.
- Creates a VPC with public and private subnets across multiple availability zones.



## Usage

```hcl
provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "git::https://github.com/Ruairi-osul/a4l-vpc.git"

  # Pass inputs here
  azs = ["us-east-1a", "us-east-1b", "us-east-1c"]
}
```

Then run: 

```bash
terraform init
terraform plan
terraform apply
```

## Inputs

| Name                 | Description                                     | Type         | Default                                    | Required |
| -------------------- | ----------------------------------------------- | ------------ | ------------------------------------------ | :------: |
| azs                  | The availability zones to use                   | list(string) | ["us-east-1a", "us-east-1b", "us-east-1c"] |    no    |
| num_reserved_subnets | The number of subnets to reserve for future use | number       | 1                                          |    no    |
| public_subnets       | The name of the public subnets                  | list(string) | ["web"]                                    |    no    |
| private_subnets      | The name of the private subnets                 | list(string) | ["app", "db", "reserved"]                  |    no    |
| cidr_block           | The IPv4 CIDR block for the VPC                 | string       | "10.16.0.0/16"                             |    no    |

## Outputs

| Name               | Type              | Description                      |
| ------------------ | ----------------- | -------------------------------- |
| vpc_id             | string            | The VPC ID                       |
| igw_id             | string            | The Internet Gateway ID          |
| rt_public_id       | string            | The Public Route Table ID        |
| rt_private_id      | string            | The Private Route Table ID       |
| public_subnet_ids  | list(string)      | The Public Subnet IDs            |
| private_subnet_ids | list(string)      | The Private Subnet IDs           |
| subnets_by_az      | map(list(string)) | The Subnets by Availability Zone |
| subnets_by_type    | map(list(string)) | The Subnets by Type              |
