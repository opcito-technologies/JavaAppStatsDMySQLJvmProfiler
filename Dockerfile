FROM siddheshwarmore/javaapp-statsd:latest

USER root

RUN mkdir -p /app

WORKDIR /app

ADD . /app

RUN chmod +x /app/run_javaprofile_mysqlstatsd.sh
RUN chmod +x /app/statsd-jvm-profiler-2.1.0-jar-with-dependencies.jar
ENV STATSD_PORT=8125
ENV STATSD_SERVER=13.59.35.112
ENV JAVA_HOME=/docker-java-home/jre
EXPOSE 8888

CMD ["/app/run_javaprofile_mysqlstatsd.sh"]
