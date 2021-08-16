#!/bin/bash

if [[ $SSH_CONFIG_FOLDER != "" ]]; then
  export ssh_config_file="$SSH_CONFIG_FOLDER/config"

  # Install VSCode extension Remote SSH
  echo "Install VSCode extension Remote SSH"
  echo "Launch Visual Studio Code, Quick Open (Ctrl+P), paste the following command, and press enter."
  echo "ext install ms-vscode-remote.remote"

  # VSCode SSH connection to Remote Host
  # Copy the SSH configuration of the Remote Host
  mkdir -p $SSH_CONFIG_FOLDER
  touch $ssh_config_file
  if [[ $HOST != "" && $HOSTNAME != "" && $USER_SSH != "" ]]; then
    if ! grep -q $HOST $ssh_config_file; then
      echo "" >> $ssh_config_file
      echo "Host $HOST" >> $ssh_config_file
      echo "  HostName $HOSTNAME" >> $ssh_config_file
      echo "  User $USER_SSH" >> $ssh_config_file
      if [[ $PORT != "" ]]; then
        echo "  Port $PORT" >> $ssh_config_file
      fi
      if [[ $IDENTITYFILE != "" ]]; then
        echo "  IdentityFile $IDENTITYFILE" >> $ssh_config_file
      fi
    fi
  fi

  # SSH Public Key Authentication
  if [[ $HOSTNAME != "" && $USER_SSH != "" ]]; then
    if [[ $PORT != "" ]]; then
      ssh-copy-id $USER_SSH@$HOSTNAME -p $PORT
    else
      ssh-copy-id $USER_SSH@$HOSTNAME
    fi
  fi

  # Set the GitLab SSH Keys and Store Git credentials
  if [[ $HOSTNAME != "" ]]; then
    echo "Perform the following steps in order to set the GitLab SSH Keys and store Git credentials from your Visual Studio Code to Remote SSH"
    echo "1. In Visual Studio Code open a Remote Window, Remote SSH: Connect to Host... and Choose $HOSTNAME"
    echo "2. Go to Terminal, New Terminal and type:"
    echo "ssh-keygen"
    echo "3. Type Enter for each question and copy the following public key:"
    echo "cat $SSH_CONFIG_FOLDER/id_rsa.pub"
    echo "4. Navigate to https://gitlab.com or your local GitLab instance URL and sign in."
    echo "5. In the top-right corner, select your avatar."
    echo "6. Select Edit profile."
    echo "7. In the left sidebar, select SSH Keys."
    echo "8. Paste the public key that you copied into the Key text box."
    echo "9. Make sure your key includes a descriptive name in the Title text box, such as Work Laptop or Home Workstation."
    echo "10. Include an (optional) expiry date for the key under “Expires at” section. (Introduced in GitLab 12.9.)."
    echo "11. Click the Add key button."
    echo "12. Go to Visual Studio Code Terminal and type:" 
    echo "git config --global credential.helper store"
  fi
fi