# variable "domain_name" {
#   type = string
#   default = "skuller78.click"
#   description = "Route53 Public zone name"
# }

variable "dev_recond_name" {
  type = string
  default = "dev.skuller78.click"
  description = "Record name for DNS"
}

variable "openvpn_recond_name" {
  type = string
  default = "openvpn.skuller78.click"
  description = "Record name for DNS"
}
