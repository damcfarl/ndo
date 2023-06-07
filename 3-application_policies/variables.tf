variable "mso_username" {
  default = "user_name"
}

variable "mso_password" {
  default = "password"
}

variable "mso_url" {
  default = "https://10.10.10.10"
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

variable "anp" {
    description = "Create application profile"
    type        = string
    default     = "user_name_Terraform_App"
}
variable "epgs" {
    description = "Create epg"
    type        = string
    default     = "user_name_Terraform_Web"
}
variable "contracts" {
  description = "Create contracts with these filters"
  type        = string
  default     = "user_name_Internet-to-Web"
}
