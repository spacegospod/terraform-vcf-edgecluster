variable "vcenter_username" {
  description = "Username used to authenticate against the vCenter Server"
}

variable "vcenter_password" {
  description = "Password used to authenticate against the vCenter Server"
}

variable "vcenter_server" {
  description = "FQDN or IP Address of the vCenter Server for the workload domain"
}

variable "cluster_id" {
  description = "The identifier (in SDDC manager) of the compute cluster"
}

variable "sddc_manager_username" {
  description = "Username used to authenticate against an SDDC Manager instance"
}

variable "sddc_manager_password" {
  description = "Password used to authenticate against an SDDC Manager instance"
}

variable "sddc_manager_host" {
  description = "FQDN or IP Address of an SDDC Manager instance"
}

variable "edge_cluster_name" {
  description = "The name of the edge cluster"
}

variable "edge_cluster_root_pass" {
  description = "The root user password for the edge cluster"
}

variable "edge_cluster_admin_pass" {
  description = "The administrator password for the edge cluster"
}

variable "edge_cluster_audit_pass" {
  description = "The audit user password for the edge cluster"
}

variable "tier0_name" {
  description = "The name of the Tier-0"
}

variable "tier1_name" {
  description = "The name of the Tier-1"
}

variable "form_factor" {
  description = "Edge cluster form factor"
}

variable "profile_type" {
  description = "Edge cluster profile type"
}

variable "routing_type" {
  description = "Routing type"
}

variable "high_availability" {
  description = "HA mode"
}

variable "mtu" {
  description = "Mtu"
}

variable "asn" {
  description = "Asn"
}

variable "skip_tep_routability_check" {
  description = "Whether to skip routability checks during creation"
  default = false
}

variable "nodes" {
  type = list(object({
    fqdn = string
    compute_cluster_id = string
    root_password = string
    admin_password = string
    audit_password = string
    management_ip = string
    management_gateway = string
    tep_gateway = string
    tep1_ip = string
    tep2_ip = string
    tep_vlan = number
    inter_rack_cluster = bool
    uplinks = list(object({
      interface_ip = string
      vlan = number
      bgp_peers = list(object({
        ip = string
        password = string
        asn = number
      }))
    }))
  }))
}