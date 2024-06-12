#!/bin/bash

# Ensure the script is run with root privileges
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

echo "Installing necessary packages..."

# Install git and selinux-policy-devel
yum install -y git selinux-policy-devel

echo "Cloning RKE2 SELinux repository..."

# Create directory for storing artifacts and clone the git repository
mkdir -p /root/rke2-artifacts/selinux
cd /root/rke2-artifacts/selinux
git clone https://github.com/rancher/rke2-selinux.git

# Change to the cloned directory
cd rke2-selinux/policy/centos9

echo "Building RKE2 SELinux policy module..."

# Build the policy module
make -f /usr/share/selinux/devel/Makefile rke2.pp

# Install the policy module
semodule -i rke2.pp

echo "Setting up directories and applying SELinux file contexts..."

# Creating directories
mkdir -p /var/lib/cni
mkdir -p /opt/cni
mkdir -p /var/lib/kubelet/pods
mkdir -p /var/lib/rancher/rke2/agent/containerd/io.containerd.snapshotter.v1.overlayfs/snapshots
mkdir -p /var/lib/rancher/rke2/data
mkdir -p /var/run/flannel
mkdir -p /var/run/k3s

# Applying SELinux file contexts
echo "Applying SELinux file contexts..."
restorecon -R -i /etc/systemd/system/rke2*
restorecon -R -i /usr/local/lib/systemd/system/rke2*
restorecon -R -i /usr/lib/systemd/system/rke2*
restorecon -R /var/lib/cni
restorecon -R /opt/cni
restorecon -R /var/lib/kubelet
restorecon -R /var/lib/rancher
restorecon -R /var/run/k3s
restorecon -R /var/run/flannel

echo "RKE2 setup and SELinux contexts applied."

# Verify the installation
semodule -l | grep rke2

echo "RKE2 SELinux policy module installation and context application complete."
