#!/bin/bash

# Borra el namespace de prueba
NAMESPACE=${1:-prueba-velero}

kubectl delete namespace $NAMESPACE
