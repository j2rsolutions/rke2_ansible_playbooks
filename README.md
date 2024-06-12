

# RKE2 Ansible Playbooks

## Overview
This repository contains Ansible playbooks for setting up and managing RKE2 clusters on RHEL and Ubuntu. The playbooks cover preparation, installation of prerequisites, RKE2 setup, and Rancher deployment.

## Directory Structure
```plaintext
.
├── README.md
├── ansible
│   ├── ansible.cfg
│   ├── group_vars
│   │   ├── offline_rancher_bootstrap.yml
│   │   ├── rke2-agents.yml
│   │   ├── rke2-servers-masters.yml
│   │   └── rke2-servers.yml
│   ├── hosts
│   ├── orderOfPlaybooks
│   ├── rhel
│   │   ├── carbide
│   │   │   ├── getCarbideImages.yaml
│   │   │   └── installCosignHelmHauler.yaml
│   │   ├── commandstoinstallRancherAirgap
│   │   ├── longhorn
│   │   │   └── installPrereqLongHorn.yaml
│   │   ├── prep
│   │   │   ├── createMntDirectories.yaml
│   │   │   ├── createRkeDataDisks.yaml
│   │   │   ├── disableSELinux.yml
│   │   │   ├── installCosignHelmHauler.yaml
│   │   │   └── installMovePodmanStorageLocation.yaml
│   │   ├── rancher
│   │   │   ├── deployRancher.yaml
│   │   │   ├── gatherRancherArtifacts.yaml
│   │   │   ├── loadRancherImagesAndInstall.yaml
│   │   │   └── manageCerts.yaml
│   │   ├── rke2
│   │   │   ├── installSELinuxRPMs.yaml
│   │   │   ├── killanduninstall.yaml
│   │   │   ├── prepOfflineInstallTarBallBastion.yaml
│   │   │   ├── prepOfflineInstallTarBallMaster.yaml
│   │   │   ├── prepOfflineInstallTarBallServer.yaml
│   │   │   ├── restart-rke2-agents.yaml
│   │   │   └── restart-rke2-servers.yaml
│   └── ubuntu
│       ├── prep
│       │   ├── createMntDirectories.yaml
│       │   ├── createRkeDataDisks.yaml
│       │   └── disableSELinux.yml
│       ├── rancher
│       │   └── deployRancher.yaml
│       └── rke2
│           ├── deployrke2cluster.yaml
│           ├── killanduninstall.yaml
│           ├── restart-rke2-agents.yaml
│           ├── restart-rke2-servers.yaml
│           ├── ubuntu-install-rke2-agent-service copy.yml
│           ├── ubuntu-install-rke2-master-service copy.yml
│           └── ubuntu-install-rke2-server-service copy.yml
└── scripts
    ├── commands.sh
    ├── disableServices.sh
    ├── dockerCNImagePush
    ├── get_helm.sh
    ├── install_rke2_selinux.sh
    └── myapp.te
```

## Playbooks

### RHEL Playbooks
- **carbide/**
  - `getCarbideImages.yaml`: Fetches Carbide images.
  - `installCosignHelmHauler.yaml`: Installs Cosign and Helm Hauler.
- **commandstoinstallRancherAirgap**: Commands to install Rancher in an air-gapped environment.
- **longhorn/**
  - `installPrereqLongHorn.yaml`: Installs prerequisites for Longhorn.
- **prep/**
  - `createMntDirectories.yaml`: Creates mount directories.
  - `createRkeDataDisks.yaml`: Prepares RKE data disks.
  - `disableSELinux.yml`: Disables SELinux.
  - `installCosignHelmHauler.yaml`: Installs Cosign and Helm Hauler.
  - `installMovePodmanStorageLocation.yaml`: Installs and moves Podman storage.
- **rancher/**
  - `deployRancher.yaml`: Deploys Rancher.
  - `gatherRancherArtifacts.yaml`: Gathers Rancher artifacts.
  - `loadRancherImagesAndInstall.yaml`: Loads Rancher images and installs.
  - `manageCerts.yaml`: Manages certificates.
- **rke2/**
  - `installSELinuxRPMs.yaml`: Installs SELinux RPMs.
  - `killanduninstall.yaml`: Kills and uninstalls RKE2.
  - `prepOfflineInstallTarBallBastion.yaml`: Prepares offline install tarball for bastion.
  - `prepOfflineInstallTarBallMaster.yaml`: Prepares offline install tarball for master.
  - `prepOfflineInstallTarBallServer.yaml`: Prepares offline install tarball for server.
  - `restart-rke2-agents.yaml`: Restarts RKE2 agents.
  - `restart-rke2-servers.yaml`: Restarts RKE2 servers.

### Ubuntu Playbooks
- **prep/**
  - `createMntDirectories.yaml`: Creates mount directories.
  - `createRkeDataDisks.yaml`: Prepares RKE data disks.
  - `disableSELinux.yml`: Disables SELinux.
- **rancher/**
  - `deployRancher.yaml`: Deploys Rancher.
- **rke2/**
  - `deployrke2cluster.yaml`: Deploys RKE2 cluster.
  - `killanduninstall.yaml`: Kills and uninstalls RKE2.
  - `restart-rke2-agents.yaml`: Restarts RKE2 agents.
  - `restart-rke2-servers.yaml`: Restarts RKE2 servers.
  - `ubuntu-install-rke2-agent-service copy.yml`: Installs RKE2 agent service on Ubuntu.
  - `ubuntu-install-rke2-master-service copy.yml`: Installs RKE2 master service on Ubuntu.
  - `ubuntu-install-rke2-server-service copy.yml`: Installs RKE2 server service on Ubuntu.

### Scripts
- **scripts/**
  - `commands.sh`: Various command examples for managing RKE2 clusters.
  - `disableServices.sh`: Disables unnecessary services.
  - `dockerCNImagePush`: Pushes Docker images to China registry.
  - `get_helm.sh`: Script to get Helm.
  - `install_rke2_selinux.sh`: Installs RKE2 SELinux policies.
  - `myapp.te`: SELinux policy file.

## Usage
1. **Preparation**: Use the playbooks in `prep` to prepare your environment.
2. **Installation**: Follow the order specified in `orderOfPlaybooks` to install RKE2 and Rancher.
3. **Management**: Use the playbooks in `rancher` and `rke2` to manage your Rancher and RKE2 setups.

## Contributions
Feel free to submit issues or pull requests for improvements and bug fixes.

