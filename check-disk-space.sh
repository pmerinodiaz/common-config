#!/bin/bash

# How : Devops
# Want: Get the used disk space in AWS EC2
# For : Perform clean-up of disk

group=$1

####### Configuración del script #######

# Sistemas de ficheros a chequear
devices[0]=/dev/xvda1
#devices[1]=/dev/sda1
#devices[2]=/dev/sda15
#devices[3]=/dev/sdd1
#devices[4]=

####### Cuerpo del script ########
hostname=$(hostname)

# Recorremos el array de dispositivos a monitorizar
for device in ${devices[@]}; do
  # Consultamos la ocupación del dispositivo
  ocupacion=$(df -H | grep $device | expand | tr -s " " | cut -d " " -f5 | cut -d "%" -f1)
  # Si la ocupación es igual o mayor al 60%…
  if [ $ocupacion -ge 60 ]; then
    # Preparación y envío del correo
    message=$(echo "@aquí WARNING, Ambiente Desarrollo $group $device en $hostname al $ocupacion% de ocupación!! Se recomienda borrar datos.")
    curl -X POST --data-urlencode "payload={\"channel\": \"#oceania-alerts\", \"username\": \"webhookbot\", \"text\": \"$message\", \"icon_emoji\": \":ghost:\"}" https://hooks.slack.com/services/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
  fi
done