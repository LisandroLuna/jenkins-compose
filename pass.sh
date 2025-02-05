# Opcion 1
docker exec -it jenkins-compose-jenkins-1 cat /var/jenkins_home/secrets/initialAdminPassword

# Opcion 2
docker exec -i jenkins-compose-jenkins-1 /bin/bash
cat /var/jenkins_home/secrets/initialAdminPassword
