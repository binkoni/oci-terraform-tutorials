provider "oci" {
  tenancy_ocid = var.tenancy_id
  user_ocid = var.user_id
  fingerprint = var.api_fingerprint
  region = var.region
}
