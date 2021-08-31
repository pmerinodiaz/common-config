# Add a new user

Adding a new user called "datascientist" in the environment:

```sh
sudo bash create-user.sh <group> datascientist
new password:
Retype new password:
passwd: password updated successfully
```

# Configure a new given user

Configuring an user called "datascientist" in the environment. Creates the mypasswordfile file and
performs the installation of remote in vscode-local-remote:

```sh
sudo bash config-user.sh <group> datascientist <access_key_id> <secret_access_key>
```

# Configure the current user

Create a new user in the environment. Inputs the password and grants the permissions in the group:

```sh
sudo bash create-user.sh <group> datascientist
```

# Configure an user in Docker

Configuring the current user to use Docker:

```sh
sudo bash configure-docker.sh
```

# Configure an user account for optimizations of big files between the local or remote AWS EC2 and AWS S3

Configure a user account to optimize large files in AWS S3 in the local or remote AWS EC2:

```sh
sudo bash configure-s3-optimize-large-files.sh
```

# Synchronize build

Perform a update of source of each oceania repo and common in the folder for the user called "datascientist":

```sh
sudo bash synchronize-build.sh <group> datascientist
```

# Synchronize users

Run a synchronize-build.sh for each user in the environment and changes the right permission in the folder of the user:

```sh
sudo bash synchronize-users.sh <group>
```

# Check Disk Space

Checks the space in disk. Ideally, could be configured in crontab.

```sh
sudo bash check-disk-space.sh <group>
```

# Clone repositories

Clones the repositories of some group. Ideally, it should be executed in the user creation process.

```sh
sudo bash clone-repositories.sh <group>
```

# Delete an existing user

Deleting an existing user called "datascientist" in the environment:

```sh
sudo bash delete-user.sh <group> datascientist
```

# Delete users of a given group in the system

Deleting all user of a given group in the environment:

```sh
sudo bash DeleteUsers.sh <group>
```

# Create Shared Cache Folder

Creates path of shared DVC cache folder of all user in a group:

```sh
sudo bash CreateSharedCacheFolder.sh <group>
```

# Delete all users of some group

Delete all users of some group.

```sh
sudo bash DeleteUser.sh <group>
```

# Remove Data Files

Remove the data files in the local or remote server.

```bash
bash RemoveDataFiles.sh
```

# Remove Data Project Files

Remove the files in the DVC path of local or remote server

```bash
bash RemoveDataProjectFiles.sh <group>
```

# Install the credentials

Install the AWS S3 credentials.

```bash
bash install-credentials.sh <access_key_id> <secret_access_key> <username> <group>
```

# Install the SDK Local and Remote for Fedora Centos and RHEL

Installation of Standard Development Kit (SDK) in Local and Remote:

```bash
bash install-fedora-centos-rhel.sh
```

# Install the Jupyter Extension in VSCode

Installation of Jupyter Extension in VSCode:

```bash
bash install-jupyter-extension.sh
```

# Install the SDK in MacOS

Installation of Standard Development Kit (SDK) in Local and Remote:

```bash
bash install-mac.sh
```

# Install the SDK Local and Remote for Ubuntu and Debian

Installation of Standard Development Kit (SDK) in Local and Remote:

```bash
bash install-ubuntu-debian.sh
```

# Install the SDK Local for Fedora CentOS and RHEL

Installation of Standard Development Kit (SDK) in Local for Fedora CentOS and RHEL:

```bash
bash local-install-fedora-centos-rhel.sh
```

# Install the Jupyter Extension in Local

Installation of Jupyter Extension in Local:

```bash
bash local-install-jupyter-extension.sh
```

# Install the local-install-mac

Installation of SDK in Local:

```bash
bash local-install-mac.sh
```

# Install the local-install-ubuntu-debian.sh

Installation of SDK in Local:

```bash
bash local-install-ubuntu-debian.sh
```

# Show the versions in local

Show the version in local:

```bash
bash local-show-version.sh
```

# Docker configuration in remote host

Perform the Docker configuration in remote host:

```bash
bash remote-configure-docker.sh
```

# AWS S3 optimization large files in the remote host

Perform the AWS S3 optimization large files in the remote host:

```bash
bash remote-configure-s3-optimize-large-files.sh
```

# Parameters

group: The system operative group of the user.

access_key_id: The AWS S3 access key id.

secret_access_key: The AWS S3 secret access key.
