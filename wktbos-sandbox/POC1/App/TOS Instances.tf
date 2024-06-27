resource "oci_core_instance" "TOS_Backend" {
	agent_config {
		is_management_disabled = "false"
		is_monitoring_disabled = "false"
		plugins_config {
			desired_state = "DISABLED"
			name = "Vulnerability Scanning"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "Oracle Java Management Service"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "OS Management Service Agent"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "OS Management Hub Agent"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "Management Agent"
		}
		plugins_config {
			desired_state = "ENABLED"
			name = "Custom Logs Monitoring"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "Compute RDMA GPU Monitoring"
		}
		plugins_config {
			desired_state = "ENABLED"
			name = "Compute Instance Run Command"
		}
		plugins_config {
			desired_state = "ENABLED"
			name = "Compute Instance Monitoring"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "Compute HPC RDMA Auto-Configuration"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "Compute HPC RDMA Authentication"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "Block Volume Management"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "Bastion"
		}
	}
	availability_config {
		recovery_action = "RESTORE_INSTANCE"
	}
	availability_domain = var.availability_domain
	compartment_id = var.compartment_ocid
	create_vnic_details {
		assign_ipv6ip = "false"
		assign_private_dns_record = "true"
		assign_public_ip = "false"
		subnet_id = var.commercialportal_subnet
	}
	display_name = var.TOS_Backend_displayname
	instance_options {
		are_legacy_imds_endpoints_disabled = "false"
	}
	is_pv_encryption_in_transit_enabled = "true"
	metadata = {
		"ssh_authorized_keys" = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCzg0gTcmbCtS90MfbynTz5HHnGBh3vRc07d13/eF75mfL2l4iCB7iTW9xW/EzWETYaT/dYfCA4moYyEKmvPiQA+plpIOLsV9fLZ/wHXTQgJ2vx3fiElwk4kJBK+qHeF8N7TVMULh/ZaHaCAXsHAeGrWCF1G7rMHH75wSY4Aaqn7cE1G7B11SvJquTZTV63c/MIq5vkEWyE46pFNqrYqFtPj8icxqWDH2MSCGLER3rBUR5111yLcFPqegnRkBN6Pcvd21XMETkdUXrYE47a+iFzcGTDwNzPrteyILMkkfsBUjJifATz2XthNC/Ph+g2drkYks4PzjbS/chkdpi7fk0f ssh-key-2024-04-28"
	}
	shape = "VM.Standard.E4.Flex"
	shape_config {
		memory_in_gbs = "4"
		ocpus = "1"
	}
	source_details {
		source_id = var.linux_image
		source_type = "image"
	}
}
resource "oci_core_instance" "TOS_BIS_Database" {
	agent_config {
		is_management_disabled = "false"
		is_monitoring_disabled = "false"
		plugins_config {
			desired_state = "DISABLED"
			name = "Vulnerability Scanning"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "Oracle Java Management Service"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "OS Management Service Agent"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "OS Management Hub Agent"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "Management Agent"
		}
		plugins_config {
			desired_state = "ENABLED"
			name = "Custom Logs Monitoring"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "Compute RDMA GPU Monitoring"
		}
		plugins_config {
			desired_state = "ENABLED"
			name = "Compute Instance Run Command"
		}
		plugins_config {
			desired_state = "ENABLED"
			name = "Compute Instance Monitoring"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "Compute HPC RDMA Auto-Configuration"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "Compute HPC RDMA Authentication"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "Block Volume Management"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "Bastion"
		}
	}
	availability_config {
		recovery_action = "RESTORE_INSTANCE"
	}
	availability_domain = var.availability_domain
	compartment_id = var.compartment_ocid
	create_vnic_details {
		assign_ipv6ip = "false"
		assign_private_dns_record = "true"
		assign_public_ip = "false"
		subnet_id = var.database_subnet
	}
	display_name = var.TOS_BIS_Database_displayname
	instance_options {
		are_legacy_imds_endpoints_disabled = "false"
	}
	is_pv_encryption_in_transit_enabled = "true"
	metadata = {
		"ssh_authorized_keys" = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCzg0gTcmbCtS90MfbynTz5HHnGBh3vRc07d13/eF75mfL2l4iCB7iTW9xW/EzWETYaT/dYfCA4moYyEKmvPiQA+plpIOLsV9fLZ/wHXTQgJ2vx3fiElwk4kJBK+qHeF8N7TVMULh/ZaHaCAXsHAeGrWCF1G7rMHH75wSY4Aaqn7cE1G7B11SvJquTZTV63c/MIq5vkEWyE46pFNqrYqFtPj8icxqWDH2MSCGLER3rBUR5111yLcFPqegnRkBN6Pcvd21XMETkdUXrYE47a+iFzcGTDwNzPrteyILMkkfsBUjJifATz2XthNC/Ph+g2drkYks4PzjbS/chkdpi7fk0f ssh-key-2024-04-28"
	}
	shape = "VM.Standard.E4.Flex"
	shape_config {
		memory_in_gbs = "4"
		ocpus = "1"
	}
	source_details {
		source_id = var.linux_image
		source_type = "image"
	}
}
#Database below, might not be needed as we will use severless DB as a service
resource "oci_core_instance" "TOS_BIS_Reporting_Archiving_Database" {
	agent_config {
		is_management_disabled = "false"
		is_monitoring_disabled = "false"
		plugins_config {
			desired_state = "DISABLED"
			name = "Vulnerability Scanning"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "Oracle Java Management Service"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "OS Management Service Agent"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "OS Management Hub Agent"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "Management Agent"
		}
		plugins_config {
			desired_state = "ENABLED"
			name = "Custom Logs Monitoring"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "Compute RDMA GPU Monitoring"
		}
		plugins_config {
			desired_state = "ENABLED"
			name = "Compute Instance Run Command"
		}
		plugins_config {
			desired_state = "ENABLED"
			name = "Compute Instance Monitoring"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "Compute HPC RDMA Auto-Configuration"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "Compute HPC RDMA Authentication"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "Block Volume Management"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "Bastion"
		}
	}
	availability_config {
		recovery_action = "RESTORE_INSTANCE"
	}
	availability_domain = var.availability_domain
	compartment_id = var.compartment_ocid
	create_vnic_details {
		assign_ipv6ip = "false"
		assign_private_dns_record = "true"
		assign_public_ip = "false"
		subnet_id = var.database_subnet
	}
	display_name = var.TOS_BIS_Reporting_Archiving_Database_displayname
	instance_options {
		are_legacy_imds_endpoints_disabled = "false"
	}
	is_pv_encryption_in_transit_enabled = "true"
	metadata = {
		"ssh_authorized_keys" = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCzg0gTcmbCtS90MfbynTz5HHnGBh3vRc07d13/eF75mfL2l4iCB7iTW9xW/EzWETYaT/dYfCA4moYyEKmvPiQA+plpIOLsV9fLZ/wHXTQgJ2vx3fiElwk4kJBK+qHeF8N7TVMULh/ZaHaCAXsHAeGrWCF1G7rMHH75wSY4Aaqn7cE1G7B11SvJquTZTV63c/MIq5vkEWyE46pFNqrYqFtPj8icxqWDH2MSCGLER3rBUR5111yLcFPqegnRkBN6Pcvd21XMETkdUXrYE47a+iFzcGTDwNzPrteyILMkkfsBUjJifATz2XthNC/Ph+g2drkYks4PzjbS/chkdpi7fk0f ssh-key-2024-04-28"
	}
	shape = "VM.Standard.E4.Flex"
	shape_config {
		memory_in_gbs = "4"
		ocpus = "1"
	}
	source_details {
		source_id = var.linux_image
		source_type = "image"
	}
}