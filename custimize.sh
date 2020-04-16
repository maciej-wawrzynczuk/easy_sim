#!/bin/bash
readonly my_container=my_vcsim

readonly vcsim_env=$(docker logs "$my_container" |
			 perl -ne 'print "-e $1 -e $2 -e GOVC_INSECURE=1\n" if /export (\S+) (\S+)/'|
			 tail -1)
readonly docker_cmd="docker exec $vcsim_env $my_container"

#$docker_cmd govc find 
$docker_cmd govc vm.power -off "$vm_with_ip"
$docker_cmd govc vm.customize -vm "$vm_with_ip" -ip 10.0.0.43
$docker_cmd govc vm.power -on "$vm_with_ip"
