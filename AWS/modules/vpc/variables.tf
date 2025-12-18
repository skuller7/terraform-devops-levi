variable "vpc_cidr" {
    type = string
}

variable "vpc_frontend_subnet" {
  type = string
}

variable "vpc_backend_subnet" {
  type = string
}

variable "route_cidr_block" {
  type = string
}


variable "security_group_name" {
  type = string
}
