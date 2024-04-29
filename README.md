# Домашнее задание к занятию "Отказоустойчивость в облаке" - Пергунов Д.В

### Задание 1
1. Создали terraform playbook 
2. Установили NGINX автоматизированно
```
#cloud-config
disable_root: true
timezone: Europe/Moscow
repo_update: true
repo_upgrade: true
apt:
  preserve_sources_list: true

packages:
  - nginx

runcmd:
  - [ systemctl, nginx-reload ]
  - [ systemctl, enable, nginx.service ]
  - [ systemctl, start, --no-block, nginx.service ]
```
3. При запросе IP адреса балансировщика получаем ответ.
![image](https://github.com/dimindrol/pergunov_cloud_infra/assets/103885836/b63babab-ba74-473d-947e-1f3c73456a28)

Результат:
1.Terraform playbook https://github.com/dimindrol/pergunov_cloud_infra/tree/a3d9f966876c32d466c4cbf007aa3d02a41aaf2e/cloud_infrastructure
2.Балансировщик
![image](https://github.com/dimindrol/pergunov_cloud_infra/assets/103885836/d5876671-df52-42ce-99bd-44f824973d90)

3. Скриншот страницы с IP балансировщика
![image](https://github.com/dimindrol/pergunov_cloud_infra/assets/103885836/4a85475f-4d8b-4fb1-b35a-e0fa7deb9326)


