terraform {
  required_version = ">=1.0.1"
}

terraform {
  required_providers {
    mso = {
      source = "CiscoDevNet/mso"
#     source = "registry.terraform.io/ciscodevnet/mso"
    }
  }
}

provider "mso" {
    username = var.mso_username
    password = var.mso_password
    url      = var.mso_url
    insecure = true
    platform = "nd"
}

data "mso_site" "site1_hashid" {
   name = var.site1_name
}

data "mso_site" "site2_hashid" {
   name = var.site2_name
}

data "mso_user" "user1_name" {
   username = var.user1_name
}

resource "mso_tenant" "tenent_obj" {
  name = var.tenant_name
  display_name = var.tenant_name
  site_associations  {
    site_id = data.mso_site.site1_hashid.id
  }
  site_associations  {
    site_id = data.mso_site.site2_hashid.id
  }
  user_associations {
    user_id = data.mso_user.user1_name.id
  }

}

