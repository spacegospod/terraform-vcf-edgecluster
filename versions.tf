terraform {
  required_version = ">= 1.5.7"
  required_providers {
    vcf = {
      source = "vmware/vcf"
      version = ">= 8.5.0"
    }
  }
}