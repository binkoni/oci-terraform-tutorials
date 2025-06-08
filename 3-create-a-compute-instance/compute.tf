resource "oci_core_instance" "ubuntu_instance" {
    # Required
    availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
    compartment_id = var.tenancy_id
    shape = "VM.Standard.E5.Flex"
    shape_config {
        ocpus = "1"
        memory_in_gbs = "12"
    }
    source_details {
        source_id = "ocid1.image.oc1.phx.aaaaaaaabbv5z2up7vvnejka5nk76ttezyqhb4lcxbppkjmy2nh2hmpspkqa"
        source_type = "image"
    }

    # Optional
    display_name = "tf-core-instance"
    #create_vnic_details {
    #    assign_public_ip = true
    #    subnet_id = "<subnet-ocid>"
    #}
    metadata = {
        ssh_authorized_keys = file("~/.ssh/id_ed25519.pub")
    } 
    preserve_boot_volume = false
}
