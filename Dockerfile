# Utilisez une image Node.js officielle avec Apache
FROM node:18

# Installez les dépendances système + Apache
RUN apt-get update && apt-get install -y apache2 curl netcat-openbsd && apt-get clean

# Configuration Apache pour servir l'application React depuis /var/www/html/app/public
RUN echo '<Directory /var/www/html/app/public>\n\
    Options Indexes FollowSymLinks\n\
    AllowOverride All\n\
    Require all granted\n\
</Directory>' > /etc/apache2/sites-available/000-default.conf

# Copier les fichiers de l'application dans le conteneur
COPY . /var/www/html

# Installer les dépendances dans le répertoire app
RUN mkdir /var/www/html/app/node_modules && chown node:node /var/www/html/app/node_modules
WORKDIR /var/www/html/app
USER node
COPY --chown=node:node app/package*.json /var/www/html/app/
RUN npm install
COPY --chown=node:node . /var/www/html/app

USER root

# Retourner dans le répertoire de travail principal
WORKDIR /var/www/html

# Permission pour éxécuter le script de démarrage
RUN chmod +x /var/www/html/start.sh

# Exécuter le script de démarrage
CMD ["sh", "/var/www/html/start.sh"]

# Variables utilisateurs
ARG UID=1001
ARG GID=1001

# Créer un utilisateur webuser avec les UID et GID spécifiés
RUN groupadd -g ${GID} webuser && useradd -u ${UID} -g webuser -s /bin/bash -m webuser

# S'assurer que tous les fichiers dans /var/www/html sont accessibles par webuser
RUN chown -R webuser:webuser /var/www/html
RUN chmod -R 755 /var/www/html

# Utiliser l'utilisateur webuser
USER webuser
