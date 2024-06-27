resource "oci_file_storage_file_system" "generated_oci_file_storage_file_system" {
	availability_domain = "OdQD:AP-MELBOURNE-1-AD-1"
	compartment_id = "ocid1.compartment.oc1..aaaaaaaa6ocrtuflscgbd3h4ripc5iiyj72l2a73hzfbkvk7rowuni52nuwq"
	display_name = "FileSystem-SD"
}

resource "oci_file_storage_mount_target" "generated_oci_file_storage_mount_target" {
	availability_domain = "OdQD:AP-MELBOURNE-1-AD-1"
	compartment_id = "ocid1.compartment.oc1..aaaaaaaa6ocrtuflscgbd3h4ripc5iiyj72l2a73hzfbkvk7rowuni52nuwq"
	display_name = "File-Mount-SD"
	subnet_id = "ocid1.subnet.oc1.ap-melbourne-1.aaaaaaaawabq2cotzu4iztqwxhbtschthl7gkngf6jz2cbjzqfa5m47cyd5q"
}

resource "oci_file_storage_export" "generated_oci_file_storage_export" {
	export_set_id = "${oci_file_storage_mount_target.generated_oci_file_storage_mount_target.export_set_id}"
	file_system_id = "ocid1.filesystem.oc1.ap_melbourne_1.aaaaaaaaaaib5ml5nvswyllqojxwiotboaww2zlmmjxxk4tomuwtcllbmqwtcaaa"
	path = "/FileSystem-SD"
}
