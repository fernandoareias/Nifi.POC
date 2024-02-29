FROM apache/nifi:latest

USER root
RUN mkdir -p /opt/nifi/drivers

RUN apt-get update && apt-get install -y curl 
RUN curl -L "https://go.microsoft.com/fwlink/?linkid=2166848" -o /opt/nifi/drivers/mssql-jdbc-9.4.0.jre8.jar

# Start Apache NiFi
CMD ["nifi.sh", "run"]