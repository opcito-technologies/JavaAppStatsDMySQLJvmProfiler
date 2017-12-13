# JavaAppStatsDMySQLJvmProfiler

Steps -

### 0. Edit DockerFile to mention the statsD server details -
   
   ENV STATSD_SERVER=13.59.35.112
   ENV STATSD_PORT=8125

### 1. Edit the mysql-statsd.conf-
  
  Edit this section to specify the statsd server 
  [statsd]
    host = 13.59.35.112
    port = 8125
    prefix = xxmysql
    include_hostname = true
  
  Edit this section to specify the mysql server 
  [mysql]
    ; specify 0 for infinite connection retries
    max_reconnect = 5
    host = localhost
    username = root
    password = fr3sca

  Note- In this Dockerfile image used has same password for mysql i.e fr3sca. No change is required for this section with this DockerFile


### 2. docker build -t demojavastatsd .

### 3. docker run -d -p 8888:8080 demojavastatsd:latest

### 4. Browse application at - http://<IP>:8888/JavaStatsdapp/register.html


## Collected Metrics Details -

##### For /register call

1. under graphite folder metrics/stats/Java/UserApp
   registerCount - collects the how many times page is requested

2. under graphite folder metrics/timers/Java/UserApp 
  registerduration - collects the how much time is required 

3. under graphite folder metrics/gauges/Java/UserApp 
    registerGauge


##### For /userList call

1. under graphite folder metrics/stats/Java/UserApp
   userListCount - collects the how many times page is requested

2. under graphite folder metrics/timers/Java/UserApp 
  userListduration - collects the how much time is required

3. under graphite folder metrics/gauges/Java/UserApp 
    userListGauge


##### For /saveuser call

1. under graphite folder metrics/stats/Java/UserApp
   saveUserCount -collects the how many times page is requested

2. under graphite folder metrics/timers/Java/UserApp 
  saveUserduration - collects the how much time is required

3. under graphite folder metrics/gauges/Java/UserApp 
    saveUserGauge


## For JVM profile 

Check the metrics/stats/gauges/statsd-jvm-profiler
