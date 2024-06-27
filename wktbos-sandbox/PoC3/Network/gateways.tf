# DRG Attachment to drg-mel-siceanz-tolling-ss 
resource "oci_core_drg_attachment" "drga-mel-siceanz-tolling-poc3" {
    drg_id = var.drg_ocid
    display_name = var.drg_attachment_display_name
    drg_route_table_id = var.drgrt_spokeingress
    network_details {
        id = oci_core_vcn.vcn-mel-siceanz-tolling-poc3.id 
        type = "VCN"
        vcn_route_type = "SUBNET_CIDRS"
    }
}
# Route Distribution Statement
resource "oci_core_drg_route_distribution_statement" "drgrds-mel-siceanz-tolling-poc3" {
    drg_route_distribution_id = var.drgrd_ss_import
    action = "ACCEPT"
    match_criteria {
        match_type = "DRG_ATTACHMENT_ID"
        attachment_type = "VCN"
        drg_attachment_id = oci_core_drg_attachment.drga-mel-siceanz-tolling-poc3.id
    }
    priority = "3"
}