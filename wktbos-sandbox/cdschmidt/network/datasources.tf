# DNS Resolver Associations
data "oci_core_vcn_dns_resolver_association" "vcn-mel-siceanz-tolling-cdschmidt-hub-resolverassociation" {
    vcn_id = oci_core_vcn.vcn-mel-siceanz-tolling-sandbox-cdschmidt-hub.id
}
data "oci_core_vcn_dns_resolver_association" "vcn-mel-siceanz-tolling-cdschmidt-spoke01-resolverassociation" {
    vcn_id = oci_core_vcn.vcn-mel-siceanz-tolling-sandbox-cdschmidt-spoke01.id
}
data "oci_core_vcn_dns_resolver_association" "vcn-mel-siceanz-tolling-cdschmidt-spoke02-resolverassociation" {
    vcn_id = oci_core_vcn.vcn-mel-siceanz-tolling-sandbox-cdschmidt-spoke02.id
}
data "oci_core_vcn_dns_resolver_association" "vcn-mel-siceanz-tolling-cdschmidt-spoke03-resolverassociation" {
    vcn_id = oci_core_vcn.vcn-mel-siceanz-tolling-sandbox-cdschmidt-spoke03.id
}

/* # IP Addresses
data "oci_core_private_ips" "ips-sn-mel-siceanz-tolling-sandbox-cdschmidt-spoke01-dns-priv" {
    subnet_id = oci_core_subnet.sn-mel-siceanz-tolling-sandbox-cdschmidt-spoke01-dns-priv.id
} */