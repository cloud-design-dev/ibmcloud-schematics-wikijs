data "ibm_compute_ssh_key" "deploymentKey" {
  label = var.ssh_key
}


data "template_file" "installer" {
  template = file("${path.module}/installer.sh")

  vars {
    email = var.email
    fqdn  = "${var.hostname}.${var.domain}"
  }
}