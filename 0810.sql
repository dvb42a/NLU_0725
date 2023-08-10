-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2023-08-10 10:38:13
-- 伺服器版本： 10.4.25-MariaDB
-- PHP 版本： 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `nlu`
--

-- --------------------------------------------------------

--
-- 資料表結構 `authtoken_token`
--

CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `auth_permission`
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
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add auth account', 7, 'add_authaccount'),
(26, 'Can change auth account', 7, 'change_authaccount'),
(27, 'Can delete auth account', 7, 'delete_authaccount'),
(28, 'Can view auth account', 7, 'view_authaccount'),
(29, 'Can add auth permission', 8, 'add_authpermission'),
(30, 'Can change auth permission', 8, 'change_authpermission'),
(31, 'Can delete auth permission', 8, 'delete_authpermission'),
(32, 'Can view auth permission', 8, 'view_authpermission'),
(33, 'Can add auth role', 9, 'add_authrole'),
(34, 'Can change auth role', 9, 'change_authrole'),
(35, 'Can delete auth role', 9, 'delete_authrole'),
(36, 'Can view auth role', 9, 'view_authrole'),
(37, 'Can add topic app user', 10, 'add_topicappuser'),
(38, 'Can change topic app user', 10, 'change_topicappuser'),
(39, 'Can delete topic app user', 10, 'delete_topicappuser'),
(40, 'Can view topic app user', 10, 'view_topicappuser'),
(41, 'Can add app', 11, 'add_app'),
(42, 'Can change app', 11, 'change_app'),
(43, 'Can delete app', 11, 'delete_app'),
(44, 'Can view app', 11, 'view_app'),
(45, 'Can add topic app', 12, 'add_topicapp'),
(46, 'Can change topic app', 12, 'change_topicapp'),
(47, 'Can delete topic app', 12, 'delete_topicapp'),
(48, 'Can view topic app', 12, 'view_topicapp'),
(49, 'Can add ans template v2', 13, 'add_anstemplatev2'),
(50, 'Can change ans template v2', 13, 'change_anstemplatev2'),
(51, 'Can delete ans template v2', 13, 'delete_anstemplatev2'),
(52, 'Can view ans template v2', 13, 'view_anstemplatev2'),
(53, 'Can add chit entities', 14, 'add_chitentities'),
(54, 'Can change chit entities', 14, 'change_chitentities'),
(55, 'Can delete chit entities', 14, 'delete_chitentities'),
(56, 'Can view chit entities', 14, 'view_chitentities'),
(57, 'Can add chit entities import log', 15, 'add_chitentitiesimportlog'),
(58, 'Can change chit entities import log', 15, 'change_chitentitiesimportlog'),
(59, 'Can delete chit entities import log', 15, 'delete_chitentitiesimportlog'),
(60, 'Can view chit entities import log', 15, 'view_chitentitiesimportlog'),
(61, 'Can add dialog temp import log', 16, 'add_dialogtempimportlog'),
(62, 'Can change dialog temp import log', 16, 'change_dialogtempimportlog'),
(63, 'Can delete dialog temp import log', 16, 'delete_dialogtempimportlog'),
(64, 'Can view dialog temp import log', 16, 'view_dialogtempimportlog'),
(65, 'Can add dialogue log', 17, 'add_dialoguelog'),
(66, 'Can change dialogue log', 17, 'change_dialoguelog'),
(67, 'Can delete dialogue log', 17, 'delete_dialoguelog'),
(68, 'Can view dialogue log', 17, 'view_dialoguelog'),
(69, 'Can add dialogue log v2', 18, 'add_dialoguelogv2'),
(70, 'Can change dialogue log v2', 18, 'change_dialoguelogv2'),
(71, 'Can delete dialogue log v2', 18, 'delete_dialoguelogv2'),
(72, 'Can view dialogue log v2', 18, 'view_dialoguelogv2'),
(73, 'Can add dialogue status', 19, 'add_dialoguestatus'),
(74, 'Can change dialogue status', 19, 'change_dialoguestatus'),
(75, 'Can delete dialogue status', 19, 'delete_dialoguestatus'),
(76, 'Can view dialogue status', 19, 'view_dialoguestatus'),
(77, 'Can add dialogue template', 20, 'add_dialoguetemplate'),
(78, 'Can change dialogue template', 20, 'change_dialoguetemplate'),
(79, 'Can delete dialogue template', 20, 'delete_dialoguetemplate'),
(80, 'Can view dialogue template', 20, 'view_dialoguetemplate'),
(81, 'Can add dialogue template v2', 21, 'add_dialoguetemplatev2'),
(82, 'Can change dialogue template v2', 21, 'change_dialoguetemplatev2'),
(83, 'Can delete dialogue template v2', 21, 'delete_dialoguetemplatev2'),
(84, 'Can view dialogue template v2', 21, 'view_dialoguetemplatev2'),
(85, 'Can add feedback log', 22, 'add_feedbacklog'),
(86, 'Can change feedback log', 22, 'change_feedbacklog'),
(87, 'Can delete feedback log', 22, 'delete_feedbacklog'),
(88, 'Can view feedback log', 22, 'view_feedbacklog'),
(89, 'Can add skill data', 23, 'add_skilldata'),
(90, 'Can change skill data', 23, 'change_skilldata'),
(91, 'Can delete skill data', 23, 'delete_skilldata'),
(92, 'Can view skill data', 23, 'view_skilldata'),
(93, 'Can add topic temp status', 24, 'add_topictempstatus'),
(94, 'Can change topic temp status', 24, 'change_topictempstatus'),
(95, 'Can delete topic temp status', 24, 'delete_topictempstatus'),
(96, 'Can view topic temp status', 24, 'view_topictempstatus'),
(97, 'Can add total temp count', 25, 'add_totaltempcount'),
(98, 'Can change total temp count', 25, 'change_totaltempcount'),
(99, 'Can delete total temp count', 25, 'delete_totaltempcount'),
(100, 'Can view total temp count', 25, 'view_totaltempcount'),
(101, 'Can add unit data', 26, 'add_unitdata'),
(102, 'Can change unit data', 26, 'change_unitdata'),
(103, 'Can delete unit data', 26, 'delete_unitdata'),
(104, 'Can view unit data', 26, 'view_unitdata'),
(105, 'Can add verb link entity v2', 27, 'add_verblinkentityv2'),
(106, 'Can change verb link entity v2', 27, 'change_verblinkentityv2'),
(107, 'Can delete verb link entity v2', 27, 'delete_verblinkentityv2'),
(108, 'Can view verb link entity v2', 27, 'view_verblinkentityv2'),
(109, 'Can add entity keywords', 28, 'add_entitykeywords'),
(110, 'Can change entity keywords', 28, 'change_entitykeywords'),
(111, 'Can delete entity keywords', 28, 'delete_entitykeywords'),
(112, 'Can view entity keywords', 28, 'view_entitykeywords'),
(113, 'Can add entity relations', 29, 'add_entityrelations'),
(114, 'Can change entity relations', 29, 'change_entityrelations'),
(115, 'Can delete entity relations', 29, 'delete_entityrelations'),
(116, 'Can view entity relations', 29, 'view_entityrelations'),
(117, 'Can add pos type', 30, 'add_postype'),
(118, 'Can change pos type', 30, 'change_postype'),
(119, 'Can delete pos type', 30, 'delete_postype'),
(120, 'Can view pos type', 30, 'view_postype'),
(121, 'Can add Token', 31, 'add_token'),
(122, 'Can change Token', 31, 'change_token'),
(123, 'Can delete Token', 31, 'delete_token'),
(124, 'Can view Token', 31, 'view_token'),
(125, 'Can add token', 32, 'add_tokenproxy'),
(126, 'Can change token', 32, 'change_tokenproxy'),
(127, 'Can delete token', 32, 'delete_tokenproxy'),
(128, 'Can view token', 32, 'view_tokenproxy'),
(129, 'Can add account', 33, 'add_account'),
(130, 'Can change account', 33, 'change_account'),
(131, 'Can delete account', 33, 'delete_account'),
(132, 'Can view account', 33, 'view_account'),
(133, 'Can add main account', 34, 'add_mainaccount'),
(134, 'Can change main account', 34, 'change_mainaccount'),
(135, 'Can delete main account', 34, 'delete_mainaccount'),
(136, 'Can view main account', 34, 'view_mainaccount'),
(137, 'Can add secondary account', 35, 'add_secondaryaccount'),
(138, 'Can change secondary account', 35, 'change_secondaryaccount'),
(139, 'Can delete secondary account', 35, 'delete_secondaryaccount'),
(140, 'Can view secondary account', 35, 'view_secondaryaccount'),
(141, 'Can add plan', 36, 'add_plan'),
(142, 'Can change plan', 36, 'change_plan'),
(143, 'Can delete plan', 36, 'delete_plan'),
(144, 'Can view plan', 36, 'view_plan'),
(145, 'Can add order', 37, 'add_order'),
(146, 'Can change order', 37, 'change_order'),
(147, 'Can delete order', 37, 'delete_order'),
(148, 'Can view order', 37, 'view_order'),
(149, 'Can add apps', 38, 'add_apps'),
(150, 'Can change apps', 38, 'change_apps'),
(151, 'Can delete apps', 38, 'delete_apps'),
(152, 'Can view apps', 38, 'view_apps'),
(153, 'Can add client plan', 39, 'add_clientplan'),
(154, 'Can change client plan', 39, 'change_clientplan'),
(155, 'Can delete client plan', 39, 'delete_clientplan'),
(156, 'Can view client plan', 39, 'view_clientplan');

-- --------------------------------------------------------

--
-- 資料表結構 `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(33, 'Accounts', 'account'),
(7, 'Accounts', 'authaccount'),
(8, 'Accounts', 'authpermission'),
(9, 'Accounts', 'authrole'),
(34, 'Accounts', 'mainaccount'),
(35, 'Accounts', 'secondaryaccount'),
(10, 'Accounts', 'topicappuser'),
(1, 'admin', 'logentry'),
(11, 'app', 'app'),
(12, 'app', 'topicapp'),
(38, 'Apps', 'apps'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(31, 'authtoken', 'token'),
(32, 'authtoken', 'tokenproxy'),
(13, 'ChitBot', 'anstemplatev2'),
(14, 'ChitBot', 'chitentities'),
(15, 'ChitBot', 'chitentitiesimportlog'),
(16, 'ChitBot', 'dialogtempimportlog'),
(17, 'ChitBot', 'dialoguelog'),
(18, 'ChitBot', 'dialoguelogv2'),
(19, 'ChitBot', 'dialoguestatus'),
(20, 'ChitBot', 'dialoguetemplate'),
(21, 'ChitBot', 'dialoguetemplatev2'),
(22, 'ChitBot', 'feedbacklog'),
(23, 'ChitBot', 'skilldata'),
(24, 'ChitBot', 'topictempstatus'),
(25, 'ChitBot', 'totaltempcount'),
(26, 'ChitBot', 'unitdata'),
(27, 'ChitBot', 'verblinkentityv2'),
(39, 'Client', 'clientplan'),
(5, 'contenttypes', 'contenttype'),
(28, 'NLUv3', 'entitykeywords'),
(29, 'NLUv3', 'entityrelations'),
(30, 'NLUv3', 'postype'),
(37, 'Order', 'order'),
(36, 'Plan', 'plan'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- 資料表結構 `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'Accounts', '0001_initial', '2020-12-28 11:36:02.269181'),
(2, 'ChitBot', '0001_initial', '2020-12-28 11:36:05.640223'),
(3, 'NLUv3', '0001_initial', '2020-12-28 11:36:06.421377'),
(4, 'contenttypes', '0001_initial', '2020-12-28 11:36:07.073764'),
(5, 'auth', '0001_initial', '2020-12-28 11:36:15.057153'),
(6, 'admin', '0001_initial', '2020-12-28 11:36:17.406873'),
(7, 'admin', '0002_logentry_remove_auto_add', '2020-12-28 11:36:17.430082'),
(8, 'admin', '0003_logentry_add_action_flag_choices', '2020-12-28 11:36:17.524646'),
(9, 'app', '0001_initial', '2020-12-28 11:36:18.638983'),
(10, 'contenttypes', '0002_remove_content_type_name', '2020-12-28 11:36:19.182558'),
(11, 'auth', '0002_alter_permission_name_max_length', '2020-12-28 11:36:19.973425'),
(12, 'auth', '0003_alter_user_email_max_length', '2020-12-28 11:36:20.856732'),
(13, 'auth', '0004_alter_user_username_opts', '2020-12-28 11:36:20.873325'),
(14, 'auth', '0005_alter_user_last_login_null', '2020-12-28 11:36:21.225556'),
(15, 'auth', '0006_require_contenttypes_0002', '2020-12-28 11:36:21.294114'),
(16, 'auth', '0007_alter_validators_add_error_messages', '2020-12-28 11:36:21.347011'),
(17, 'auth', '0008_alter_user_username_max_length', '2020-12-28 11:36:21.426534'),
(18, 'auth', '0009_alter_user_last_name_max_length', '2020-12-28 11:36:21.669282'),
(19, 'sessions', '0001_initial', '2020-12-28 11:36:22.147000'),
(20, 'auth', '0010_alter_group_name_max_length', '2023-07-07 12:28:13.699629'),
(21, 'auth', '0011_update_proxy_permissions', '2023-07-07 12:28:13.703629'),
(22, 'auth', '0012_alter_user_first_name_max_length', '2023-07-07 12:28:13.719630'),
(23, 'authtoken', '0001_initial', '2023-07-07 12:28:13.753427'),
(24, 'authtoken', '0002_auto_20160226_1747', '2023-07-07 12:28:13.773525'),
(25, 'authtoken', '0003_tokenproxy', '2023-07-07 12:28:13.777550');

-- --------------------------------------------------------

--
-- 資料表結構 `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('0gc4taoyyb3jtpvddcnhr6ze6dtfpcvw', 'ODkwZThhMDIxYzI0YjUyMmI2NWI5ZDI4ZTQ0ZTkyZTVhYjIzZWE2NDp7ImxvZ2luX25hbWUiOiJhZG1pbiIsImlzX2xvZ2luIjp0cnVlLCJ0b2tlbiI6IiIsImxvZ2luX3RpbWUiOjE2OTA3ODUyMzMuMCwiX3Nlc3Npb25fZXhwaXJ5IjowfQ==', '2023-08-14 14:55:56.181366'),
('0wm7dm443z3oqdkmr2dqn54yy0j3lsgc', 'MjQ2YjJlMzEzZGU0MmZhZWNiMzY0NGZhNmUyMDJlODMzMjgzODEwMjp7ImxvZ2luX25hbWUiOiJhZG1pbiIsImlzX2xvZ2luIjp0cnVlLCJ0b2tlbiI6IjIwMjMwNTEwVDA5MjUwNV9nM1FwMWIzNXBFNFMiLCJfc2Vzc2lvbl9leHBpcnkiOjB9', '2023-08-24 11:14:52.374467'),
('2kmc4rtnl5rsv05pt3qrwcvgbj8zhml8', 'Y2Q1MzBlZGE3ZGY2NjdiOWY2OGI4YzBlYWUyYzJmOTI3MTcxMTY0YTp7ImxvZ2luX25hbWUiOiJ0ZXN0NTE2IiwiaXNfbG9naW4iOnRydWUsInRva2VuIjoiMjAyMzA4MTBUMTUwOTU5X3hFRkVmV3ZKbm9zWiIsImxvZ2luX3RpbWUiOjE2OTE2NTU5NTcuMCwiX3Nlc3Npb25fZXhwaXJ5IjowfQ==', '2023-08-11 16:25:57.466706'),
('3ti797n3fk7l8rbo1s0zx7nv5a2iyufe', 'MjQ2YjJlMzEzZGU0MmZhZWNiMzY0NGZhNmUyMDJlODMzMjgzODEwMjp7ImxvZ2luX25hbWUiOiJhZG1pbiIsImlzX2xvZ2luIjp0cnVlLCJ0b2tlbiI6IjIwMjMwNTEwVDA5MjUwNV9nM1FwMWIzNXBFNFMiLCJfc2Vzc2lvbl9leHBpcnkiOjB9', '2023-08-22 08:52:15.270274'),
('7up884hfo6d6hktchfwb3vvs6oyx5beb', 'MjQ2YjJlMzEzZGU0MmZhZWNiMzY0NGZhNmUyMDJlODMzMjgzODEwMjp7ImxvZ2luX25hbWUiOiJhZG1pbiIsImlzX2xvZ2luIjp0cnVlLCJ0b2tlbiI6IjIwMjMwNTEwVDA5MjUwNV9nM1FwMWIzNXBFNFMiLCJfc2Vzc2lvbl9leHBpcnkiOjB9', '2023-08-23 08:04:58.580719'),
('8w7bknycdygjb2z8atqm5dz1ks4pphk0', 'MjQ2YjJlMzEzZGU0MmZhZWNiMzY0NGZhNmUyMDJlODMzMjgzODEwMjp7ImxvZ2luX25hbWUiOiJhZG1pbiIsImlzX2xvZ2luIjp0cnVlLCJ0b2tlbiI6IjIwMjMwNTEwVDA5MjUwNV9nM1FwMWIzNXBFNFMiLCJfc2Vzc2lvbl9leHBpcnkiOjB9', '2023-08-18 08:14:28.007175'),
('ipv23oil913z92azod3kz52gw63i6h1w', 'MjQ2YjJlMzEzZGU0MmZhZWNiMzY0NGZhNmUyMDJlODMzMjgzODEwMjp7ImxvZ2luX25hbWUiOiJhZG1pbiIsImlzX2xvZ2luIjp0cnVlLCJ0b2tlbiI6IjIwMjMwNTEwVDA5MjUwNV9nM1FwMWIzNXBFNFMiLCJfc2Vzc2lvbl9leHBpcnkiOjB9', '2023-08-17 16:47:42.060259'),
('kzrfxgjrpahijhj29p8182qeppmii5h6', 'ZGI3YjliMTRkZWIyNDJjODhhZTMyY2E2MjNlN2YwMmMxODRkZTM2YTp7ImxvZ2luX25hbWUiOiJhZG1pbiIsImlzX2xvZ2luIjp0cnVlLCJ0b2tlbiI6IiIsIl9zZXNzaW9uX2V4cGlyeSI6MH0=', '2023-08-17 15:59:13.941459'),
('owjf8n6rjb2mr60ivai1o1mrtgcly8n2', 'MjQ2YjJlMzEzZGU0MmZhZWNiMzY0NGZhNmUyMDJlODMzMjgzODEwMjp7ImxvZ2luX25hbWUiOiJhZG1pbiIsImlzX2xvZ2luIjp0cnVlLCJ0b2tlbiI6IjIwMjMwNTEwVDA5MjUwNV9nM1FwMWIzNXBFNFMiLCJfc2Vzc2lvbl9leHBpcnkiOjB9', '2023-08-21 11:20:34.536913'),
('rnbvu4004qne7izi4niydgu51943yzzi', 'ZGI3YjliMTRkZWIyNDJjODhhZTMyY2E2MjNlN2YwMmMxODRkZTM2YTp7ImxvZ2luX25hbWUiOiJhZG1pbiIsImlzX2xvZ2luIjp0cnVlLCJ0b2tlbiI6IiIsIl9zZXNzaW9uX2V4cGlyeSI6MH0=', '2023-08-14 15:34:53.076594'),
('vaphpqddu1wzcvsfx1j83ze2mlv68lu9', 'MjQ2YjJlMzEzZGU0MmZhZWNiMzY0NGZhNmUyMDJlODMzMjgzODEwMjp7ImxvZ2luX25hbWUiOiJhZG1pbiIsImlzX2xvZ2luIjp0cnVlLCJ0b2tlbiI6IjIwMjMwNTEwVDA5MjUwNV9nM1FwMWIzNXBFNFMiLCJfc2Vzc2lvbl9leHBpcnkiOjB9', '2023-08-17 17:00:59.581436'),
('wmwliyaz916o5c4mr1it0srtkhqp5vqm', 'MjQ2YjJlMzEzZGU0MmZhZWNiMzY0NGZhNmUyMDJlODMzMjgzODEwMjp7ImxvZ2luX25hbWUiOiJhZG1pbiIsImlzX2xvZ2luIjp0cnVlLCJ0b2tlbiI6IjIwMjMwNTEwVDA5MjUwNV9nM1FwMWIzNXBFNFMiLCJfc2Vzc2lvbl9leHBpcnkiOjB9', '2023-08-21 11:22:23.800795');

-- --------------------------------------------------------

--
-- 資料表結構 `kingly_account`
--

CREATE TABLE `kingly_account` (
  `ac_name` varchar(50) NOT NULL,
  `ac_pwd` char(64) NOT NULL,
  `ac_token` char(28) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT 1,
  `role` varchar(20) NOT NULL,
  `email` text NOT NULL,
  `ac_join_date` datetime(6) NOT NULL,
  `ac_last_login` datetime(6) DEFAULT NULL,
  `ac_rm_date` datetime(6) NOT NULL,
  `verify_token` char(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `kingly_account`
--

INSERT INTO `kingly_account` (`ac_name`, `ac_pwd`, `ac_token`, `state`, `role`, `email`, `ac_join_date`, `ac_last_login`, `ac_rm_date`, `verify_token`) VALUES
('admin516', '1d18b9209356a63bad5d417d00660e591ac2f549beecb281e597a5753056af96', '20230731T110645_6ToGlVDmNvKf', 1, 'test_ac', 'tszchun516@gmail.com', '2023-07-31 11:06:45.314724', '2023-08-10 15:40:13.313746', '9999-12-31 00:00:00.000000', 'MjAyMzA3MzExMTA2NDXuekhrXr88YJhgNGKHWrDzRqQFhBdaWddpoVcAYMnobA=='),
('demo', '2a97516c354b68848cdbd8f54a226a0a55b21ed138e207ad6c5cbb9c00aa5aea', '20230709T144321_XwfzK9YKvDub', 1, 'main_ac', 'demo@kingly.com', '2023-07-08 00:45:04.791981', '2023-08-10 14:55:49.119642', '9999-12-31 00:00:00.000000', ''),
('ray', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', '20230709T143945_3Mx9BBYcrlzq', 1, 'test_ac', 'ray@kingly.com', '2023-07-08 01:28:02.604519', '2023-07-25 10:36:50.757996', '9999-12-31 00:00:00.000000', ''),
('ray1', '96cae35ce8a9b0244178bf28e4966c2ce1b8385723a96a6b838858cdd6ca0a1e', '20230725T104303_RUYxtg4Y1dCy', 1, 'test_ac', 'behappyren@hotmail.com', '2023-07-25 10:43:03.817999', '2023-07-25 10:45:50.483446', '9999-12-31 00:00:00.000000', 'MjAyMzA3MjUxMDQ0NDJ5xKBxmCPx3E9XxNVxCrqqgknsnBl4iddzBwtJrTbafg=='),
('test516', '1d18b9209356a63bad5d417d00660e591ac2f549beecb281e597a5753056af96', '20230810T150959_xEFEfWvJnosZ', 1, 'main_ac', 'tszchun516@kinglyrobot.com', '2023-08-10 15:09:59.150262', '2023-08-10 16:25:57.459412', '9999-12-31 00:00:00.000000', 'MjAyMzA4MTAxNTA5NTkj5CH1F72LgQyoDstqL5z8w36yCsgn9TIYfLuRCnw9OA==');

-- --------------------------------------------------------

--
-- 資料表結構 `kingly_app`
--

CREATE TABLE `kingly_app` (
  `id` int(8) NOT NULL,
  `plan_id` varchar(50) NOT NULL,
  `ac_id` varchar(50) NOT NULL,
  `state` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `app_name` varchar(50) NOT NULL,
  `app_desc` text DEFAULT NULL,
  `app_culture` varchar(50) NOT NULL,
  `counter` int(6) UNSIGNED NOT NULL DEFAULT 0,
  `created_date` datetime(6) NOT NULL,
  `last_trained_date` datetime(6) DEFAULT NULL,
  `last_deployed_date` datetime(6) DEFAULT NULL,
  `train_version` tinyint(2) UNSIGNED NOT NULL DEFAULT 0,
  `deploy_version` tinyint(2) UNSIGNED NOT NULL DEFAULT 0,
  `trained` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `deployed` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `training` tinyint(1) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `kingly_app`
--

INSERT INTO `kingly_app` (`id`, `plan_id`, `ac_id`, `state`, `app_name`, `app_desc`, `app_culture`, `counter`, `created_date`, `last_trained_date`, `last_deployed_date`, `train_version`, `deploy_version`, `trained`, `deployed`, `training`) VALUES
(6, '20230808ZzR7GXSON5oT', 'demo', 0, '321', '333', '中文', 2, '2023-07-10 07:47:09.399164', '2023-07-12 08:27:11.891609', '2023-07-12 08:31:24.000000', 2, 2, 1, 1, 0),
(22, '6', 'ray', 0, '111', '111', '中文', 0, '2023-07-12 08:14:27.744615', '2023-07-12 08:48:35.622565', '2023-07-12 08:49:14.000000', 2, 2, 1, 1, 0),
(31, '20230809JSs2IagTAotE', 'admin516', 0, '342312312312', '12312312312', '中文', 0, '2023-08-10 14:51:42.459802', NULL, NULL, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- 資料表結構 `kingly_auth_admin`
--

CREATE TABLE `kingly_auth_admin` (
  `ac_id` int(11) NOT NULL,
  `ac_name` varchar(30) NOT NULL,
  `ac_pwd` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL,
  `ac_token` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `kingly_auth_admin`
--

INSERT INTO `kingly_auth_admin` (`ac_id`, `ac_name`, `ac_pwd`, `email`, `ac_token`) VALUES
(1, 'admin', '1d18b9209356a63bad5d417d00660e591ac2f549beecb281e597a5753056af96', 'tszchun516@gmail.com', '20230510T092505_g3Qp1b35pE4S');

-- --------------------------------------------------------

--
-- 資料表結構 `kingly_clients_plan`
--

CREATE TABLE `kingly_clients_plan` (
  `id` varchar(20) NOT NULL,
  `ac_id` varchar(50) NOT NULL,
  `order_id` varchar(20) NOT NULL,
  `plan_name` varchar(50) NOT NULL,
  `max_app` tinyint(2) UNSIGNED NOT NULL DEFAULT 0,
  `max_manager` tinyint(2) UNSIGNED NOT NULL DEFAULT 0,
  `max_secondary` tinyint(2) UNSIGNED NOT NULL DEFAULT 0,
  `max_call` int(6) UNSIGNED NOT NULL DEFAULT 0,
  `plan_start` datetime(6) DEFAULT NULL,
  `plan_end` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `kingly_clients_plan`
--

INSERT INTO `kingly_clients_plan` (`id`, `ac_id`, `order_id`, `plan_name`, `max_app`, `max_manager`, `max_secondary`, `max_call`, `plan_start`, `plan_end`) VALUES
('20230808eeXbH8xGS2hB', 'admin516', '202388CsfaI1dC', '企業方案', 10, 5, 10, 100000, '2023-08-08 15:33:47.296064', '2023-09-02 15:33:47.296064'),
('20230808ZzR7GXSON5oT', 'demo', '202388GSbG5Ydu', '個人方案', 2, 1, 2, 5000, '2023-08-08 14:00:26.854624', '2024-05-07 11:34:12.000000'),
('20230809JSs2IagTAotE', 'admin516', '2023895aEs0b89', '超值方案', 4, 3, 5, 20000, '2023-08-09 16:32:59.540716', '2024-08-08 16:29:33.000000'),
('20230810aOpaJ2mQtB3a', 'admin516', '2023810utnPc0Lu', '個人方案', 2, 1, 2, 5000, '2023-08-10 14:51:21.850875', '2024-08-09 14:48:31.000000'),
('20230810wDlmltlwSHML', 'test516', '20238106yQcGYrY', '個人方案', 2, 1, 2, 5000, '2023-08-10 16:19:25.976615', '2024-08-09 15:13:54.000000');

-- --------------------------------------------------------

--
-- 資料表結構 `kingly_main_ac`
--

CREATE TABLE `kingly_main_ac` (
  `ac_id` varchar(50) NOT NULL,
  `phone_number` char(10) DEFAULT NULL,
  `real_name` varchar(50) DEFAULT NULL,
  `bank_account` char(5) DEFAULT NULL,
  `transfer_name` varchar(50) DEFAULT NULL,
  `company_name` varchar(50) DEFAULT NULL,
  `company_address` text DEFAULT NULL,
  `tax_number` char(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `kingly_main_ac`
--

INSERT INTO `kingly_main_ac` (`ac_id`, `phone_number`, `real_name`, `bank_account`, `transfer_name`, `company_name`, `company_address`, `tax_number`) VALUES
('test516', '0928374635', NULL, '23221', '蘇子竣', NULL, '', NULL);

-- --------------------------------------------------------

--
-- 資料表結構 `kingly_order`
--

CREATE TABLE `kingly_order` (
  `order_no` varchar(20) NOT NULL,
  `bankaccount` varchar(20) DEFAULT NULL,
  `order_time` timestamp NULL DEFAULT NULL,
  `client_submit_time` timestamp NULL DEFAULT NULL,
  `pay_time` timestamp NULL DEFAULT NULL,
  `sucess_time` timestamp NULL DEFAULT NULL,
  `ac_id` varchar(50) NOT NULL,
  `status` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `price` int(10) NOT NULL,
  `name` varchar(10) DEFAULT NULL,
  `phone_number` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `kingly_order`
--

INSERT INTO `kingly_order` (`order_no`, `bankaccount`, `order_time`, `client_submit_time`, `pay_time`, `sucess_time`, `ac_id`, `status`, `plan_id`, `price`, `name`, `phone_number`) VALUES
('20238106yQcGYrY', '23221', '2023-08-10 07:13:54', '2023-08-10 08:03:57', '2023-08-10 08:19:25', '2023-08-10 08:19:25', 'test516', 4, 2, 2000, '蘇子竣', '928374635'),
('2023810lfXK4YlP', NULL, '2023-08-10 03:01:39', NULL, NULL, NULL, 'demo', 0, 2, 2000, NULL, NULL),
('2023810utnPc0Lu', '34322', '2023-08-10 06:48:31', '2023-08-10 06:49:48', '2023-08-10 06:51:17', '2023-08-10 06:51:21', 'admin516', 4, 2, 2000, '蘇子竣', '983746578'),
('2023828xvtLpJx', '32321', '2023-08-02 07:26:48', NULL, NULL, NULL, 'demo', 5, 3, 3000, '', ''),
('202382L6sWA65q', '32122', '2023-08-02 07:40:13', '2023-08-07 01:12:54', NULL, NULL, 'demo', 0, 4, 9000, '波點', '938475869'),
('202384f7BbfkSL', '86763', '2023-08-04 03:21:29', '2023-08-07 05:12:06', NULL, NULL, 'demo', 5, 3, 3000, '波點', '984738598'),
('202387cKhYJOj0', '32434', '2023-08-07 06:29:19', '2023-08-08 00:59:01', '2023-08-08 02:26:57', '2023-08-08 02:26:57', 'demo', 4, 4, 9000, '蘇波點', '98384758'),
('202388CsfaI1dC', '92833', '2023-08-08 07:32:56', '2023-08-08 07:33:25', '2023-08-08 07:33:43', '2023-08-08 07:33:47', 'admin516', 4, 4, 9000, '莫小彤', '983748938'),
('202388GSbG5Ydu', '92837', '2023-08-08 03:34:12', '2023-08-08 03:34:33', '2023-08-08 05:22:27', '2023-08-08 06:00:26', 'demo', 4, 2, 2000, '蘇波點', '928374829'),
('2023895aEs0b89', '94831', '2023-08-09 08:29:33', '2023-08-09 08:30:24', '2023-08-09 08:32:12', '2023-08-09 08:32:59', 'admin516', 4, 3, 3000, '蘇波點', '983746578');

-- --------------------------------------------------------

--
-- 資料表結構 `kingly_plan`
--

CREATE TABLE `kingly_plan` (
  `plan_id` int(8) NOT NULL,
  `plan_name` varchar(50) NOT NULL,
  `plan_price` int(6) UNSIGNED NOT NULL DEFAULT 0,
  `max_app` tinyint(2) UNSIGNED NOT NULL DEFAULT 0,
  `max_manager` tinyint(2) UNSIGNED NOT NULL DEFAULT 0,
  `max_secondary` tinyint(2) UNSIGNED NOT NULL DEFAULT 0,
  `max_call` int(6) UNSIGNED NOT NULL DEFAULT 0,
  `expiry_date` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `created_date` datetime(6) DEFAULT NULL,
  `updated_date` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `kingly_plan`
--

INSERT INTO `kingly_plan` (`plan_id`, `plan_name`, `plan_price`, `max_app`, `max_manager`, `max_secondary`, `max_call`, `expiry_date`, `created_date`, `updated_date`) VALUES
(1, '免費體驗方案', 0, 1, 1, 0, 500, 30, '2023-07-07 13:33:06.000000', NULL),
(2, '個人方案', 2000, 2, 1, 2, 5000, 365, '2023-07-07 13:33:06.000000', NULL),
(3, '超值方案', 3000, 4, 3, 5, 20000, 365, '2023-07-07 13:33:06.000000', NULL),
(4, '企業方案', 9000, 10, 5, 10, 100000, 365, '2023-07-07 13:33:06.000000', NULL);

-- --------------------------------------------------------

--
-- 資料表結構 `kingly_sec_ac`
--

CREATE TABLE `kingly_sec_ac` (
  `ac_id` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `main` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `authtoken_token`
--
ALTER TABLE `authtoken_token`
  ADD PRIMARY KEY (`key`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- 資料表索引 `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- 資料表索引 `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- 資料表索引 `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- 資料表索引 `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- 資料表索引 `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- 資料表索引 `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- 資料表索引 `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- 資料表索引 `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- 資料表索引 `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- 資料表索引 `kingly_account`
--
ALTER TABLE `kingly_account`
  ADD PRIMARY KEY (`ac_name`) USING BTREE;

--
-- 資料表索引 `kingly_app`
--
ALTER TABLE `kingly_app`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `kingly_auth_admin`
--
ALTER TABLE `kingly_auth_admin`
  ADD PRIMARY KEY (`ac_id`);

--
-- 資料表索引 `kingly_clients_plan`
--
ALTER TABLE `kingly_clients_plan`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `kingly_main_ac`
--
ALTER TABLE `kingly_main_ac`
  ADD PRIMARY KEY (`ac_id`);

--
-- 資料表索引 `kingly_order`
--
ALTER TABLE `kingly_order`
  ADD PRIMARY KEY (`order_no`);

--
-- 資料表索引 `kingly_plan`
--
ALTER TABLE `kingly_plan`
  ADD PRIMARY KEY (`plan_id`) USING BTREE;

--
-- 資料表索引 `kingly_sec_ac`
--
ALTER TABLE `kingly_sec_ac`
  ADD PRIMARY KEY (`ac_id`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `kingly_app`
--
ALTER TABLE `kingly_app`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `kingly_auth_admin`
--
ALTER TABLE `kingly_auth_admin`
  MODIFY `ac_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `kingly_plan`
--
ALTER TABLE `kingly_plan`
  MODIFY `plan_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `authtoken_token`
--
ALTER TABLE `authtoken_token`
  ADD CONSTRAINT `authtoken_token_user_id_35299eff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- 資料表的限制式 `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- 資料表的限制式 `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- 資料表的限制式 `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- 資料表的限制式 `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- 資料表的限制式 `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
