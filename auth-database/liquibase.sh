#!/bin/bash

cd /liquibase/auth-database

/usr/bin/mvn -X -s /liquibase/liquibase-settings.xml -Dmaven.repo.local=/.m2/repository process-resources -P cida-auth-liquibase-postgres