terraform {
  required_providers {
    mso = {
      source = "CiscoDevNet/mso"
    }
  }
}

# Configure the provider with your Cisco MSO credentials.
provider "mso" {
  username = var.mso_username
  password = var.mso_password
  url      = var.mso_url
  platform = "nd"
  insecure = true
}

# request a data resource
data "mso_tenant" "tenant_obj" {
    name         = var.tenant_name
    display_name = var.tenant_name
}

# request a data resource
data  "mso_schema" "schema_obj" {
    name           = var.schema
}

# request a data resource
data "mso_site" "site1" {
    name          = var.site1_name 
}

data "mso_site" "site2_obj" {
    name          = var.site2_name
}

resource "mso_schema_site" "schema_site1_obj" {
  schema_id       =  data.mso_schema.schema_obj.id
  site_id         =  data.mso_site.site1.id
  template_name   =  var.template_name
# template_name   =  "terraform_schema"
  undeploy_on_destroy = true
}

#resource "time_sleep" "wait_3_seconds" {
#  depends_on = [mso_schema_site.schema_site1_obj]
#
#  create_duration = "3s"
#}

resource "mso_schema_site" "schema_site2_obj" {
  schema_id       =  data.mso_schema.schema_obj.id
  site_id         =  data.mso_site.site2_obj.id
  template_name   =  var.template_name
# template_name   =  "terraform_schema"
  undeploy_on_destroy = true
}
