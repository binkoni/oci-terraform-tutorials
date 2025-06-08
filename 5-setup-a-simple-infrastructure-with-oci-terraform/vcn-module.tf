# Source from https://registry.terraform.io/modules/oracle-terraform-modules/vcn/oci/
module "vcn" {
  source  = "oracle-terraform-modules/vcn/oci"
  version = "3.6.0"
  # insert the 1 required variable here

  # Required Inputs
  compartment_id = oci_identity_compartment.tf-compartment.id

  # Optional Inputs 
  region = var.region
  
  # Changing the following default values
  vcn_name = "tutorial-vcn"
  create_internet_gateway = true
  create_nat_gateway = false
  create_service_gateway = false

  # Using the following default values
  # vcn_dns_label = "vcnmodule"
  # vcn_cidrs = ["10.0.0.0/16"]
}

