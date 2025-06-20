provider "aws" { 
  profile = "default" 
  region  = "us-east-1" 
} 
 
resource "aws_instance"  "instance-1" { 
    ami            = "ami-04b4f1a9cf54c11d0"  
    instance_type  = "t2.micro" 
    tags           =  { Name =  "webserver1" } 
  }

  
resource "aws_instance"    "instance-2"   { 
     ami                  = "ami-0c614dee691cbbf37"  
     instance_type        = "t2.micro" 
    tags                  =  { Name =  "webserver2" } 
  }
resource "aws_security_group" "SG_1" { 
  name            = "linux-sg-ssh-http" 
  description     = "Allow HTTP and SSH traffic"
  tags            =  { Name = "linux-sg-ssh-http" }
  ingress { 
    description = "HTTP" 
    from_port   = 80 
    to_port     = 80 
    protocol    = "tcp" 
    cidr_blocks = ["0.0.0.0/0"] 
  }
   ingress { 
    description = "HTTPS" 
    from_port   = 443 
    to_port     = 443 
    protocol    = "tcp" 
    cidr_blocks = ["0.0.0.0/0"] 
  }
  egress { 
    from_port   = 0 
    to_port     = 0 
    protocol    = "-1" 
    cidr_blocks = ["0.0.0.0/0"] 
  }  
 }
