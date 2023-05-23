
terraform {
  required_providers {
    mso = {
      source = "CiscoDevNet/mso"
    }
  }
}

# Configure the provider with your Cisco MSO credentials.
provider "mso" {
  # MSO Username
  username = var.mso_username
  # MSO Password
  password = var.mso_password
  # MSO URL
  url      = var.mso_url
  insecure = true
  platform = "nd"
}

# Request an MSO Tenant Resource.
data "mso_tenant" "tenant_obj" {
    name         = var.tenant_name
    display_name = var.tenant_name
}

# request a data resource
data "mso_site" "site1" {
    name          = var.site1_name 
}

# Define an MSO Schema Resource.
resource "mso_schema" "schema_obj" {
    name             = var.schema
    template {
#       name         = var.schema
#       display_name = var.schema
        name         = var.template_name
        display_name = var.template_name
        tenant_id    = data.mso_tenant.tenant_obj.id
    }    
}

# Define an MSO Schema VRF Resource.
resource "mso_schema_template_vrf" "vrf_obj" {
    schema_id     = mso_schema.schema_obj.id
#   template      = var.schema
    template      = var.template_name
    name          = var.vrf
    display_name  = var.vrf
}

resource "mso_schema_template_bd" "bridge_domain" {
    schema_id              = mso_schema.schema_obj.id
    template_name          = var.template_name
    name                   = var.bd
    display_name           = var.bd
    vrf_name               = mso_schema_template_vrf.vrf_obj.name
    layer2_stretch         = true
    layer2_unknown_unicast = "proxy" 
    unicast_routing        = true
}

# Define an MSO Schema BD Resource.
resource "mso_schema_template_bd_subnet" "bd_sub1" {
    schema_id              = mso_schema.schema_obj.id
    template_name          = var.template_name
    bd_name                = mso_schema_template_bd.bridge_domain.name
    ip                     = "10.88.1.1/24"
    scope                  = "public"
    description            = "Subnet used by terraform"
    shared                 = true
    no_default_gateway     = false
    querier                = true
}

/*
resource "mso_schema_template_contract_filter" "filter3" {
  schema_id     = mso_schema.schema_obj.id
  template_name = var.template_name
  contract_name = "Web-to-DB"
  filter_type   = "bothWay"
# filter_type   = "provider_to_consumer"
  filter_name   = "web"
  directives    = ["none", "log"]
}
*/

resource "mso_schema_template_filter_entry" "filter_entry" {
  schema_id          = mso_schema.schema_obj.id
  template_name      = var.template_name
  name               = "web"
  display_name       = "web"
  ether_type         = "ip"
  ip_protocol        = "tcp"
  entry_name         = "http"
  entry_display_name = "http"
  destination_from   = "http"
  destination_to     = "http"
  source_from        = "unspecified"
  source_to          = "unspecified"
  arp_flag           = "unspecified"
}

resource "mso_schema_template_contract" "template_contract" {
  schema_id = mso_schema.schema_obj.id
  template_name = var.template_name
  contract_name = "Web-to-DB"
  display_name = "Web-to-DB"
  filter_type = "bothWay"
  scope = "context"
  filter_relationship {
    filter_schema_id = mso_schema_template_filter_entry.filter_entry.schema_id
    filter_template_name = var.template_name
    filter_name = mso_schema_template_filter_entry.filter_entry.name
  }
  directives = ["none"]
}

/*
resource "mso_schema_template_contract_filter" "filter_https" {
  schema_id          = data.mso_schema.schema_obj.id
  template_name      = var.template_name
# template_name      = data.mso_schema.schema_obj.name
  contract_name      = var.contracts
  filter_type        = "provider_to_consumer"
  filter_name        = var.filter_https
  directives         = ["none", "log"]
}

resource "mso_schema_template_filter_entry" "https_obj" {
  schema_id          = data.mso_schema.schema_obj.id
  template_name      = var.template_name
  name               = var.filter_https
  display_name       = var.filter_https
  entry_name         = "SecureWeb"
  entry_display_name = "SecureWeb"
  ether_type         = "ip"
  ip_protocol        = "tcp"
  destination_from   = "https"
  destination_to     = "https"
}

##resource "mso_schema_template_contract" "template_contract" {
resource "mso_schema_template_contract" "contract_internet_web_obj" {
  schema_id                = data.mso_schema.schema_obj.id
  template_name            = var.template_name
  contract_name            = var.contracts
  display_name             = var.contracts
  filter_relationship    {
    filter_schema_id     = mso_schema_template_filter_entry.https_obj.schema_id
    filter_name          = mso_schema_template_filter_entry.https_obj.entry_name
    filter_template_name = mso_schema_template_filter_entry.https_obj.name
  }
  directives               = ["none"]
}
*/
