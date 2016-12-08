FROM osixia/openldap:1.1.7

MAINTAINER Ivan Suftin <isuftin@usgs.gov>

RUN mkdir /ldif_files

COPY ldif_files /ldif_files

# Because this container needs to wait for LDAP to be up, install Dockerize
# and control this container running its command based on the LDAP server being up
#
# https://github.com/jwilder/dockerize
# https://github.com/mefellows/dockerize-compose-demo

ENV DOCKERIZE_VERSION "0.2.0"

RUN apt-get update && apt-get install -y wget

ARG doi_network=false

RUN if [ "${doi_network}" = true ]; then \
		/usr/bin/wget -O /usr/lib/ssl/certs/DOIRootCA.crt http://blockpage.doi.gov/images/DOIRootCA.crt && \
		ln -sf /usr/lib/ssl/certs/DOIRootCA.crt /usr/lib/ssl/certs/`openssl x509 -hash -noout -in /usr/lib/ssl/certs/DOIRootCA.crt`.0 && \
		echo "\\n\\nca-certificate = /usr/lib/ssl/certs/DOIRootCA.crt" >> /etc/wgetrc; \
	fi

RUN wget https://github.com/jwilder/dockerize/releases/download/v${DOCKERIZE_VERSION}/dockerize-linux-amd64-v${DOCKERIZE_VERSION}.tar.gz

RUN tar -C /usr/local/bin -xzvf dockerize-linux-amd64-v${DOCKERIZE_VERSION}.tar.gz
