terraform {
  backend "s3" {
    bucket         = "ta-terraform-tfstates-753146964827"
    key            = "sprint1/week2/vpc-training/terraform.tfstates"
    dynamodb_table = "terraform-lock"
  }
}