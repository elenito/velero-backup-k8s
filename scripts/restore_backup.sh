#!/bin/bash

# Restaura un backup
BACKUP_NAME=$1

if [ -z "$BACKUP_NAME" ]; then
  echo "Uso: $0 <nombre-del-backup>"
  exit 1
fi

velero restore create --from-backup $BACKUP_NAME
