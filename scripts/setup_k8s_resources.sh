#!/bin/bash

# Crea un namespace y un deployment de prueba
kubectl create namespace prueba-velero
kubectl create deployment nginx --image=nginx --namespace prueba-velero
