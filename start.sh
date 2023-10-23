# Démarrer Apache en arrière-plan
apachectl -D FOREGROUND &

# Changer de répertoire vers /var/www/html/app
cd /var/www/html/app

# Installer les dépendances de l'application React
npm install

# Démarrer l'application React avec npm start
npm start
