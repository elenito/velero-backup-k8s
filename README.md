# velero-backup-k8s
# Backup and Recovery with Velero

This project demonstrates how to configure Velero to manage backups and recovery of a Kubernetes cluster using AWS S3.

## Requirements

- Kubernetes cluster
- Kubectl configured
- AWS CLI configured

## Velero Installation

1. Download and install Velero CLI
    ```bash
    wget https://github.com/vmware-tanzu/velero/releases/download/v1.7.1/velero-v1.7.1-linux-amd64.tar.gz
    tar -xvf velero-v1.7.1-linux-amd64.tar.gz
    sudo mv velero-v1.7.1-linux-amd64/velero /usr/local/bin/
    ```

2. Create an S3 bucket
    ```bash
    aws s3api create-bucket --bucket your-bucket-name --region us-east-1
    ```

3. Configure AWS credentials
    ```ini
    [default]
    aws_access_key_id=<your-access-key-id>
    aws_secret_access_key=<your-secret-access-key>
    ```
    Save this file as `credentials-velero`.

4. Install Velero on the cluster
    ```bash
    velero install \
        --provider aws \
        --plugins velero/velero-plugin-for-aws:v1.2.0 \
        --bucket your-bucket-name \
        --backup-location-config region=us-east-1 \
        --snapshot-location-config region=us-east-1 \
        --secret-file ./credentials-velero
    ```

## Creating a Backup

1. Create a test namespace and deployment
    ```bash
    kubectl create namespace velero-test
    kubectl create deployment nginx --image=nginx --namespace velero-test
    ```

2. Create a backup
    ```bash
    velero backup create test-backup --include-namespaces velero-test
    ```

## Restoring a Backup

1. Delete the test namespace
    ```bash
    kubectl delete namespace velero-test
    ```

2. Restore the backup
    ```bash
    velero restore create --from-backup test-backup
    ```

