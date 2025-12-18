variable "ami" {
  type = string
}

variable "instance_type" {
  type = string
}

# variable "instance_id" {
#   type = string
# }

variable "subnet_id" {
  type = string
}

variable "security_groups" {
  type = list(string)
}


# variable "instance_name" {
#   type = string
# }