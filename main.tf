data "ibm_compute_ssh_key" "deploymentKey" {
  label = var.ssh_key
}

resource "ibm_compute_vm_instance" "node" {
  hostname             = var.hostname
  domain               = var.domain
  os_reference_code    = var.os_image
  datacenter           = var.datacenter
  network_speed        = 1000
  hourly_billing       = true
  private_network_only = false
  local_disk           = true
  user_metadata        = file("installer.sh")
  flavor_key_name      = var.flavor
  tags                 = [var.datacenter]
  ssh_key_ids          = [data.ibm_compute_ssh_key.deploymentKey.id]
}

