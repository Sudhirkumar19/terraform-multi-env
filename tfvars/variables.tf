variable "instance_names" {
  type = map(any)
  # default = {
  #     mysql = "t3.small"
  #     backend = "t3.micro"
  #     frontend = "t3.micro"

  # }
}

variable "domain_name" {

  default = "clouddevopslearning.online"
}

variable "zone_id" {
  default = "Z06609085J5XMP4AHR9"
}

variable "common_tags" {
  default = {
    Project   = "expense"
    Terraform = "true"
  }
}

variable "tags" {
  type = map(any)
}

variable "environment" {

}