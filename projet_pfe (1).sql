-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 17 juil. 2020 à 13:11
-- Version du serveur :  10.4.11-MariaDB
-- Version de PHP : 7.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `projet_pfe`
--

-- --------------------------------------------------------

--
-- Structure de la table `conge`
--

CREATE TABLE `conge` (
  `id` int(11) NOT NULL,
  `id_conge` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `solde_annuel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nbr_jrs_pris` int(11) NOT NULL,
  `nbr_jrs_restant` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `etat_conge` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `approbation_chef` tinyint(1) NOT NULL,
  `approbation_rh` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `demande`
--

CREATE TABLE `demande` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date_demande` date NOT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `type_conge` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fichier_joint` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '(DC2Type:object)',
  `etat` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `demande`
--

INSERT INTO `demande` (`id`, `user_id`, `date_demande`, `date_debut`, `date_fin`, `type_conge`, `fichier_joint`, `etat`) VALUES
(1, 1, '2020-06-25', '2020-07-08', '2020-07-15', 'maladie', 'N;', 'acceptée'),
(2, 1, '2020-06-25', '2020-07-08', '2020-07-15', 'maladie', 'N;', 'acceptée'),
(3, 2, '2020-06-25', '2020-07-08', '2020-07-15', 'maladie', 'N;', 'acceptée');

-- --------------------------------------------------------

--
-- Structure de la table `permission`
--

CREATE TABLE `permission` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `heure_debut` time NOT NULL,
  `heure_fin` time NOT NULL,
  `date_permission` date NOT NULL,
  `etat_permission` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `approbation_chef` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `permission`
--

INSERT INTO `permission` (`id`, `user_id`, `heure_debut`, `heure_fin`, `date_permission`, `etat_permission`, `approbation_chef`) VALUES
(1, 1, '19:38:47', '22:38:47', '2020-07-15', 'valide', 1),
(2, 1, '19:38:47', '22:38:47', '2020-07-15', 'valide', 1),
(3, 3, '19:38:47', '22:38:47', '2020-07-15', 'valide', 1);

-- --------------------------------------------------------

--
-- Structure de la table `projet`
--

CREATE TABLE `projet` (
  `id` int(11) NOT NULL,
  `nom_projet` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_debut_projet` date NOT NULL,
  `date_limite` date NOT NULL,
  `etat_projet` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cin` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `num_tel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fonction` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `solde_annuel` int(11) DEFAULT NULL,
  `nbr_jrs_pris` int(11) DEFAULT NULL,
  `nbr_jrs_restant` int(11) DEFAULT NULL,
  `confirmation_token` varchar(180) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `cin`, `nom`, `prenom`, `num_tel`, `fonction`, `enabled`, `solde_annuel`, `nbr_jrs_pris`, `nbr_jrs_restant`, `confirmation_token`) VALUES
(1, 'farahjbara1@gmail.com', '[\"ROLE_USER\"]', '$argon2i$v=19$m=65536,t=4,p=1$V1pzZzRIM2E4OVlGUnNCaQ$f8mWJcYIRF8xjfaT6rxXM8rz/J0Mr7ba9ROqUd1FVXQ', '11123456', 'jbara', 'farah', '52126358', 'dev', 1, 24, 5, 19, NULL),
(2, 'amirajbara@gmail.com', '[\"ROLE_RH\"]', '$argon2i$v=19$m=65536,t=4,p=1$Z0dmNU5QWXVxWllqY25qTA$uF8y5BT4/cpIXu3b8dQwn/pYF1LFNgTE5TbYxpIVYcU', '14454563', 'jbara', 'Amira', '52126358', 'It', 1, 24, 0, 0, NULL),
(3, 'Nourkamar@gmail.com', '[\"ROLE_RH\"]', '$argon2i$v=19$m=65536,t=4,p=1$UjdMcHFIeENuRXdzOG00dw$YnLECQcn5ryNzQ0WQSkinEMmfjlqd7ReldSBjZNAOH0', '12236664', 'Kamar', 'nour', '51126444', 'RH', 1, 17, 7, -7, NULL),
(4, 'Mohamed@gmail.com', '[\"ROLE_RH\"]', '$argon2i$v=19$m=65536,t=4,p=1$a1EwQWxzSm0wMHp6TWRxUQ$Y+1lWFU/+v4cerpdgCkL7RjnKNOA4LQh4HaeFTuOpgo', '12236664', 'Mohamed', 'Mohamed', '51126444', 'RH', 1, 24, 4, 20, NULL);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `conge`
--
ALTER TABLE `conge`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `demande`
--
ALTER TABLE `demande`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_2694D7A5A76ED395` (`user_id`);

--
-- Index pour la table `permission`
--
ALTER TABLE `permission`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_E04992AAA76ED395` (`user_id`);

--
-- Index pour la table `projet`
--
ALTER TABLE `projet`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`),
  ADD UNIQUE KEY `UNIQ_8D93D649C05FB297` (`confirmation_token`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `conge`
--
ALTER TABLE `conge`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `demande`
--
ALTER TABLE `demande`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `permission`
--
ALTER TABLE `permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `projet`
--
ALTER TABLE `projet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `demande`
--
ALTER TABLE `demande`
  ADD CONSTRAINT `FK_2694D7A5A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `permission`
--
ALTER TABLE `permission`
  ADD CONSTRAINT `FK_E04992AAA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
