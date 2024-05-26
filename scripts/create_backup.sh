#!/bin/bash

# Realiza un backup
BACKUP_NAME=$1
NAMESPACE=${2:-prueba-velero}

if [ -z "$BACKUP_NAME" ]; then
  echo "Uso: $0 <nombre-del-backup> [namespace]"
  exit 1
fi

velero backup create $BACKUP_NAME --include-namespaces $NAMESPACE
