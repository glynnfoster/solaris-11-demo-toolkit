#!/bin/bash

zfs_menu() {
    while [ answer != "0" ] ; do
        clear
        echo "Select a topic:"
        echo "  1) ZFS pools and filesystems"
        echo "  2) ZFS snapshots and clones"
        echo "  3) ZFS compression"
        echo "  4) ZFS deduplication"
        echo "  5) ZFS encryption"
        echo "  0) Exit to main menu"
        read -p "Your choice: " answer
        case $answer in
            0) break ;;
            1) ./bin/zfs-pools.pl ;;
            2) ./bin/zfs-snap.pl ;;
            3) ./bin/zfs-compress.pl ;;
            4) ./bin/zfs-dedup.pl ;;
            5) ./bin/zfs-encrypt.pl ;;
            *) break ;;
        esac
    done
}

be_menu() {
    while [ answer != "0" ] ; do
        clear
        echo "Select a topic:"
        echo "  1) BE creation, activation, package installation"
        echo "  2) Destroy the current BE and reboot into the backup"
        echo "  3) Remove the corrupted BE and reactivate the backup"
        echo "  0) Exit to main menu"
        read -p "Your choice: " answer
        case $answer in
            0) break ;;
            1) ./bin/be-create.pl ;;
            2) ./bin/be-destroy.pl ;;
            3) ./bin/be-reactivate.pl ;;
            *) break ;;
        esac
    done
}

net_menu() {
    while [ answer != "0" ] ; do
        clear
        echo "Select a topic:"
        echo "  1) New Networking commands"
        echo "  2) Virtual NICs"
        echo "  3) Vanity Naming"
        echo "  4) IPMP"
        echo "  5) Bandwidth control"
        echo "  0) Exit to main menu"
        read -p "Your choice: " answer
        case $answer in
            0) break ;;
            1) ./bin/net-basics.pl ;;
            2) ./bin/net-vnic.pl ;;
            3) ./bin/net-vanity.pl ;;
            4) ./bin/net-ipmp.pl ;;
            5) ./bin/net-resource.pl ;;
            *) break ;;
        esac
    done
}

ips_menu() {
    while [ answer != "0" ] ; do
        clear
        echo "Select a topic:"
        echo "  1) The basics of IPS"
        echo "  2) Installing and uninstalling packages"
        echo "  3) Checking the integrity of packages"
	echo "  4) Performing a system update"
        echo "  0) Exit to main menu"
        read -p "Your choice: " answer
        case $answer in
            0) break ;;
            1) ./bin/ips-basics.pl ;;
            2) ./bin/ips-install.pl ;;
            3) ./bin/ips-integrity.pl ;;
            4) ./bin/ips-update.pl ;;
            *) break ;;
        esac
    done
}

zones_menu() {
    while [ answer != "0" ] ; do
        clear
        echo "Select a topic:"
        echo "  1) Zone installation"
        echo "  2) Inside the zone"
        echo "  3) Zone cloning"
        echo "  4) Zone monitoring"
        echo "  5) Zone resource management"
        echo "  6) Network resource management"
        echo "  0) Exit to main menu"
        read -p "Your choice: " answer
        case $answer in
            0) break ;;
            1) ./bin/zone-install.pl ;;
            2) ./bin/zone-inside.pl ;;
            3) ./bin/zone-clone.pl ;;
            4) ./bin/zone-monitor.pl ;;
            5) ./bin/zone-resource.pl ;;
            6) ./bin/net-resource.pl ;;
            *) break ;;
        esac
    done
}

dtrace_menu() {
    while [ answer != "0" ] ; do
        clear
        echo "Select a topic:"
        echo "  1) DTrace One-liners"
        echo "  2) DTrace CPU"
        echo "  3) DTrace Disk"
        echo "  0) Exit to main menu"
        read -p "Your choice: " answer
        case $answer in
            0) break ;;
            1) ./bin/dtrace-oneliners.pl ;;
            2) ./bin/dtrace-cpu.pl ;;
            3) ./bin/dtrace-disk.pl ;;
            *) break ;;
        esac
    done
}

sec_menu() {
    while [ answer != "0" ] ; do
        clear
        echo "Select a topic:"
        echo "  1) Roles and privileges"
        echo "  0) Exit to main menu"
        read -p "Your choice: " answer
        case $answer in
            0) break ;;
            1) ./bin/security-roles.pl ;;
            *) break ;;
        esac
    done
}

smf_menu() {
    while [ answer != "0" ] ; do
        clear
        echo "Select a topic:"
        echo "  1) SMF Basics"
        echo "  2) Enabling and disabling services"
        echo "  0) Exit to main menu"
        read -p "Your choice: " answer
        case $answer in
            0) break ;;
            1) ./bin/smf-basics.pl ;;
            2) ./bin/smf-enable.pl ;;
            *) break ;;
        esac
    done
}

# Main Menu
while [ answer != "0" ]  
do 
clear 
echo "Select a topic:" 
echo "  1) Image Packaging System (IPS)" 
echo "  2) Boot Environments" 
echo "  3) ZFS" 
echo "  4) Zones" 
echo "  5) Service Management Facility (SMF)"
echo "  6) Networking" 
echo "  7) DTrace" 
echo "  8) Security" 
echo "  0) EXIT" 
read -p "Your choice: " answer 
    case $answer in 
	0) break ;; 
	1) ips_menu ;;
	2) be_menu ;;
	3) zfs_menu ;; 
	4) zones_menu ;;
	5) smf_menu ;;
	6) net_menu ;;
	7) dtrace_menu ;;
	8) sec_menu ;;
	*) break ;; 
   esac  
done 
exit 0

