mkdir /opt/crust-monitor

if [ ! -f /opt/crust-monitor/nodes.txt ]; then
	touch /opt/crust-monitor/nodes.txt
fi

if [ ! -f /opt/crust-monitor/addresses.txt ]; then
	touch /opt/crust-monitor/addresses.txt
fi

if [ ! -f /opt/crust-monitor/mails.txt ]; then
	touch /opt/crust-monitor/mails.txt
fi
cp appsettings.json /opt/crust-monitor/appsettings.json

docker run -p 80:80 -v /opt/crust-monitor/appsettings.json:/app/appsettings.json -v /opt/crust-monitor/mails.txt:/app/mails.txt -v /opt/crust-monitor/nodes.txt:/app/nodes.txt -v /opt/crust-monitor/addresses.txt:/app/addresses.txt --name="crust-monitor" --restart always -d lwqlwq60/crust-monitor:latest