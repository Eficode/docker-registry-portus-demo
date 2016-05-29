#!/bin/bash

# Creates a swarm cluster with a keystore + one master and 2 nodes

set -e

if [ -z "$AMI" ]; then
    echo "Please set AMI to continue" 1>&2
    exit 1
elif [ -z "$KEYPATH" ]; then
    echo "Please set KEYPATH to continue" 1>&2
    exit 1
elif [ -z "$VPC_ID" ]; then
    echo "Please set VPC_ID to continue" 1>&2
    exit 1
elif [ -z "$SUBNET_ID" ]; then
    echo "Please set SUBNET_ID to continue" 1>&2
    exit 1
elif [ -z "$DISK" ]; then
    echo "Please set DISK to continue" 1>&2
    exit 1
elif [ -z "$REGION" ]; then
    echo "Please set REGION to continue" 1>&2
    exit 1
elif [ -z "$INSTANCE_TYPE" ]; then
    echo "Please set INSTANCE_TYPE to continue" 1>&2
    exit 1
fi

docker-machine create \
    --driver amazonec2 \
    --amazonec2-ami $AMI \
    --amazonec2-instance-type $INSTANCE_TYPE \
    --amazonec2-vpc-id $VPC_ID \
    --amazonec2-region $REGION \
    --amazonec2-subnet-id $SUBNET_ID \
    --amazonec2-root-size $DISK \
    --amazonec2-ssh-keypath $KEYPATH \
    portus

