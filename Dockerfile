
#FROM alpine:latest
FROM heroku/heroku:18

#ENV CONFIG_JSON1={\"log\":{\"access\":\"\",\"error\":\"\",\"loglevel\":\"warning\"},\"inbound\":{\"protocol\":\"vmess\",\"port\": 
#ENV CONFIG_JSON2=,\"settings\":{\"clients\":[{\"id\":\" 
#ENV CONFIG_JSON3=\",\"alterId\":64}]},\"streamSettings\":{\"network\":\"ws\"}},\"inboundDetour\":[],\"outbound\":{\"protocol\":\"freedom\",\"settings\":{}}} 


RUN wget https://raw.githubusercontent.com/kuoruan/shell-scripts/master/ovz-bbr/ovz-bbr-installer.sh
RUN chmod +x ovz-bbr-installer.sh
RUN ./ovz-bbr-installer.sh
RUN mkdir -m 777 /v2raybin 
 
ADD entrypoint.sh /entrypoint.sh
ADD server_config.json /v2raybin/config.json
RUN chmod +x /entrypoint.sh 

CMD /entrypoint.sh
