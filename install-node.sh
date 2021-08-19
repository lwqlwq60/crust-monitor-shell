if [ `grep -c "4243" /lib/systemd/system/docker.service` -eq '0' ]; then

         sed -i "s/-H fd:\/\//-H fd:\/\/ -H=tcp:\/\/0.0.0.0:4243/g" /lib/systemd/system/docker.service
         systemctl daemon-reload
         service docker restart
fi

docker run -p 51888:80 --name="crust-monitor-node" -v /opt/crust:/opt/crust --restart always --add-host=host.docker.internal:host-gateway -d lwqlwq60/crust-monitor-node:latest 