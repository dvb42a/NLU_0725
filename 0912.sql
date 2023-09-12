-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2023-09-12 08:31:43
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
('5lcgwlhbzn8s9ldx1njqy59kv0d6bock', 'MjQ2YjJlMzEzZGU0MmZhZWNiMzY0NGZhNmUyMDJlODMzMjgzODEwMjp7ImxvZ2luX25hbWUiOiJhZG1pbiIsImlzX2xvZ2luIjp0cnVlLCJ0b2tlbiI6IjIwMjMwNTEwVDA5MjUwNV9nM1FwMWIzNXBFNFMiLCJfc2Vzc2lvbl9leHBpcnkiOjB9', '2023-09-20 10:06:39.516057'),
('ex4zpurpmfkhcg2bdo38u3021zg5wpzb', 'MjQ2YjJlMzEzZGU0MmZhZWNiMzY0NGZhNmUyMDJlODMzMjgzODEwMjp7ImxvZ2luX25hbWUiOiJhZG1pbiIsImlzX2xvZ2luIjp0cnVlLCJ0b2tlbiI6IjIwMjMwNTEwVDA5MjUwNV9nM1FwMWIzNXBFNFMiLCJfc2Vzc2lvbl9leHBpcnkiOjB9', '2023-09-20 10:33:10.254307'),
('knx2xm2vm7sswyn1p4u5pr3nwjhbwupi', 'MjQ2YjJlMzEzZGU0MmZhZWNiMzY0NGZhNmUyMDJlODMzMjgzODEwMjp7ImxvZ2luX25hbWUiOiJhZG1pbiIsImlzX2xvZ2luIjp0cnVlLCJ0b2tlbiI6IjIwMjMwNTEwVDA5MjUwNV9nM1FwMWIzNXBFNFMiLCJfc2Vzc2lvbl9leHBpcnkiOjB9', '2023-09-15 13:52:07.239444'),
('qyw8fzm8lftlvo9w10pgsoq8t7y3tgl3', 'MjQ2YjJlMzEzZGU0MmZhZWNiMzY0NGZhNmUyMDJlODMzMjgzODEwMjp7ImxvZ2luX25hbWUiOiJhZG1pbiIsImlzX2xvZ2luIjp0cnVlLCJ0b2tlbiI6IjIwMjMwNTEwVDA5MjUwNV9nM1FwMWIzNXBFNFMiLCJfc2Vzc2lvbl9leHBpcnkiOjB9', '2023-09-13 13:22:12.457179'),
('s08a6fx1nbn13g4c917k09hg6m9na116', 'Njk0NjQ5OWM1YTdmMDQ3NzgwZTRkODM4YzIxYzRiMGJkYzU4M2RmYzp7ImxvZ2luX25hbWUiOiJhZG1pbjUxNiIsImlzX2xvZ2luIjp0cnVlLCJ0b2tlbiI6IjIwMjMwODE0VDEwNDQxMl9MeE1VcGZqTjVmS1giLCJsb2dpbl90aW1lIjoxNjk0NDk5OTIyLjAsIl9zZXNzaW9uX2V4cGlyeSI6MH0=', '2023-09-13 14:25:22.947280');

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
('admin516', 'b5112c4664c8fb0c2bc2a55e14ef99431eaf7f66a71793e361e8c28ac0ab188d', '20230814T104412_LxMUpfjN5fKX', 1, 'main_ac', 'tszchun516@gmail.com', '2023-08-14 10:44:12.465423', '2023-09-12 14:25:22.938337', '9999-12-31 00:00:00.000000', 'MjAyMzA4MTQxMDQ0MTK5D6hNs4GO_oSHrIAVqHCZ1KXfNpE5p6tkm41Xe7pg4Q=='),
('chunchuntsz', 'b5112c4664c8fb0c2bc2a55e14ef99431eaf7f66a71793e361e8c28ac0ab188d', '20230821T085143_H7wW1aYKo5gt', 1, 'main_ac', 'tszchun516@gmail.com', '2023-08-21 08:51:43.736358', '2023-08-21 15:50:30.781472', '9999-12-31 00:00:00.000000', 'MjAyMzA4MjEwODUxNDNIhI-ko0OpAsX57hhpmiZvYQ29Ll3XTXYCaGbQBcAepA=='),
('demo', '2a97516c354b68848cdbd8f54a226a0a55b21ed138e207ad6c5cbb9c00aa5aea', '20230709T144321_XwfzK9YKvDub', 1, 'main_ac', 'demo@kingly.com', '2023-07-08 00:45:04.791981', '2023-09-12 14:21:18.805637', '9999-12-31 00:00:00.000000', ''),
('mwt516', '1d18b9209356a63bad5d417d00660e591ac2f549beecb281e597a5753056af96', '20230811T153803_HMqFrBWOduca', 1, 'main_ac', 'tszchun516@gmail.com', '2023-08-11 15:38:03.170122', '2023-09-06 10:48:32.561030', '9999-12-31 00:00:00.000000', 'MjAyMzA4MTExNTM4MDMBdqLnZk6ZX4Nb0W6w7WHuw8ef3mBxIfKRQWHs4c8Fbg=='),
('ray', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', '20230709T143945_3Mx9BBYcrlzq', 1, 'test_ac', 'ray@kingly.com', '2023-07-08 01:28:02.604519', '2023-07-25 10:36:50.757996', '9999-12-31 00:00:00.000000', ''),
('ray1', '96cae35ce8a9b0244178bf28e4966c2ce1b8385723a96a6b838858cdd6ca0a1e', '20230725T104303_RUYxtg4Y1dCy', 1, 'test_ac', 'behappyren@hotmail.com', '2023-07-25 10:43:03.817999', '2023-07-25 10:45:50.483446', '9999-12-31 00:00:00.000000', 'MjAyMzA3MjUxMDQ0NDJ5xKBxmCPx3E9XxNVxCrqqgknsnBl4iddzBwtJrTbafg=='),
('test516', 'fe57377571729a18a771d9f5e0856e656e969ad91860f684a1757bb929d9ffff', '20230814T162149_yUEsk9iq95iQ', 1, 'main_ac', 'tszchun516@gmail.com', '2023-08-14 16:21:49.931035', '2023-08-21 08:39:09.167085', '9999-12-31 00:00:00.000000', 'MjAyMzA4MTQxNjIxNDnio_Dj8HHfAjVnWHR6mI50v_j3ZSxUDRRbQD-_zYGpww==');

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
  `deleted_date` timestamp NULL DEFAULT NULL,
  `train_version` tinyint(2) UNSIGNED NOT NULL DEFAULT 0,
  `deploy_version` tinyint(2) UNSIGNED NOT NULL DEFAULT 0,
  `trained` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `deployed` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `training` tinyint(1) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `kingly_app`
--

INSERT INTO `kingly_app` (`id`, `plan_id`, `ac_id`, `state`, `app_name`, `app_desc`, `app_culture`, `counter`, `created_date`, `last_trained_date`, `last_deployed_date`, `deleted_date`, `train_version`, `deploy_version`, `trained`, `deployed`, `training`) VALUES
(22, '6', 'ray', 1, '111', '111', '中文', 0, '2023-07-12 08:14:27.744615', '2023-07-12 08:48:35.622565', '2023-07-12 08:49:14.000000', NULL, 2, 2, 1, 1, 0),
(37, '20230814ChbgtglNrh2E', 'test516', 1, '343423', '23423423423', '中文', 0, '2023-08-14 16:26:52.435525', NULL, NULL, NULL, 0, 0, 0, 0, 0),
(38, '20230814ChbgtglNrh2E', 'test516', 1, '23423423423', '234234234234', '中文', 0, '2023-08-14 16:26:58.462446', NULL, NULL, NULL, 0, 0, 0, 0, 0),
(40, '20230821RKaA785GLwkz', 'chunchuntsz', 1, 'dewqd', 'qwe1wewq', '中文', 0, '2023-08-21 08:52:32.308469', NULL, NULL, NULL, 0, 0, 0, 0, 0),
(41, '20230811xrneiJywsiTJ', 'demo', 1, '123123', '3213123123123', '中文', 62, '2023-08-23 09:15:54.323427', '2023-08-23 09:33:04.513273', '2023-08-23 09:35:43.000000', NULL, 1, 1, 1, 1, 0),
(45, '20230818VQKKQcUk8m1O', 'admin516', 1, 'test123111', '12312321312', '中文', 0, '2023-08-30 15:10:55.739459', NULL, NULL, NULL, 0, 0, 0, 0, 0),
(46, '20230811xrneiJywsiTJ', 'demo', 1, 'asdew12321', 'deqqwe21dweqweqwe韋畈', '中文', 1, '2023-08-30 15:50:25.682727', '2023-08-30 16:53:56.767560', '2023-08-31 08:31:59.000000', NULL, 2, 2, 1, 1, 0),
(47, '20230818VQKKQcUk8m1O', 'admin516', 0, 'eqeqwe123123', '123123123213', '中文', 0, '2023-08-31 09:28:20.690536', NULL, NULL, '2023-08-31 02:28:28', 0, 0, 0, 0, 0),
(48, '20230818VQKKQcUk8m1O', 'admin516', 1, 'fdierTest23123', '321dw1w312', '中文', 0, '2023-08-31 15:50:08.640013', NULL, NULL, NULL, 0, 0, 0, 0, 0),
(49, '20230906wbwkOJoAO8EE', 'mwt516', 1, 'test_0906', '吸占莓啦立卜', '中文', 1, '2023-09-06 10:10:15.311336', '2023-09-06 10:23:35.494368', '2023-09-06 10:24:14.000000', NULL, 1, 1, 1, 1, 0);

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
(1, 'admin', 'b5112c4664c8fb0c2bc2a55e14ef99431eaf7f66a71793e361e8c28ac0ab188d', 'tszchun516@gmail.com', '20230510T092505_g3Qp1b35pE4S'),
(3, 'test516', 'fe57377571729a18a771d9f5e0856e656e969ad91860f684a1757bb929d9ffff', 'tszchun516@gmail.com', '');

-- --------------------------------------------------------

--
-- 資料表結構 `kingly_bot`
--

CREATE TABLE `kingly_bot` (
  `id` int(255) NOT NULL,
  `app_id` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `serect` varchar(255) NOT NULL,
  `platform` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `kingly_clients_plan`
--

CREATE TABLE `kingly_clients_plan` (
  `id` varchar(20) NOT NULL,
  `ac_id` varchar(50) NOT NULL,
  `order_id` varchar(20) DEFAULT NULL,
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
('202308119dNSd7im0EM5', 'mwt516', NULL, '免費體驗方案', 1, 1, 0, 500, '2023-08-11 15:38:15.732320', '2023-09-10 15:38:15.732320'),
('20230811xrneiJywsiTJ', 'demo', '2023811ayKScjPL', '個人方案', 2, 1, 2, 5000, '2023-08-11 15:31:06.794704', '2024-08-10 15:16:47.000000'),
('20230811xYljoW9C5Eip', 'mwt516', '2023811Gz5nvMun', '個人方案', 2, 1, 2, 5000, '2023-08-11 15:40:27.575204', '2024-08-10 15:38:33.000000'),
('20230814ChbgtglNrh2E', 'test516', '2023814nG4VPpA1', '超值方案', 4, 3, 5, 20000, '2023-08-14 16:25:56.820287', '2024-08-13 16:23:46.000000'),
('20230814O1vYPPQONRR9', 'test516', '2023814h0UJBrRY', '免費體驗方案', 1, 1, 0, 500, '2023-08-14 16:22:02.340353', '2023-09-13 16:22:02.340353'),
('20230814w6aauQUfxB9X', 'admin516', '2023814eomScoet', '免費體驗方案', 1, 1, 0, 500, '2023-08-14 10:46:49.093174', '2023-09-13 10:46:49.093174'),
('202308153NjyzD7I6UjP', 'test516', '2023815SKxoLLgB', '個人方案', 2, 1, 2, 5000, '2023-08-15 13:40:38.032788', '2024-08-14 09:39:40.000000'),
('20230818VQKKQcUk8m1O', 'admin516', '2023818BAlQ3fmA', '超值方案', 4, 3, 5, 20000, '2023-08-18 11:28:03.831763', '2024-08-17 11:27:06.000000'),
('20230821ePAbZ921H6qz', 'chunchuntsz', '2023821is8YlPW3', '國家級方案', 50, 5, 50, 999999, '2023-08-21 15:58:49.819272', '2023-11-19 15:56:05.000000'),
('20230821rJybFL3m8eeR', 'chunchuntsz', '20238215giY9J94', '超值方案', 4, 3, 5, 20000, '2023-08-21 10:41:26.887010', '2024-08-20 10:22:59.000000'),
('20230821RKaA785GLwkz', 'chunchuntsz', '2023821HAsBXLgY', '免費體驗方案', 1, 1, 0, 500, '2023-08-21 08:51:58.742003', '2023-09-20 08:51:58.742003'),
('20230906wbwkOJoAO8EE', 'mwt516', '202396ZJrBorcm', '國家級方案', 50, 5, 50, 999999, '2023-09-06 10:07:56.209305', '2023-12-05 10:05:33.000000');

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
('admin516', '0938475678', '陳小明', '23212', '陳小明', '', '', NULL),
('chunchuntsz', '0928374658', NULL, '92837', '陳小艮', NULL, '', NULL),
('demo', '0984756478', '蘇子竣', '99485', '羅明姎', NULL, '', NULL),
('mwt516', '0938495869', '', '93849', '莫小彤', '非魚子公司', '', '02938495'),
('test516', '0984366760', '蘇子竣', '23221', '蘇子竣', '朽板有限公司', '', '32456756');

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
('20238116SHUfVbz', '23222', '2023-08-11 07:54:54', '2023-08-11 07:55:38', NULL, NULL, 'mwt516', 1, 3, 3000, '莫小彤', '0938777263'),
('2023811ayKScjPL', '48574', '2023-08-11 07:16:47', '2023-08-11 07:29:02', '2023-08-11 07:31:06', '2023-08-11 07:31:06', 'demo', 4, 2, 2000, '羅明姎', '0984756478'),
('2023811Gz5nvMun', '94857', '2023-08-11 07:38:33', '2023-08-11 07:39:22', '2023-08-11 07:40:27', '2023-08-11 07:40:27', 'mwt516', 4, 2, 2000, '莫小彤', '0947568476'),
('2023814eomScoet', NULL, '2023-08-14 02:46:49', NULL, NULL, '2023-08-14 02:46:49', 'admin516', 4, 1, 0, '', NULL),
('2023814h0UJBrRY', NULL, '2023-08-14 08:22:02', NULL, NULL, '2023-08-14 08:22:02', 'test516', 4, 1, 0, '', NULL),
('2023814jbiX7ssJ', '32132', '2023-08-14 07:54:03', '2023-08-14 07:54:23', NULL, NULL, 'admin516', 1, 4, 9000, '蘇子慍', '0983748579'),
('2023814K8EJ5rDB', NULL, '2023-08-14 07:41:12', NULL, NULL, '2023-08-14 07:41:12', 'test516', 4, 1, 0, '', NULL),
('2023814nG4VPpA1', '32123', '2023-08-14 08:23:46', '2023-08-14 08:25:10', '2023-08-14 08:25:56', '2023-08-14 08:25:56', 'test516', 4, 3, 3000, '茵畈油', '0958678987'),
('2023815MDoOJ9Il', NULL, '2023-08-15 01:39:47', NULL, NULL, NULL, 'test516', 0, 2, 2000, '', NULL),
('2023815SKxoLLgB', '32123', '2023-08-15 01:39:40', '2023-08-15 05:23:54', '2023-08-15 05:26:23', '2023-08-15 05:40:38', 'test516', 4, 2, 2000, '蘇油炯', '0982746357'),
('2023815zbjJ3OnN', NULL, '2023-08-15 01:39:56', NULL, NULL, NULL, 'test516', 0, 2, 2000, '', NULL),
('2023818BAlQ3fmA', '23212', '2023-08-18 03:27:06', '2023-08-18 03:27:26', '2023-08-18 03:28:03', '2023-08-18 03:28:03', 'admin516', 4, 3, 3000, '陳小明', '0938475678'),
('2023818P1wXLdZa', '32132', '2023-08-18 02:20:26', '2023-08-18 03:26:52', NULL, NULL, 'admin516', 1, 2, 2000, '蘇子慍', '0983748579'),
('20238215giY9J94', '92837', '2023-08-21 02:22:59', '2023-08-21 02:23:10', '2023-08-21 02:25:16', '2023-08-21 02:41:26', 'chunchuntsz', 4, 3, 3000, '陳小艮', '0928374658'),
('2023821cMtqEaGo', '92837', '2023-08-21 01:52:22', '2023-08-21 02:22:44', NULL, NULL, 'chunchuntsz', 5, 2, 2000, '陳小艮', '0928374658'),
('2023821HAsBXLgY', NULL, '2023-08-21 00:51:58', NULL, NULL, '2023-08-21 00:51:58', 'chunchuntsz', 4, 1, 0, '', ''),
('2023821is8YlPW3', '92837', '2023-08-21 07:56:05', '2023-08-21 07:58:39', '2023-08-21 07:58:49', '2023-08-21 07:58:49', 'chunchuntsz', 4, 8, 500000, '陳小艮', '0928374658'),
('2023821pl0cglrS', NULL, '2023-08-21 07:52:13', NULL, NULL, NULL, 'chunchuntsz', 5, 8, 500000, '', ''),
('202396ZJrBorcm', '93849', '2023-09-06 02:05:33', '2023-09-06 02:06:20', '2023-09-06 02:07:51', '2023-09-06 02:07:56', 'mwt516', 4, 8, 500000, '莫小彤', '0938495869');

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
  `updated_date` datetime(6) DEFAULT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `kingly_plan`
--

INSERT INTO `kingly_plan` (`plan_id`, `plan_name`, `plan_price`, `max_app`, `max_manager`, `max_secondary`, `max_call`, `expiry_date`, `created_date`, `updated_date`, `status`) VALUES
(1, '免費體驗方案', 0, 1, 1, 0, 500, 30, '2023-07-07 13:33:06.000000', NULL, 0),
(2, '個人方案', 2000, 2, 1, 2, 5000, 365, '2023-07-07 13:33:06.000000', NULL, 0),
(3, '超值方案', 3000, 4, 3, 5, 20000, 365, '2023-07-07 13:33:06.000000', NULL, 1),
(4, '企業方案', 9000, 10, 5, 10, 100000, 365, '2023-07-07 13:33:06.000000', NULL, 0),
(8, '國家級方案', 500000, 50, 5, 50, 999999, 90, '2023-08-21 15:23:36.856963', NULL, 0);

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
-- 資料表索引 `kingly_bot`
--
ALTER TABLE `kingly_bot`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `kingly_auth_admin`
--
ALTER TABLE `kingly_auth_admin`
  MODIFY `ac_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `kingly_bot`
--
ALTER TABLE `kingly_bot`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `kingly_plan`
--
ALTER TABLE `kingly_plan`
  MODIFY `plan_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
