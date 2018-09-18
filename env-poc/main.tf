
provider "aws" {
  region = "eu-west-1"
  profile = "${var.profile}"

}


# data "terraform_remote_state" "state" {
#   backend = "s3"
#   config = {
#     name = "${var.terraform_state_bucket}"
#     # key = "global/s3/${var.environment}/terraform.tfstate"
#       key    = "${var.environment}/terraform.tfstate"
#     region = "eu-west-1"
#   }
# }


data "terraform_remote_state" "state" {
  backend = "s3"
  config {
    bucket = "${var.terraform_state_bucket}"
    key    = "${var.environment}/terraform.tfstate"
    region = "eu-west-1"
  }
}
data "aws_caller_identity" "current" {}

module "module-sec-group" {
  source = "../module-sec-group"
}
