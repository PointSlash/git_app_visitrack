-- Création de la table `users` pour stocker les informations des utilisateurs qui gèrent les visites.
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,  -- Identifiant unique de l'utilisateur, incrémenté automatiquement.
    username VARCHAR(100) NOT NULL UNIQUE,   -- Nom d'utilisateur, doit être unique et non nul.
    password VARCHAR(255) NOT NULL,          -- Mot de passe de l'utilisateur, stocké en texte crypté.
    role VARCHAR(50),                        -- Rôle de l'utilisateur (par exemple, admin, réceptionniste).
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,  -- Date et heure de création de l'utilisateur.
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP  -- Dernière mise à jour automatique.
);

-- Création de la table `visitors` pour stocker les informations des visiteurs.
CREATE TABLE visitors (
    visitor_id INT PRIMARY KEY AUTO_INCREMENT,  -- Identifiant unique du visiteur, incrémenté automatiquement.
    first_name VARCHAR(100) NOT NULL,           -- Prénom du visiteur, obligatoire.
    last_name VARCHAR(100) NOT NULL,            -- Nom de famille du visiteur, obligatoire.
    phone_number VARCHAR(20),                   -- Numéro de téléphone du visiteur, optionnel.
    email VARCHAR(150),                         -- Adresse e-mail du visiteur, optionnelle.
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP  -- Date d'enregistrement du visiteur, par défaut la date actuelle.
);

CREATE TABLE visits (
    visit_id INT PRIMARY KEY AUTO_INCREMENT,  -- Identifiant unique de la visite.
    visitor_id INT,  -- Référence à l'identifiant du visiteur (clé étrangère vers la table `visitors`).
    user_id INT,     -- Référence à l'utilisateur qui enregistre la visite (clé étrangère vers `users`).
    visit_date DATETIME DEFAULT CURRENT_TIMESTAMP,  -- Date et heure de début de la visite.
    visit_end_date DATETIME,  -- Date et heure de fin de la visite.
    visit_status VARCHAR(20) NOT NULL,  -- Statut de la visite (en_cours, terminee).
    purpose_of_visit TEXT,  -- Objet de la visite (ex. entretien, réunion).
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,  -- Date de création de la visite.
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,  -- Dernière mise à jour.
    FOREIGN KEY (visitor_id) REFERENCES visitors(visitor_id),  -- Clé étrangère liant à `visitors`.
    FOREIGN KEY (user_id) REFERENCES users(user_id)  -- Clé étrangère liant à `users`.
);


-- Création de la table `rooms` pour gérer les informations des salles (facultatif).
CREATE TABLE rooms (
    room_id INT PRIMARY KEY AUTO_INCREMENT,  -- Identifiant unique de la salle, incrémenté automatiquement.
    room_name VARCHAR(100) NOT NULL,  -- Nom de la salle ou numéro de la salle.
    room_capacity INT,  -- Capacité de la salle (nombre de personnes).
    location VARCHAR(150),  -- Emplacement de la salle (par exemple, étage, bâtiment).
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP  -- Date d'ajout de la salle.
);

-- Création de la table `logs` pour garder une trace des actions des utilisateurs (facultatif).
CREATE TABLE logs (
    log_id INT PRIMARY KEY AUTO_INCREMENT,  -- Identifiant unique du log, incrémenté automatiquement.
    user_id INT,  -- Référence à l'utilisateur qui a effectué l'action (clé étrangère vers `users`).
    action TEXT,  -- Description de l'action effectuée (ex. "Enregistrement d'une visite").
    log_date DATETIME DEFAULT CURRENT_TIMESTAMP,  -- Date et heure où l'action a été effectuée.
    FOREIGN KEY (user_id) REFERENCES users(user_id)  -- Clé étrangère liant à la table `users`.
);

