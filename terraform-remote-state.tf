# Terraform Remote State Datasource - Remote Backend AWS S3
data "terraform_remote_state" "eks" {
  backend = "s3"
  config = {
    bucket = "devops-careeredge"
    key    = "terraform/terraform.tfstate"
    region = "us-east-2"
  }
}



