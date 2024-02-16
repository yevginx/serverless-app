
########## Providers #############

provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket         = "memo-app-state-bucket-312"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraformlock-memo-app"
  }
}
