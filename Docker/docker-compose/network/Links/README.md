


# Links
* to defince extra aliases (service_name) by which a service is reachable from another service in the container

* "SERVICE_NAME:LINK_ALIAS" or SERVICE_NAME

* Links are not required to enable services to communicate - by default, any service can reach any other service at that service’s name

* similar to depends_on (determine the order of service startup), 

* use networks instead of links if both are use at the same time


Aliases (alternative hostnames) for this service 