variable "mso_username" {
  default = "user_name"
}

variable "mso_password" {
  default = "password"
}

variable "mso_url" {
  default = "https://10.10.10.10"
}

variable "site1_name" {
  type    = string
  default = "site1"
}

variable "site2_name" {
  type    = string
  default = "site2"
}

variable "tenant_name" {
  type    = string
  default = "user_name_terraform_T01"
}

variable "template_name" {
  type    = string
  default = "user_name_terraform_template"
}

variable "schema" {
    type    = string
    default = "user_name_terraform_schema"
}

variable "vrf" {
    type    = string
    default = "user_name_prod_vrf"
}

variable "bd" {
    type    = string
    default = "user_name_prod_bd"
}
