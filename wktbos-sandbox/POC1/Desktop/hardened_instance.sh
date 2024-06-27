# Added by Edwin Jardin 
#!/bin/bash

# Update and install necessary packages
sudo yum update -y
sudo yum install -y wget

# Download and install CIS benchmarks script (replace URL with actual URL if available)
# wget -O /tmp/cis_benchmark.sh "URL_TO_CIS_BENCHMARK_SCRIPT"

# If a specific CIS hardening tool is available, it can be downloaded and executed here.
# Example commands might look like:
# sudo wget -O /tmp/cis-benchmark.sh https://example.com/cis-benchmark.sh
# sudo chmod +x /tmp/cis-benchmark.sh
# sudo /tmp/cis-benchmark.sh

# Below are sample hardening commands based on CIS recommendations

# Disable unused filesystems
echo "install cramfs /bin/true" >> /etc/modprobe.d/CIS.conf
echo "install freevxfs /bin/true" >> /etc/modprobe.d/CIS.conf
echo "install jffs2 /bin/true" >> /etc/modprobe.d/CIS.conf
echo "install hfs /bin/true" >> /etc/modprobe.d/CIS.conf
echo "install hfsplus /bin/true" >> /etc/modprobe.d/CIS.conf
echo "install squashfs /bin/true" >> /etc/modprobe.d/CIS.conf
echo "install udf /bin/true" >> /etc/modprobe.d/CIS.conf
echo "install vfat /bin/true" >> /etc/modprobe.d/CIS.conf

# Configure cron
sudo chown root:root /etc/crontab
sudo chmod og-rwx /etc/crontab
sudo chown root:root /etc/cron.hourly
sudo chmod og-rwx /etc/cron.hourly
sudo chown root:root /etc/cron.daily
sudo chmod og-rwx /etc/cron.daily
sudo chown root:root /etc/cron.weekly
sudo chmod og-rwx /etc/cron.weekly
sudo chown root:root /etc/cron.monthly
sudo chmod og-rwx /etc/cron.monthly
sudo chown root:root /etc/cron.d
sudo chmod og-rwx /etc/cron.d

# Set permissions on /etc/passwd and /etc/shadow
sudo chown root:root /etc/passwd
sudo chmod 644 /etc/passwd
sudo chown root:shadow /etc/shadow
sudo chmod o-rwx,g-wx /etc/shadow

# Ensure password complexity
sudo yum install -y pam_pwquality
sudo cp /etc/security/pwquality.conf /etc/security/pwquality.conf.bak
sudo sed -i 's/# minlen = 9/minlen = 14/' /etc/security/pwquality.conf
sudo sed -i 's/# minclass = 4/minclass = 4/' /etc/security/pwquality.conf
