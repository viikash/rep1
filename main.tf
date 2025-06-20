terraform {
  backend "s3" {
    bucket         = "terraform-backend-statefile-bucket"  # Replace with your S3 bucket name
    key            = "terraform.tfstate"          # Path inside the bucket
    region         = "us-east-1"                  # AWS region
    encrypt        = true                         # Encrypt state file
  }
}
