/*
using terrfarom destroy does not appear to in-deploy the sites from the template
*/

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

# Define an MSO Tenant Resource.
data "mso_tenant" "tenant_obj" {
    name         = var.tenant_name
    display_name = var.tenant_name
}

# Define an MSO Schema Resource.
data  "mso_schema" "schema_obj" {
    name          = var.schema
}

data "mso_site" "site1" {
    name          = var.site1_name
}

data "mso_site" "site2" {
    name          = var.site2_name
}

resource "mso_schema_template_deploy_ndo" "template_site1_obj" {
  schema_id       =  data.mso_schema.schema_obj.id
  template_name   =  var.template_name
# site_id         =  data.mso_site.site1.id
}

/*
resource "mso_schema_template_deploy_ndo" "template_site2_obj" {
  schema_id       =  data.mso_schema.schema_obj.id
  template_name   =  var.template_name
# site_id         =  data.mso_site.site2.id
}
*/
