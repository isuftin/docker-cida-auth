CHANGELOG
===

1.2.9-1
---

- isuftin@usgs.gov - Version bump to track release of CIDA Auth project

1.2.8-1
---
- isuftin@usgs.gov - Version bump to track release of CIDA Auth project
- isuftin@usgs.gov - Added healthcheck at the docker-compose level to ldap-server

1.2.7-2
---
- isuftin@usgs.gov - Added the AUTH_MANAGER_VERSION environmental variable to dictate to Docker Compose which version (tagged or latest) of the application set to run
- isuftin@usgs.gov - Updated image names in Docker Compose config to use usgs/ prefix now that images are in Dockerhub
- isuftin@usgs.gov - auth-database - Switching to not branching on whether or not containers are being built on DOI network. Always grab DOI root certificate.

1.2.7-1
---

- Initial release for DockerHub
