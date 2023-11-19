# Utilisez une image Node.js officielle avec Apache
FROM node:18

# Installez les dépendances système + Apache
RUN apt-get update && apt-get install -y apache2 && apt-get clean

# Configuration Apache pour servir l'application React depuis /var/www/html/app/public
RUN echo '<Directory /var/www/html/app/public>\n\
    Options Indexes FollowSymLinks\n\
    AllowOverride All\n\
    Require all granted\n\
</Directory>' > /etc/apache2/sites-available/000-default.conf

# Définir le répertoire de travail
WORKDIR /var/www/html

# Variables utilisateurs
ARG UID=1000
ARG GID=1000

# Créer un utilisateur webuser avec les UID et GID spécifiés
RUN groupadd -g ${GID} webuser && useradd -u ${UID} -g webuser -s /bin/bash -m webuser

# Changer le propriétaire du répertoire de travail pour webuser
RUN chown -R webuser:webuser /var/www/html

# Copier les fichiers de l'application dans le répertoire de travail avec les bonnes permissions
COPY --chown=webuser:webuser . /var/www/html

# Permission pour éxécuter le script de démarrage
RUN chmod +x /var/www/html/start.sh

# Exécuter le script de démarrage
CMD ["sh", "/var/www/html/start.sh"]

# Utiliser l'utilisateur webuser
USER webuser
