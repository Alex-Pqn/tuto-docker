# Démarrer Apache en arrière-plan
apache2-foreground &
# OR apachectl -D FOREGROUND &

# Attendre le démarrage d'Apache
until nc -z -v -w30 localhost 80
do
  echo "start.sh : Waiting for Apache to start to continue"
  sleep 5
done

# Log un message pour indiquer le démarrage d'Apache
echo "start.sh : Apache started"

# Attendre le démarrage de MySQL
until nc -z -v -w30 database 3306
do
  echo "start.sh : Waiting for MySQL to start to continue"
  sleep 5
done

# Log un message pour indiquer le démarrage de MySQL
echo "start.sh : MySQL started"

# Changer de répertoire vers /var/www/html/app
cd /var/www/html/app

# Installer les dépendances de l'application React
npm install

# Démarrer l'application React avec npm start
npm start

# Log un message pour indiquer la fin du script
echo "start.sh : End of script execution, container ready"

# Maintenir le conteneur actif
tail -f /dev/null
