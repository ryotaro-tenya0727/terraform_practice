variable "AWS_SECRET_ACCESS_KEY" {
  description = "AWS Secret Access Key"
  type        = string
  sensitive   = true
}

variable "AWS_ACCESS_KEY_ID" {
  description = "AWS Access Key ID"
  type        = string
}

terraform {
  cloud {
    organization = "ryotaro_aws"

    workspaces {
      name = "learn-terraform"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "ap-northeast-1"
}

resource "aws_instance" "app_server" {
  ami                    = "ami-08f52b2e87cebadd9"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["sg-08a1e8312e6b527d3"]
  subnet_id              = "subnet-091a32d12c159b50f"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}

resource "aws_instance" "app_server_2" {
  ami                    = "ami-08f52b2e87cebadd9"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["sg-08a1e8312e6b527d3"]
  subnet_id              = "subnet-091a32d12c159b50f"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}
