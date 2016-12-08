#!/usr/bin/env bash

# https://github.com/osixia/docker-openldap/issues/20

ldapadd -h ldap-server -c -D cn=admin,dc=gs,dc=doi,dc=net -w admin -f /ldif_files/groups.ldif  || true

ldapadd -h ldap-server -c -D cn=admin,dc=gs,dc=doi,dc=net -w admin -f /ldif_files/people.ldif  || true

ldapmodify -h ldap-server -c -D cn=admin,dc=gs,dc=doi,dc=net -w admin -f /ldif_files/addUsersToGroup.ldif  || true
