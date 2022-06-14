# Creating vars for "eu-west-2"
variable "region-name" {
  type     = string
  description = "name of region"
  default     = "eu-west-2"

  }

  variable "ami" {
    type = string
    description ="ami"
    default = "ami-0a244485e2e4ffd03"
      
  }

  
  variable "type" {
    type = string
    description = "instance type"
    default = "t2.micro"
  }