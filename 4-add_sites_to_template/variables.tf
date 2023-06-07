variable "mso_username" {
  default = "terraform_css1"
}

variable "mso_password" {
  default = "C1sco12345!"
}

variable "mso_url" {
  default = "https://198.19.202.11"
}

variable "site1_name" {
  type    = string
  default = "DAL"
}

variable "site2_name" {
  type    = string
  default = "SFC"
}

variable "tenant_name" {
  type    = string
  default = "terraform_css1_terraform_T01"
}

variable "template_name" {
  type    = string
  default = "terraform_css1_terraform_template"
}

variable "schema" {
    type    = string
    default = "terraform_css1_terraform_schema" 
}

variable "vrf" {
    type    = string
    default = "terraform_css1_prod_vrf"
}

variable "bd" {
    type    = string
    default = "terraform_css1_prod_bd"
}
