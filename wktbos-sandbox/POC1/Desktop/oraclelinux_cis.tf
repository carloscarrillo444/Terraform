# Edwin Jardin - WKTBOSINT-100
# 12 June 2024
# Note: Change the parameters <  >

#Set-up the OCI Provider

provider "oci" {
  tenancy_ocid     = "<our_tenancy_ocid>"
  user_ocid        = "<our_user_ocid>"
  fingerprint      = "<our_fingerprint>"
  private_key_path = "<path_to_our_private_key>"
  region           = "<our_region>"
}

# Variables

provider "oci" {
  tenancy_ocid     = "your_tenancy_ocid>"
  user_ocid        = "your_user_ocid>"
  fingerprint      = "your_fingerprint>"
  private_key_path = "<path_to_our_private_key>"
  region           = "your_region>"
}variable "compartment_ocid" {
  description = "The OCID of the compartment"
}

variable "ssh_public_key" {
  description = "SSH Public Key for the instance"
}

# VCN

resource "oci_core_vcn" "vcn" {
  cidr_block     = "10.0.0.0/16"
  display_name   = "my_vcn"
  compartment_id = var.compartment_ocid
}

resource "oci_core_subnet" "subnet" {
  cidr_block       = "10.0.1.0/24"
  vcn_id           = oci_core_vcn.vcn.id
  display_name     = "my_subnet"
  compartment_id   = var.compartment_ocid
  security_list_ids = [oci_core_security_list.default_security_list.id]
}

#Security List

resource "oci_core_security_list" "default_security_list" {
  display_name   = "default_security_list"
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.vcn.id

  ingress_security_rules {
    protocol = "6"  # TCP
    source   = "0.0.0.0/0"
    tcp_options {
      min = 22
      max = 22
    }
  }

  egress_security_rules {
    protocol = "all"
    destination = "0.0.0.0/0"
  }
}

# Instance configuration - Oracle Linux instance basic configuration with CIS Benchmarks

resource "oci_core_instance" "instance" {
  display_name   = "my_instance"
  compartment_id = var.compartment_ocid
  availability_domain = data.oci_identity_availability_domains.ADs.availability_domains[0].name
  shape          = "VM.Standard2.1"

  create_vnic_details {
    subnet_id = oci_core_subnet.subnet.id
    assign_public_ip = true
  }

  metadata = {
    ssh_authorized_keys = file(var.ssh_public_key)
    user_data = base64encode("#!/bin/bash
# Disable root login over SSH
sed -i 's/^PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config
systemctl restart sshd

# Ensure password complexity
yum install -y pam_pwquality
echo 'password requisite pam_pwquality.so retry=3' >> /etc/pam.d/password-auth

# Disable unnecessary services
systemctl disable avahi-daemon
systemctl disable cups

# Enable automatic updates
yum install -y yum-cron
systemctl enable yum-cron
systemctl start yum-cron
")
  }

  source_details {
    source_type = "image"
    source_id   = data.oci_core_images.oracle_linux_image.id
  }
}

data "oci_core_images" "oracle_linux_image" {
  compartment_id = var.compartment_ocid
  operating_system = "Oracle Linux"
  operating_system_version = "7.9"
  shape = "VM.Standard2.1"
}

