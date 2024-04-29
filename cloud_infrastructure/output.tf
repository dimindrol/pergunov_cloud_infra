output "external_ip_address_vm_0" {
  value = yandex_compute_instance.vm-1[0].network_interface.0.nat_ip_address
}

output "external_ip_address_vm_1" {
  value = yandex_compute_instance.vm-1[1].network_interface.0.nat_ip_address
}





