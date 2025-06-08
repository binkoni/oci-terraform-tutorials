resource "oci_core_instance" "ubuntu_instance3" {
    # Required
    availability_domain = data.oci_identity_availability_domains.ads.availability_domains[2].name
    compartment_id = oci_identity_compartment.tf-compartment.id
    shape = "VM.Standard.E2.1.Micro"
    shape_config {
        ocpus = "1"
        memory_in_gbs = "1"
    }
    source_details {
        source_id = "ocid1.image.oc1.phx.aaaaaaaav6qjz7xf4saxckiosflpoenx7yaqyrtulyki5x6wejv42btxic5a"
        source_type = "image"
    }

    # Optional
    display_name = "tf-core-instance3"
    create_vnic_details {
        assign_public_ip = true
        subnet_id = oci_core_subnet.vcn-public-subnet.id
    }
    metadata = {
        ssh_authorized_keys = file("~/.ssh/id_ed25519.pub")
    } 
    preserve_boot_volume = false
}
