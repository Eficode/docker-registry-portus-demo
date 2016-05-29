## Settings
* Make a config: `cp configure_aws.template configure_aws.sh`
* Edit values in the config: `vi configure_aws.sh`
* Set permissions: `chmod 744 configure_aws.sh`
* Activate the config: `source configure_aws.sh`

## Create Portus Registry
* Create Portus machine: `./portus_up.sh`  
* Copy run script: `docker-machine scp run_portus.sh portus:/home/ubuntu/run_portus.sh`  
* Run Portus: `docker-machine ssh portus "sudo /home/ubuntu/run_portus.sh $(docker-machine ip portus)"`
* You may need to press `Y` and `Enter` to confirm.

The installation creates `docker-machine` security group. Edit permissions to allow all traffic.

## Accessing  
* Get interlock ip: `docker-machine ip portus`  
* Access Portus UI with browser at `http://<ip>:3000`  
* Use registry at `http://<ip>:5000`

## Delete Portus Registry  
* `docker-machine rm -f portus`
