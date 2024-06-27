#compartment_id of cmp-siceanz-tolling-sandbox-poc1-desktops
compartment_id = "ocid1.compartment.oc1..aaaaaaaa6ocrtuflscgbd3h4ripc5iiyj72l2a73hzfbkvk7rowuni52nuwq"

#reference and original template from:https://docs.oracle.com/en-us/iaas/secure-desktops/setup-tenancy.htm
#Creating policies for secure desktop service
#1. Create a dynamic group called: DesktopPoolsDynamicGroup and give it below policy
All {resource.type = 'desktoppool', resource.compartment.id = 'ocid1.compartment.oc1..aaaaaaaa6ocrtuflscgbd3h4ripc5iiyj72l2a73hzfbkvk7rowuni52nuwq'}

#2. In the root compartment add following policy
Allow dynamic-group DesktopPoolsDynamicGroup to {DOMAIN_INSPECT} in tenancy
Allow dynamic-group DesktopPoolsDynamicGroup to inspect users in tenancy 
Allow dynamic-group DesktopPoolsDynamicGroup to inspect compartments in tenancy
Allow dynamic-group DesktopPoolsDynamicGroup to use tag-namespaces in tenancy

#3. In the root or compartment above cmp-siceanz-tolling-sandbox-poc1-desktops
#which is cmp-siceanz-tolling-sandbox OCID: ocid1.compartment.oc1..aaaaaaaa32zqvouz342wpp4iogcmdggkjs6qyu7o2clkr5glas7qvz4zmqua
#Create the following policy
Allow dynamic-group DesktopPoolsDynamicGroup to use virtual-network-family in compartment cmp-siceanz-tolling-sandbox-poc1-desktops
Allow dynamic-group DesktopPoolsDynamicGroup to {VCN_ATTACH, VCN_DETACH} in compartment cmp-siceanz-tolling-sandbox-poc1-desktops
Allow dynamic-group DesktopPoolsDynamicGroup to manage virtual-network-family in compartment cmp-siceanz-tolling-sandbox-poc1-desktops
Allow dynamic-group DesktopPoolsDynamicGroup to read instance-images in compartment cmp-siceanz-tolling-sandbox-poc1-desktops
Allow dynamic-group DesktopPoolsDynamicGroup to manage instance-family in compartment cmp-siceanz-tolling-sandbox-poc1-desktops
Allow dynamic-group DesktopPoolsDynamicGroup to manage volume-family in compartment cmp-siceanz-tolling-sandbox-poc1-desktops 
Allow dynamic-group DesktopPoolsDynamicGroup to manage dedicated-vm-hosts in compartment cmp-siceanz-tolling-sandbox-poc1-desktops
Allow dynamic-group DesktopPoolsDynamicGroup to manage orm-family in compartment cmp-siceanz-tolling-sandbox-poc1-desktops 
Allow dynamic-group DesktopPoolsDynamicGroup to {VNIC_CREATE, VNIC_DELETE} in compartment cmp-siceanz-tolling-sandbox-poc1-desktops
Allow dynamic-group DesktopPoolsDynamicGroup to manage instance-configurations in compartment cmp-siceanz-tolling-sandbox-poc1-desktops

#Creating policies for User Authorization - 2 groups needed for User and Admin of secure desktop
#Create user group named Desktop_Admins and Desktop_Users in OCI
#admin policy
group Desktop_Admins to manage desktop-pool-family in compartment cmp-siceanz-tolling-sandbox-poc1-desktops
Allow group Desktop_Admins to read all-resources in compartment cmp-siceanz-tolling-sandbox-poc1-desktops
Allow group Desktop_Admins to use virtual-network-family in compartment cmp-siceanz-tolling-sandbox-poc1-desktops
Allow group Desktop_Admins to use instance-images in compartment cmp-siceanz-tolling-sandbox-poc1-desktops
#user policy
Allow group Desktop_Users to use published-desktops in compartment cmp-siceanz-tolling-sandbox-poc1-desktops

