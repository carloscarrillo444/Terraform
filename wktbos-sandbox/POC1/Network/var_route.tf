#variable.tf  
variable "compartment_ocid" {
  description = "The OCID of the compartment where the routing table will be created"
  type        = string
}

variable "vcn_ocid" {
  description = "The OCID of the VCN where the routing table will be created"
  type        = string
}

variable "route_rules" {
  description = "List of route rules"
  type = list(object({
    destination       = string
    destination_type  = string
    network_entity_id = string
  }))
  default = []
}