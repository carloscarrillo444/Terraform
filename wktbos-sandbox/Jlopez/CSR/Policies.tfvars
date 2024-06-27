/*Step2: Create a Policy for the Dynamic Group
Allow dynamic-group cert-auth-dg to use keys in compartment <compartment name>
Allow dynamic-group cert-auth-dg to manage objects in compartment <compartment name>
Step3: Add a Policy for Administrators
Allow group CertificateAuthorityAdmins to manage certificate-authority-family in compartment <compartment name>
Allow group CertificateAuthorityAdmins to read keys in compartment <compartment name>
Allow group CertificateAuthorityAdmins to use key-delegate in compartment <compartment name>
Allow group CertificateAuthorityAdmins to read buckets in compartment <compartment name>
Allow group CertificateAuthorityAdmins to read vaults in compartment <compartment name>*/