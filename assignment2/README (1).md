
# Bash Script For Hardware Specification In RHEL.

Write a bash script to audit the following hardware spec in RHEL. The script should print out following specifications and also audit report should highlight specifications if they are not matching expected specifications

Server Uptime

Last Server Reboot Timestamp

Server Local Time Zone [Expected IST, Highlight to NON-IST ]

Last 10 installed packges with dates

OS version [Expected RHEL family, Highlight for different os]

Kernel version

CPU - Virtual cores

CPU - Clock speed

CPU - Architecture [Expected x86-64 , Highlight for other than x86-64]

Disk - Mounted/Unmounted volumes, type, storage

Private and Public IP

Private and Public DNS or Hostname

Networking - Bandwidth

Networking - OS Firewall (Allowed Ports & Protocols)

Networking - Network Firewall (Allowed Ports & Protocols)

CPU - Utilization [Expected Less than 60 %, Highlight CPU consumption]

RAM - Utilization [Expected Less than 60 %,Highlight RAM consumption]

Storage [Expected Less than 60 %, other wise Highlight Storage consumption]

Highlight when current User Password Exipring




## Command to Run the script
Save the script in a file named hardware.sh.

to make the script executable:

```bash
  chmod +x hardware.sh
```
Run the script use command:

```bash
  ./hardware.sh
```

