# Subnets
output "ocid_sn-mel-siceanz-tolling-sandbox-cdschmidt-spoke01-allaccess-priv" {
    value = oci_core_subnet.sn-mel-siceanz-tolling-sandbox-cdschmidt-spoke01-allaccess-priv.id
}
output "ocid_sn-mel-siceanz-tolling-sandbox-cdschmidt-spoke01-spoke02access-priv" {
    value = oci_core_subnet.sn-mel-siceanz-tolling-sandbox-cdschmidt-spoke01-spoke02access-priv.id
}
output "ocid_sn-mel-siceanz-tolling-sandbox-cdschmidt-spoke01-spoke03access-priv" {
    value = oci_core_subnet.sn-mel-siceanz-tolling-sandbox-cdschmidt-spoke01-spoke03access-priv.id
}
output "ocid_sn-mel-siceanz-tolling-sandbox-cdschmidt-spoke02-app-priv" {
    value = oci_core_subnet.sn-mel-siceanz-tolling-sandbox-cdschmidt-spoke02-app-priv.id
}
output "ocid_sn-mel-siceanz-tolling-sandbox-cdschmidt-spoke02-db-priv" {
    value = oci_core_subnet.sn-mel-siceanz-tolling-sandbox-cdschmidt-spoke02-db-priv.id
}
output "ocid_sn-mel-siceanz-tolling-sandbox-cdschmidt-spoke03-app-priv" {
    value = oci_core_subnet.sn-mel-siceanz-tolling-sandbox-cdschmidt-spoke03-app-priv.id
}
output "ocid_sn-mel-siceanz-tolling-sandbox-cdschmidt-spoke03-db-priv" {
    value = oci_core_subnet.sn-mel-siceanz-tolling-sandbox-cdschmidt-spoke03-db-priv.id
}

# DNS Resolvers
output "ocid_dnsr-mel-siceanz-tolling-sandbox-cdschmidt-hub" {
    value = data.oci_core_vcn_dns_resolver_association.vcn-mel-siceanz-tolling-cdschmidt-hub-resolverassociation.dns_resolver_id
}
output "ocid_dnsr-mel-siceanz-tolling-sandbox-cdschmidt-spoke01" {
    value = data.oci_core_vcn_dns_resolver_association.vcn-mel-siceanz-tolling-cdschmidt-spoke01-resolverassociation.dns_resolver_id
}
output "ocid_dnsr-mel-siceanz-tolling-sandbox-cdschmidt-spoke02" {
    value = data.oci_core_vcn_dns_resolver_association.vcn-mel-siceanz-tolling-cdschmidt-spoke02-resolverassociation.dns_resolver_id
}
output "ocid_dnsr-mel-siceanz-tolling-sandbox-cdschmidt-spoke03" {
    value = data.oci_core_vcn_dns_resolver_association.vcn-mel-siceanz-tolling-cdschmidt-spoke03-resolverassociation.dns_resolver_id
}

/* #IP Addresses
output "ip_sn-mel-siceanz-tolling-sandbox-cdschmidt-spoke01-dns-priv" {
    value = data.oci_core_private_ips.ips-sn-mel-siceanz-tolling-sandbox-cdschmidt-spoke01-dns-priv.private_ips
} */