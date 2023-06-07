variable "mso_username" {
  default = "terraform_css1"
}

variable "mso_password" {
  default = "C1sco12345!"
}

variable "mso_url" {
  default = "https://198.19.202.11"
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

variable "anp" {
    description = "Create application profile"
    type        = string
    default     = "terraform_css1_Terraform_App"
}
variable "epgs" {
    description = "Create epg"
    type        = string
    default     = "terraform_css1_Terraform_Web"
}
variable "contracts" {
  description = "Create contracts with these filters"
  type        = string
  default     = "terraform_css1_Internet-to-Web"
}
