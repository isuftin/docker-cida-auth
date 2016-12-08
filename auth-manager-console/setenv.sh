CATALINA_OPTS="-server"
CATALINA_OPTS="$CATALINA_OPTS -Dcom.sun.management.jmxremote=true"
CATALINA_OPTS="$CATALINA_OPTS -Djava.security.egd=file:/dev/./urandom"
CATALINA_OPTS="$CATALINA_OPTS -Dhttp_port=$auth_manager_console_http_port"
CATALINA_OPTS="$CATALINA_OPTS -Dhttps_port=$auth_manager_console_https_port"

CATALINA_OPTS="$CATALINA_OPTS -Dcida_auth_development=$cida_auth_development"
CATALINA_OPTS="$CATALINA_OPTS -Dcida_auth_manager_password_algorithm=$cida_auth_manager_password_algorithm"
CATALINA_OPTS="$CATALINA_OPTS -Dcida_auth_manager_username=$cida_auth_manager_username"
CATALINA_OPTS="$CATALINA_OPTS -Dcida_auth_manager_password=$cida_auth_manager_password"
CATALINA_OPTS="$CATALINA_OPTS -Dcida_auth_manager_core_rest_url=$cida_auth_manager_core_rest_url"
CATALINA_OPTS="$CATALINA_OPTS -Dcida_auth_manager_core_host=$cida_auth_manager_core_host"
CATALINA_OPTS="$CATALINA_OPTS -Dcida_auth_manager_core_port=$cida_auth_manager_core_port"
CATALINA_OPTS="$CATALINA_OPTS -Dcida_auth_manager_core_scheme=$cida_auth_manager_core_scheme"