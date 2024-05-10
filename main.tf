provider "vcf" {
  sddc_manager_host     = var.sddc_manager_host
  sddc_manager_username = var.sddc_manager_username
  sddc_manager_password = var.sddc_manager_password
  allow_unverified_tls = true
}

resource "vcf_edge_cluster" "edge_cluster" {
  name              = var.edge_cluster_name
  root_password     = var.edge_cluster_root_pass
  admin_password    = var.edge_cluster_admin_pass
  audit_password    = var.edge_cluster_audit_pass
  tier0_name        = var.tier0_name
  tier1_name        = var.tier1_name
  form_factor       = var.form_factor
  profile_type      = var.profile_type
  routing_type      = var.routing_type
  high_availability = var.high_availability
  mtu               = var.mtu
  asn               = var.asn
  skip_tep_routability_check = var.skip_tep_routability_check

  dynamic "edge_node" {
    for_each = var.nodes

    content {
      name = edge_node.value.fqdn
      compute_cluster_id = edge_node.value.compute_cluster_id
      root_password = edge_node.value.root_password
      admin_password = edge_node.value.admin_password
      audit_password = edge_node.value.audit_password
      management_ip = edge_node.value.management_ip
      management_gateway = edge_node.value.management_gateway
      tep_gateway = edge_node.value.tep_gateway
      tep1_ip = edge_node.value.tep1_ip
      tep2_ip = edge_node.value.tep2_ip
      tep_vlan = edge_node.value.tep_vlan
      inter_rack_cluster = edge_node.value.inter_rack_cluster

      dynamic "uplink" {
        for_each = edge_node.value.uplinks

        content {
          interface_ip = uplink.value.interface_ip
          vlan = uplink.value.vlan

          dynamic "bgp_peer" {
            for_each = uplink.value.bgp_peers

            content {
              ip = bgp_peer.value.ip
              password = bgp_peer.value.password
              asn = bgp_peer.value.asn
            }
          }
        }
      }
    }
  }
}