# Utilisez une image Node.js officielle avec Apache
FROM node:18

# Variables d'environnement pour l'utilisateur et le groupe www-data
ARG UID=1001
ARG GID=1001

# Modifier l'ID d'utilisateur et de groupe de l'utilisateur www-data
RUN groupmod -g ${GID} www-data && usermod -u ${UID} -g www-data www-data

# Installez les dépendances système + Apache
RUN apt-get update && apt-get install -y apache2 && apt-get clean

# Créez un répertoire de travail pour votre application React
WORKDIR /var/www/html

# Copier l'application React dans le conteneur
COPY . /var/www/html

# Activer les modules Apache nécessaires
RUN a2enmod rewrite
RUN a2enmod headers

# Configuration Apache pour servir l'application React depuis /var/www/html/app/public
RUN echo '<Directory /var/www/html/app/public>\n\
    Options Indexes FollowSymLinks\n\
    AllowOverride All\n\
    Require all granted\n\
</Directory>' > /etc/apache2/sites-available/000-default.conf

# Exposer le port 3000
EXPOSE 3000

# Copiez le script de démarrage personnalisé dans le conteneur
COPY start.sh /usr/bin/start.sh

# Rendez le script de démarrage personnalisé exécutable
RUN chmod +x /usr/bin/start.sh

# Commande pour démarrer le script de démarrage personnalisé
CMD ["/usr/bin/start.sh"]
