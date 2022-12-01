#!/bin/bash -e
#docker run --name ldap-service --hostname ldap-service --detach das/openldap:1.1.8

docker run --hostname geofoxx.tech --volume /home/luke/git/openldap/image/certs:/container/service/slapd/assets/certs \
  --name ldap-service \
  --hostname ldap-service \
  --env LDAP_TLS_CRT_FILENAME=geofoxx.tech.crt \
  --env LDAP_TLS_KEY_FILENAME=geofoxx.tech.key \
  --env LDAP_TLS_CA_CRT_FILENAME=gd_bundle_g1_g2.crt \
  --detach das/openldap:1.4.0

docker run \
  --name phpldapadmin-service \
  --hostname phpldapadmin-service \
  --link ldap-service:ldap-host \
  --env PHPLDAPADMIN_LDAP_HOSTS=ldap-host \
  --volume /home/luke/git/GeoServerAWS/certs:/container/service/phpldapadmin/assets/apache2/certs \
  --env PHPLDAPADMIN_HTTPS_CRT_FILENAME=geofoxx.tech.crt \
  --env PHPLDAPADMIN_HTTPS_KEY_FILENAME=geofoxx.tech.key \
  --env PHPLDAPADMIN_HTTPS_CA_CRT_FILENAME=gd_bundle_g1_g2.crt \
  --detach osixia/phpldapadmin:0.9.0

#  --name phpldapadmin-service --hostname phpldapadmin-service --link ldap-service:ldap-host --env PHPLDAPADMIN_LDAP_HOSTS=ldap-host --detach das/phpldapadmin:0.9.0

PHPLDAP_IP=$(docker inspect -f "{{ .NetworkSettings.IPAddress }}" phpldapadmin-service)

echo "Go to: https://$PHPLDAP_IP"
echo "Login DN: cn=admin,dc=geofoxx,dc=tech"
echo "Password: admin"
