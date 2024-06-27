# Global
variable "availability_domain" {
    default = "OdQD:AP-MELBOURNE-1-AD-1"
}
variable "compartment_ocid" {
}
variable "linux_image"{
    default = "ocid1.image.oc1.ap-melbourne-1.aaaaaaaakgmjou3rbkltadterqxsyvmkuclwumjmaqqnr4hxxeeku3yzvj6q"
}
variable "pubkey_siceanz_cdschmidt_testing" {
    default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDCselDXKpH7UonzrTgwKQOlS7mlmHkvOI/YNIHICn7xMRkGa/Bew9+gfMAzpBcjTDrrQrgSwvR5Vx4czBVfSulmIbD7IsyFWhbNE5ZByoGaiGAw4OdkHsOZvgj+gOZiraJSQlkjG2+XoYyUECAmXrSoy1C8t9h7d7Rwwh2t97/MWh1Zs9UUzfaY4NXUzx9QhPjVGjNfA103CnbOGBP1oHRI6PLLM0yV0bW0pwrOeA+i0SunGN71GuM9rAR/+zvgBec0yyfQkQ53rBdnvnVmUgwcri3ZoVxSs09tWpkkHnU2u/TNLMkTpQfLp3CatmCipXkLXQKnmfqPofok+t7QwIX ssh-key-2024-04-16"
}
variable "ocid_sn_spoke01_allaccess_priv" {
    default = "ocid1.subnet.oc1.ap-melbourne-1.aaaaaaaafvt5xmk4wl4fnxhvormtlgd52amevlsujnsf5vur7xdqiu74n2sq"
}
variable "ocid_sn_spoke01_spoke02access_priv" {
    default = "ocid1.subnet.oc1.ap-melbourne-1.aaaaaaaa7lbkj7tw5tllsnyorlg2flrrwuawrsl55cwfew7x2zcfhhg25tla"
}
variable "ocid_sn_spoke01_spoke03access_priv" {
    default = "ocid1.subnet.oc1.ap-melbourne-1.aaaaaaaaf5f5o4xohynij5zmnelvdvan4t7klsfcuqoauof4gpejq4okgvaq"
}
variable "ocid_sn_spoke02_app_priv" {
    default = "ocid1.subnet.oc1.ap-melbourne-1.aaaaaaaaqc7y66u4xsjynth2i54gy4ox7bi6wqkgg2hr7rtv3kfbnzk7ydmq"
}
variable "ocid_sn_spoke02_db_priv" {
    default = "ocid1.subnet.oc1.ap-melbourne-1.aaaaaaaarf7f55i2sgedutxbcjimzfqtrrs5iuebudrq4jgjwfx7hvk5myca"
}
variable "ocid_sn_spoke03_app_priv" {
    default = "ocid1.subnet.oc1.ap-melbourne-1.aaaaaaaa6owfpn33ubpavmpshq6bi54zada4edjt3dbflwvvoieei3jzntxa"
}
variable "ocid_sn_spoke03_db_priv" {
    default = "ocid1.subnet.oc1.ap-melbourne-1.aaaaaaaamf4f4yqg73flbpl4enmma4tye63mk6a5k34fa7n2xlcrsgolctyq"
}


# Spoke01 (mgmt)
variable "srv_spoke01_allaccess_display_name" {
    default = "srv-mel-siceanz-tolling-sandbox-cdschmidt-spoke01-allaccess"
}
variable "srv_spoke01_allaccess_hostname_label" {
    default = "srv-allaccess"
}
# Spoke02
variable "srv_spoke02_app_display_name" {
    default = "srv-mel-siceanz-tolling-sandbox-cdschmidt-spoke02-app"
}
variable "srv_spoke02_app_hostname_label" {
    default = "srv-app"
}
# Spoke02
variable "srv_spoke03_app_display_name" {
    default = "srv-mel-siceanz-tolling-sandbox-cdschmidt-spoke03-app"
}
variable "srv_spoke03_app_hostname_label" {
    default = "srv-app"
}