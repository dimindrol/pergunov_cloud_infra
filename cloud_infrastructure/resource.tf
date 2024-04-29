resource "yandex_compute_instance" "vm-1" {
  count = 2
  name = "vm${count.index}"
  allow_stopping_for_update = true
  

  resources {
    core_fraction = 5
    cores  = 2
    memory = 1
    
  }


  boot_disk {
    initialize_params {
      image_id = "fd82vchjp2kdjiuam29k"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
  }

  metadata = {
     ssh-keys  = "ubuntu:${file(var.public_key_path)}"
     user-data = file("pergunov_cloud_infra/cloud_infrastructure/metadata.yaml")
  }
}

resource "yandex_vpc_network" "network-1" {
  name = "network1"
}

resource "yandex_vpc_subnet" "subnet-1" {
  name           = "subnet1"
  zone           = var.zone
  network_id     = yandex_vpc_network.network-1.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}

