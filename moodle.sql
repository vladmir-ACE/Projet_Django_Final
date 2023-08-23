-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 23 août 2023 à 19:21
-- Version du serveur : 10.4.25-MariaDB
-- Version de PHP : 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `moodle`
--

-- --------------------------------------------------------

--
-- Structure de la table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add user', 6, 'add_user'),
(22, 'Can change user', 6, 'change_user'),
(23, 'Can delete user', 6, 'delete_user'),
(24, 'Can view user', 6, 'view_user'),
(25, 'Can add tache', 7, 'add_tache'),
(26, 'Can change tache', 7, 'change_tache'),
(27, 'Can delete tache', 7, 'delete_tache'),
(28, 'Can view tache', 7, 'view_tache');

-- --------------------------------------------------------

--
-- Structure de la table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'contenttypes', 'contenttype'),
(7, 'projet', 'tache'),
(6, 'projet', 'user'),
(5, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Structure de la table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-07-17 09:29:01.231737'),
(2, 'contenttypes', '0002_remove_content_type_name', '2023-07-17 09:29:01.395841'),
(3, 'auth', '0001_initial', '2023-07-17 09:29:02.009029'),
(4, 'auth', '0002_alter_permission_name_max_length', '2023-07-17 09:29:02.151884'),
(5, 'auth', '0003_alter_user_email_max_length', '2023-07-17 09:29:02.163852'),
(6, 'auth', '0004_alter_user_username_opts', '2023-07-17 09:29:02.177245'),
(7, 'auth', '0005_alter_user_last_login_null', '2023-07-17 09:29:02.190950'),
(8, 'auth', '0006_require_contenttypes_0002', '2023-07-17 09:29:02.193939'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2023-07-17 09:29:02.205803'),
(10, 'auth', '0008_alter_user_username_max_length', '2023-07-17 09:29:02.212868'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2023-07-17 09:29:02.227795'),
(12, 'auth', '0010_alter_group_name_max_length', '2023-07-17 09:29:02.257714'),
(13, 'auth', '0011_update_proxy_permissions', '2023-07-17 09:29:02.270681'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2023-07-17 09:29:02.277680'),
(15, 'projet', '0001_initial', '2023-07-17 09:29:03.006632'),
(16, 'admin', '0001_initial', '2023-07-17 09:29:03.327782'),
(17, 'admin', '0002_logentry_remove_auto_add', '2023-07-17 09:29:03.351717'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2023-07-17 09:29:03.374657'),
(19, 'sessions', '0001_initial', '2023-07-17 09:29:03.455313'),
(20, 'projet', '0002_tache', '2023-08-22 18:56:25.497152'),
(21, 'projet', '0003_alter_user_numero', '2023-08-23 16:24:32.811702');

-- --------------------------------------------------------

--
-- Structure de la table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('ntmp0mh15bazv6b9cnn1cpzm6kz8ki9h', '.eJxVjMsOwiAQRf-FtSFAGR4u3fsNBGZAqoYmpV0Z_11JutDdzT0n58VC3Lca9p7XMBM7M81Ov1-K-MhtALrHdls4Lm1b58SHwg_a-XWh_Lwc7l-gxl5HFqz0qZRiClGxDpw3Gi04M2VAj1mAVCr7BAKdkjRh1Po7hRBR6uLZ-wPkUzeF:1qYqlb:wekV2evFDN19uLYq0Zq3M0tBeyc9j2VvPgfBqQD1Sfo', '2023-09-06 16:31:35.884236');

-- --------------------------------------------------------

--
-- Structure de la table `projet_tache`
--

CREATE TABLE `projet_tache` (
  `id` bigint(20) NOT NULL,
  `intituler` varchar(255) NOT NULL,
  `matiere` varchar(255) NOT NULL,
  `projet` varchar(100) NOT NULL,
  `statut` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `projet_tache`
--

INSERT INTO `projet_tache` (`id`, `intituler`, `matiere`, `projet`, `statut`) VALUES
(1, 'projetFinal', 'Django', 'projet_pdfs/IPNET_EXPERT_PROJET_2022-2023.pdf', 'en cours'),
(3, 'tp1', 'PHP', 'projet_pdfs/IPNET_-_CSC_242_-_2021_2022_-_AYENA_Adébayor.pdf', 'en cours'),
(4, 'TP2', 'Symfony', 'projet_pdfs/IT211_Dev_Appli_Python.pptx', 'en cours'),
(5, 'tp3', 'Api', 'projet_pdfs/fastapi_tutorial_2.pdf', 'en cours');

-- --------------------------------------------------------

--
-- Structure de la table `projet_user`
--

CREATE TABLE `projet_user` (
  `id` bigint(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `role` varchar(255) NOT NULL,
  `date_naissance` date NOT NULL,
  `numero` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `projet_user`
--

INSERT INTO `projet_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `role`, `date_naissance`, `numero`) VALUES
(1, 'pbkdf2_sha256$600000$Axqxum9yYad6GJIGm8Rfra$o3mKfna5OaXYnc+P9G4oRMNDkfap6AbapxcZcRupsa4=', '2023-08-18 08:41:29.999739', 0, 'Kingvlad', 'vlad', 'King', '', 0, 1, '2023-07-18 14:58:04.831551', 'master', '2004-04-28', 1),
(3, 'pbkdf2_sha256$600000$LgKxwN2xp9tAGOO7m3xpmk$gFK1tGLCSHROQ1hFwsNHNP6gy4IG/UwKilIjEs0l5rc=', '2023-07-18 19:37:40.690617', 0, 'afi', 'kodjo', 'afi', '', 0, 1, '2023-07-18 19:37:31.194130', 'enseignant', '2023-07-19', 3),
(4, 'pbkdf2_sha256$600000$XEqHCIr1xDG4NJPiCySmzB$hazywwFlbjub/UBCFIDDnITCy/61fD80YprKUOlUmls=', '2023-08-23 16:31:35.877064', 0, 'ProfAyena', 'Adebayor', 'Ayena', '', 0, 1, '2023-08-18 09:45:01.739379', 'enseignant', '2004-08-18', 30),
(5, 'pbkdf2_sha256$600000$S4dE9HVNo0xwjsLaxvGhIL$kUULhKHkjy7E93tVQaTKUIUmi5f7SOI7liPlKPogx7A=', '2023-08-23 14:15:05.912833', 0, 'kaido', 'kaido', 'kingVlad', '', 0, 1, '2023-08-22 21:11:42.373788', 'etudiant', '2003-08-18', 12),
(6, 'pbkdf2_sha256$600000$oESJoK8bI9H8TtKoBWmy4V$GBLccUsjfdMxp319K+Fx7TbsPEbUN7W1G4GgBhc0ebY=', NULL, 0, 'kingMe', 'zoro', 'kingAdmin', '', 0, 1, '2023-08-23 14:09:55.729746', 'etudiant', '2000-08-18', 30),
(7, 'pbkdf2_sha256$600000$nGltHiaNva4TRXhuwcvci0$0Ng2oYY5Beqtfazxu4sWxTlzb3bh1cRFWp3MEn4yzig=', '2023-08-23 15:59:12.038209', 0, 'AdminTest', 'test2', 'Admin', '', 0, 1, '2023-08-23 14:11:10.036471', 'admin', '2000-08-18', 30),
(8, 'pbkdf2_sha256$600000$SrBd6sR7IjTC2xFgfCof72$VBsEUKhcgQMWz47c/hH1ZZvTLq+oqeQuFFr/0OqJGrI=', '2023-08-23 14:16:14.888086', 0, 'admin2004', 'test', 'admin', '', 0, 1, '2023-08-23 14:16:07.136237', 'admin', '2000-08-18', 10),
(9, 'pbkdf2_sha256$600000$zCGnvYLc5oXN0u99joG6tt$uEZakeTryHUyTjXfzjgT2uRRGOCvj64XAzv/oP4PmQQ=', '2023-08-23 16:30:38.299520', 1, 'vladking', '', '', 'vlad@gmail.com', 1, 1, '2023-08-23 16:29:16.029499', '', '2023-08-23', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `projet_user_groups`
--

CREATE TABLE `projet_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `projet_user_user_permissions`
--

CREATE TABLE `projet_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Index pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Index pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Index pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_projet_user_id` (`user_id`);

--
-- Index pour la table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Index pour la table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Index pour la table `projet_tache`
--
ALTER TABLE `projet_tache`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `projet_user`
--
ALTER TABLE `projet_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Index pour la table `projet_user_groups`
--
ALTER TABLE `projet_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `projet_user_groups_user_id_group_id_d7f9030e_uniq` (`user_id`,`group_id`),
  ADD KEY `projet_user_groups_group_id_248d00f2_fk_auth_group_id` (`group_id`);

--
-- Index pour la table `projet_user_user_permissions`
--
ALTER TABLE `projet_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `projet_user_user_permissions_user_id_permission_id_e7b90964_uniq` (`user_id`,`permission_id`),
  ADD KEY `projet_user_user_per_permission_id_8699d645_fk_auth_perm` (`permission_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT pour la table `projet_tache`
--
ALTER TABLE `projet_tache`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `projet_user`
--
ALTER TABLE `projet_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `projet_user_groups`
--
ALTER TABLE `projet_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `projet_user_user_permissions`
--
ALTER TABLE `projet_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Contraintes pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Contraintes pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_projet_user_id` FOREIGN KEY (`user_id`) REFERENCES `projet_user` (`id`);

--
-- Contraintes pour la table `projet_user_groups`
--
ALTER TABLE `projet_user_groups`
  ADD CONSTRAINT `projet_user_groups_group_id_248d00f2_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `projet_user_groups_user_id_3e2e9a2d_fk_projet_user_id` FOREIGN KEY (`user_id`) REFERENCES `projet_user` (`id`);

--
-- Contraintes pour la table `projet_user_user_permissions`
--
ALTER TABLE `projet_user_user_permissions`
  ADD CONSTRAINT `projet_user_user_per_permission_id_8699d645_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `projet_user_user_permissions_user_id_f6e0d48b_fk_projet_user_id` FOREIGN KEY (`user_id`) REFERENCES `projet_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
