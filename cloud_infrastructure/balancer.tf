resource "yandex_lb_target_group" "tg1" {
  name      = "tg1"
  target {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    address   = yandex_compute_instance.vm-1[0].network_interface.0.ip_address
  }
  target {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    address   = yandex_compute_instance.vm-1[0].network_interface.0.ip_address
  }
}

resource "yandex_lb_network_load_balancer" "lb1" {
  name = "lb1"
  deletion_protection = "false"
  listener {
    name = "mylb1"
    port = 80
    external_address_spec {
      ip_version = "ipv4"
    }
  }
  attached_target_group {
    target_group_id = yandex_lb_target_group.tg1.id
    healthcheck {
      name = "http"
      http_options {
        port = 80
        path = "/"
      }
    }
  }
}