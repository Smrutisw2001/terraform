terraform {
  backend "s3" {
    bucket = "smruti-s3-bucket-infra360"
    key = "smruti/terraform.tfstate"
    region = "ap-south-1"
    dynamodb_table = "smruti-dynamo-db"
  }
}
