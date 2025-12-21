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

variable "user_data" {
  type = string
  default = null
}

variable "key_pair_name" {
  type = string
}

variable "public_key" {
  type = string
}

variable "server_name" {
  type = string
}

# variable "instance_name" {
#   type = string
# }