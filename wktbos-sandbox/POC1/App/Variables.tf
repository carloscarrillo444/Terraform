#Variable list
variable "compartment_ocid" {}
variable "availability_domain"{
    default = "OdQD:AP-MELBOURNE-1-AD-1"
}

#declare display name variables
variable "BIS_Public_Portal_Frontend_displayname" {
    default = "BIS Public Portal Frontend"
}
variable "BIS_Internal_Portal_Frontend_displayname" {
    default = "BIS Internal Portal Frontend"
}
variable "BIS_Portal_Backend_displayname" {
    default = "BIS Portal Backend"
}
variable "BIS_Process_Backend_displayname" {
    default = "BIS Process Frontend"
}
variable "BIS_External_Interfaces_displayname"{
    default = "BIS External Interfaces"
}
variable "TOS_Backend_displayname" {
    default = "TOS Backend"
}
variable "AVI_Internal_Portal_Frontend_displayname" {
    default = "AVI Internal Portal Frontend"
}
variable "AVI_Backend_displayname" {
    default = "AVI Backend"
}
variable "TOS_BIS_Database_displayname"{
    default = "TOS-BIS Database"
}
variable "TOS_BIS_Reporting_Archiving_Database_displayname"{
    default = "TOS-BIS Reporting/Archiving Database"
}
variable "AVI_Database_displayname"{
    default = "AVI Database"
}

#Image Variable
variable "linux_image"{
    default = "ocid1.image.oc1.ap-melbourne-1.aaaaaaaakgmjou3rbkltadterqxsyvmkuclwumjmaqqnr4hxxeeku3yzvj6q"
}

#Declare subnets for instance use
variable "commercialportal_subnet"{
    default = "ocid1.subnet.oc1.ap-melbourne-1.aaaaaaaapjr2u3u67ysntzuxgszfqvvsnxp5xmgxpngz7sdey7whsuz6fbta"
}
variable "operationalportal_subnet"{
    default = "ocid1.subnet.oc1.ap-melbourne-1.aaaaaaaao2vrnoipbwabswzoetfs5v6jhdxzfyxmb5nt5tgcpxdsczmodf3a"
}
variable "externalinterface_subnet"{
    default = "ocid1.subnet.oc1.ap-melbourne-1.aaaaaaaa43jb3ew25upgi7ilstzxil5g7kjafhynzwd4nijyeflzetwwapoq"
}
variable "commercialapp_subnet"{
    default = "ocid1.subnet.oc1.ap-melbourne-1.aaaaaaaauk5ekbkt3vetktrr4kyt7jj7xiyrre3rlwbcjcjyoi44nlnlqk3q"
}
variable "opertionalapp_subnet"{
    default = "ocid1.subnet.oc1.ap-melbourne-1.aaaaaaaag2pvm2fgrxroclaaeubqeyzo3rrw5iip6bowwfoojeieyedmrm3a"
}
variable "database_subnet"{
    default = "ocid1.subnet.oc1.ap-melbourne-1.aaaaaaaapjr2u3u67ysntzuxgszfqvvsnxp5xmgxpngz7sdey7whsuz6fbta"
}
