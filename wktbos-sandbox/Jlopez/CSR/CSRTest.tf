provider "oci" {}

resource "oci_certificates_management_certificate_authority" "generated_oci_certificates_management_certificate_authority" {
	certificate_authority_config {
		config_type = "ROOT_CA_GENERATED_INTERNALLY"
		signing_algorithm = "SHA256_WITH_RSA"
		subject {
			common_name = "SiceANZ"
		}
		validity {
			time_of_validity_not_after = "2034-06-23T00:00:00.000Z"
		}
	}
	certificate_authority_rules {
		certificate_authority_max_validity_duration = "P3651D"
		leaf_certificate_max_validity_duration = "P365D"
		rule_type = "CERTIFICATE_AUTHORITY_ISSUANCE_EXPIRY_RULE"
	}
	compartment_id = "ocid1.compartment.oc1..aaaaaaaaar4g7m6svxn7dlz5wsalf6avfwt3y3h5h6otdzxb76lp4obrg7zq"
	description = "Testing CA"
	kms_key_id = "ocid1.key.oc1.ap-melbourne-1.f5tgse6waagmu.abwwkljryrvuubznppcwteolnqzbwljuk3hhmcxw4fdfkrh5tkhxz7pawi6q"
	name = "Test-Certificate"
}
