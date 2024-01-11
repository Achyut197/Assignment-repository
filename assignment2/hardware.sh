#!/bin/bash

# Function to print and highlight differences
print_highlight() {
    if [[ $2 != $3 ]]; then
        echo -e "\e[31m$1: $2 (Expected: $3)\e[0m"
    else
        echo "$1: $2"
    fi
}

# Server Uptime
uptime=$(uptime -p)
echo "Server Uptime: $uptime"

# Last Server Reboot Timestamp
last_reboot=$(who -b | awk '{print $3, $4}')
echo "Last Server Reboot Timestamp: $last_reboot"

# Server Local Time Zone
timezone=$(timedatectl | grep "Time zone" | awk '{print $3}')
print_highlight "Server Local Time Zone" "$timezone" "IST"

# Last 10 installed packages with dates
last_installed_packages=$(rpm -qa --queryformat "%{INSTALLTIME} %{NAME}\n" | sort -n | tail -n 10)
echo -e "\nLast 10 installed packages with dates:"
echo "$last_installed_packages"

# OS version
os_version=$(cat /etc/redhat-release)
print_highlight "OS version" "$os_version" "RHEL"

# Kernel version
kernel_version=$(uname -r)
echo "Kernel version: $kernel_version"

# CPU specifications
cpu_cores=$(nproc)
cpu_clock_speed=$(lscpu | grep "CPU MHz" | awk '{print $3}')
cpu_architecture=$(lscpu | grep "Architecture" | awk '{print $2}')
print_highlight "CPU - Virtual cores" "$cpu_cores" "Expected Value"
print_highlight "CPU - Clock speed" "$cpu_clock_speed" "Expected Value"
print_highlight "CPU - Architecture" "$cpu_architecture" "x86_64"

# Disk specifications
disk_info=$(df -h | grep -E '^Filesystem|/dev/' | awk '{print $1, $2, $6}')
echo -e "\nDisk - Mounted/Unmounted volumes, type, storage:"
echo "$disk_info"

# Private and Public IP
private_ip=$(hostname -I | awk '{print $1}')
public_ip=$(curl -s ifconfig.me)
echo "Private IP: $private_ip"
echo "Public IP: $public_ip"

# Private and Public DNS or Hostname
hostname=$(hostname)
public_dns=$(dig +short -x $public_ip)
echo "Hostname: $hostname"
echo "Public DNS: $public_dns"

# Networking - Bandwidth
bandwidth=$(netstat -i | awk '{if(NR>2)print $1,$7}')
echo -e "\nNetworking - Bandwidth:"
echo "$bandwidth"

# Networking - OS Firewall (Allowed Ports & Protocols)
os_firewall=$(firewall-cmd --list-ports)
echo "Networking - OS Firewall (Allowed Ports & Protocols): $os_firewall"

# Networking - Network Firewall (Allowed Ports & Protocols)
network_firewall=$(netstat -nltup | grep LISTEN)
echo "Networking - Network Firewall (Allowed Ports & Protocols): $network_firewall"

# CPU Utilization
cpu_utilization=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d'%' -f1)
print_highlight "CPU - Utilization" "$cpu_utilization" "60"

# RAM Utilization
ram_utilization=$(free | awk '/Mem/{printf("%.2f"), $3/$2*100}')
print_highlight "RAM - Utilization" "$ram_utilization" "60"

# Storage Utilization
storage_utilization=$(df -h --total | awk '/total/{printf("%.2f"), $5}' | sed 's/%//')
print_highlight "Storage Utilization" "$storage_utilization" "60"

# Password Expiry
password_expiry_days=$(chage -l $USER | grep "Password expires" | awk -F: '{print $2}' | tr -d ' ')
if [[ $password_expiry_days -lt 7 ]]; then
    echo -e "\e[31mPassword Expiring in $password_expiry_days days\e[0m"
fi

