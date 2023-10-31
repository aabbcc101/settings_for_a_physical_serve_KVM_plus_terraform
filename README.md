# settings_for_a_physical_server_KVM_plus_terraform
settings for a physical server. Install system packages. install KVM, install terraform, settings for terraform,  Prepare images to use

Project allow to use providers: libvirt, hosts, iptables
I have binaries build and ready to use.
here is original repositories

https://github.com/hashicorp/terraform/releases
https://github.com/dmacvicar/terraform-provider-libvirt
https://github.com/stefaanc/terraform-provider-hosts
https://github.com/jeremmfr/terraform-provider-iptables/tree/main

Also iptables connects to iptables-api, so I created a service to use
https://github.com/jeremmfr/iptables-api

In playbook.yaml you can find first projects. Uncomment them if you wanna use them as easy start.
*** first projects***
    - provider_libvirt_project
    - provider_hosts_project
    - provider_iptables_project

*** - system_settings ***
 install all required packages. Some of them I like to use. You can add your own if you want to

***  - disks_settings ***
mount an external hdd. this option is useful for creating data clouds or something else
Alter it for your task

***    - set_downloader_for_terraform_and_others ***
terraform website is banned aroud here, so I merely upload all I need to my google drive
I use an app wroten by python to download files.

***    - install_terraform ***
***    - install_terraform_providers ***
install  

***   - libvirt_settings ***
settings for libvirt

***   - iptables_api_service ***
create a new service for iptables here


Have fun!

