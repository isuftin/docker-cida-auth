FROM tomcat:8.0-jre8

MAINTAINER Ivan Suftin <isuftin@usgs.gov>

ARG doi_network=false

EXPOSE 8080

ENV AUTH_VERSION ${AUTH_VERSION:-1.2.9}

RUN if [ "${doi_network}" = true ]; then \
		/usr/bin/wget -O /usr/lib/ssl/certs/DOIRootCA.crt http://blockpage.doi.gov/images/DOIRootCA.crt && \
		ln -sf /usr/lib/ssl/certs/DOIRootCA.crt /usr/lib/ssl/certs/`openssl x509 -hash -noout -in /usr/lib/ssl/certs/DOIRootCA.crt`.0 && \
		echo "\\n\\nca-certificate = /usr/lib/ssl/certs/DOIRootCA.crt" >> /etc/wgetrc; \
	fi

RUN wget -O /usr/local/tomcat/webapps/auth-manager-core.war "https://cida.usgs.gov/maven/service/local/artifact/maven/redirect?r=cida-public-releases&g=gov.usgs.cida.auth&a=auth-manager-core&v=${AUTH_VERSION}&e=war"

RUN wget -O /usr/local/tomcat/webapps/probe.war "https://github.com/psi-probe/psi-probe/releases/download/3.0.0.M3/probe.war"

RUN mkdir -p /usr/local/tomcat/ssl

RUN wget -O /usr/local/tomcat/lib/postgresql-9.4.1208.jar  https://jdbc.postgresql.org/download/postgresql-9.4.1208.jar

RUN keytool -genkey -noprompt -keystore /usr/local/tomcat/ssl/.keystore -validity 999 -keysize 2048 -alias auth-manager-core -keyalg RSA -keypass changeit -storepass changeit -dname "CN=auth-manager-core, OU=owi, O=owi, L=middleton, S=WI, C=US"

RUN keytool -selfcert -alias auth-manager-core  -keypass changeit -dname "CN=auth-manager-core, OU=owi, O=owi, L=middleton, S=WI, C=US" -keystore /usr/local/tomcat/ssl/.keystore -storepass changeit -validity 999

COPY web.xml /usr/local/tomcat/conf/web.xml

COPY server.xml /usr/local/tomcat/conf/server.xml

COPY context.xml /usr/local/tomcat/conf/context.xml

COPY tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml

COPY setenv.sh /usr/local/tomcat/bin/setenv.sh

RUN chmod +x /usr/local/tomcat/bin/setenv.sh

RUN rm -rf /usr/local/tomcat/bin/ROOT

RUN rm -rf /usr/local/tomcat/bin/docs

RUN rm -rf /usr/local/tomcat/bin/examples

# Because this container needs to wait for the database to be up, install Dockerize
# and control this container running its command based on the database server starting up.
# This still may not be foolproof as liquibase will still need to be run on the database and while
# that's happening, the
#
# https://github.com/jwilder/dockerize
# https://github.com/mefellows/dockerize-compose-demo

ENV DOCKERIZE_VERSION ${DOCKERIZE_VERSION:-"0.3.0"}

RUN wget "https://github.com/jwilder/dockerize/releases/download/v${DOCKERIZE_VERSION}/dockerize-linux-amd64-v${DOCKERIZE_VERSION}.tar.gz"

RUN tar -C /usr/local/bin -xzvf dockerize-linux-amd64-v${DOCKERIZE_VERSION}.tar.gz

HEALTHCHECK --interval=60s --timeout=3s \
	CMD curl --fail 'http://localhost:8080/auth-manager-core' || exit 1
