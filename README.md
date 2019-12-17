# VJLF-306
Very good quality website to have information about top level printers.

## Copyright

Valentin - Jonathan - Lazar - Francesco

## Installation

Dépendance globale à installer :
- [Node.js](https://nodejs.org/en/download/)

Après avoir installé Node sur votre machine, vérifiez que l'installation s'est bien déroulée en testant les 2 commandes suivantes:

```bash
> node -v
> npm -v
```

Les deux commandes doivent vous retourner respectivement les versions de Node et NPM.  
Si les commandes ne fonctionnent pas, essayez de relancer votre console.  
Si cela ne fonctionne toujours pas, il vous faut ajouter le dossier d'installation de Node.js à vos variables d'environnements.

### Mettre en place l'environnement de développement
Avant de commencer, il vous faut lancer UwAmp avec vos serveurs Apache et MySQL.

Il vous faut ensuite créer une base de données via l'interface PHPmyadmin nommée **topprinters** dans notre cas.  
Pour charger les données dans la base de données avec un load data, suivre les instructions [ici](https://github.com/FIN-18-20/VJLF-306/tree/master/docs/db).  
L'autre possibilité est d'importer directement la base de données remplie, disponible [ici](https://github.com/FIN-18-20/VJLF-306/blob/master/docs/db/topprinters.sql).

Positionnez-vous à l'emplacement souhaité pour cloner le projet sur votre ordinateur.
```bash
> git clone https://github.com/FIN-18-20/VJLF-306.git
> cd VJLF-306/client
> npm install

# Puis

> cd ../server
> npm install
> cp .env.example .env
```

La configuration de base du fichier **.env** devrait suffire à établir la connexion à la base de données.

Cependant, si vous voulez changer les valeurs par défaut, vous pouvez modifier les valeurs **DB_DATABASE** (pour le nom de la base de données), **DB_USER** et **DB_PASSWORD** (pour le nom et mot de passe de l'utilisateur).

### Lancer l'application
Pour lancer l'application, il vous faut 2 consoles ouvertes simultanément, une pour la partie frontend de l'application et l'autre pour le serveur.
```bash
> cd client
> npm run serve

# Et dans la deuxième console:

> cd server
> npm run start
```

L'application est ensuite accessible à l'adresse suivante: [localhost:8080](http://localhost:8080/)

L'api du serveur est accessible à l'adresse suivante: [localhost:3333](http://localhost:3333/)

Pour vérifier si la connexion du serveur à la base de donnée s'est établie avec succès, vous pouvez accéder à l'endpoint de test sur ce lien : [localhost:3333/test](http://localhost:3333/test) qui vous retourne un JSON avec une liste d'imprimantes.
