-- phpMyAdmin SQL Dump
-- version 4.6.6deb4
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Время создания: Янв 24 2020 г., 21:35
-- Версия сервера: 10.4.11-MariaDB-1:10.4.11+maria~stretch
-- Версия PHP: 7.0.33-0+deb9u6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `podcasts_parser`
--

-- --------------------------------------------------------

--
-- Структура таблицы `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `auth_permission`
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
(25, 'Can add auth group', 7, 'add_authgroup'),
(26, 'Can change auth group', 7, 'change_authgroup'),
(27, 'Can delete auth group', 7, 'delete_authgroup'),
(28, 'Can view auth group', 7, 'view_authgroup'),
(29, 'Can add auth group permissions', 8, 'add_authgrouppermissions'),
(30, 'Can change auth group permissions', 8, 'change_authgrouppermissions'),
(31, 'Can delete auth group permissions', 8, 'delete_authgrouppermissions'),
(32, 'Can view auth group permissions', 8, 'view_authgrouppermissions'),
(33, 'Can add auth permission', 9, 'add_authpermission'),
(34, 'Can change auth permission', 9, 'change_authpermission'),
(35, 'Can delete auth permission', 9, 'delete_authpermission'),
(36, 'Can view auth permission', 9, 'view_authpermission'),
(37, 'Can add auth user', 10, 'add_authuser'),
(38, 'Can change auth user', 10, 'change_authuser'),
(39, 'Can delete auth user', 10, 'delete_authuser'),
(40, 'Can view auth user', 10, 'view_authuser'),
(41, 'Can add auth user groups', 11, 'add_authusergroups'),
(42, 'Can change auth user groups', 11, 'change_authusergroups'),
(43, 'Can delete auth user groups', 11, 'delete_authusergroups'),
(44, 'Can view auth user groups', 11, 'view_authusergroups'),
(45, 'Can add auth user user permissions', 12, 'add_authuseruserpermissions'),
(46, 'Can change auth user user permissions', 12, 'change_authuseruserpermissions'),
(47, 'Can delete auth user user permissions', 12, 'delete_authuseruserpermissions'),
(48, 'Can view auth user user permissions', 12, 'view_authuseruserpermissions'),
(49, 'Can add categorys', 13, 'add_categorys'),
(50, 'Can change categorys', 13, 'change_categorys'),
(51, 'Can delete categorys', 13, 'delete_categorys'),
(52, 'Can view categorys', 13, 'view_categorys'),
(53, 'Can add cat item', 14, 'add_catitem'),
(54, 'Can change cat item', 14, 'change_catitem'),
(55, 'Can delete cat item', 14, 'delete_catitem'),
(56, 'Can view cat item', 14, 'view_catitem'),
(57, 'Can add django admin log', 15, 'add_djangoadminlog'),
(58, 'Can change django admin log', 15, 'change_djangoadminlog'),
(59, 'Can delete django admin log', 15, 'delete_djangoadminlog'),
(60, 'Can view django admin log', 15, 'view_djangoadminlog'),
(61, 'Can add django content type', 16, 'add_djangocontenttype'),
(62, 'Can change django content type', 16, 'change_djangocontenttype'),
(63, 'Can delete django content type', 16, 'delete_djangocontenttype'),
(64, 'Can view django content type', 16, 'view_djangocontenttype'),
(65, 'Can add django migrations', 17, 'add_djangomigrations'),
(66, 'Can change django migrations', 17, 'change_djangomigrations'),
(67, 'Can delete django migrations', 17, 'delete_djangomigrations'),
(68, 'Can view django migrations', 17, 'view_djangomigrations'),
(69, 'Can add django session', 18, 'add_djangosession'),
(70, 'Can change django session', 18, 'change_djangosession'),
(71, 'Can delete django session', 18, 'delete_djangosession'),
(72, 'Can view django session', 18, 'view_djangosession'),
(73, 'Can add error links', 19, 'add_errorlinks'),
(74, 'Can change error links', 19, 'change_errorlinks'),
(75, 'Can delete error links', 19, 'delete_errorlinks'),
(76, 'Can view error links', 19, 'view_errorlinks'),
(77, 'Can add items', 20, 'add_items'),
(78, 'Can change items', 20, 'change_items'),
(79, 'Can delete items', 20, 'delete_items'),
(80, 'Can view items', 20, 'view_items'),
(81, 'Can add items with keywords', 21, 'add_itemswithkeywords'),
(82, 'Can change items with keywords', 21, 'change_itemswithkeywords'),
(83, 'Can delete items with keywords', 21, 'delete_itemswithkeywords'),
(84, 'Can view items with keywords', 21, 'view_itemswithkeywords'),
(85, 'Can add keywords', 22, 'add_keywords'),
(86, 'Can change keywords', 22, 'change_keywords'),
(87, 'Can delete keywords', 22, 'delete_keywords'),
(88, 'Can view keywords', 22, 'view_keywords'),
(89, 'Can add keywords items', 23, 'add_keywordsitems'),
(90, 'Can change keywords items', 23, 'change_keywordsitems'),
(91, 'Can delete keywords items', 23, 'delete_keywordsitems'),
(92, 'Can view keywords items', 23, 'view_keywordsitems'),
(93, 'Can add podcasts', 24, 'add_podcasts'),
(94, 'Can change podcasts', 24, 'change_podcasts'),
(95, 'Can delete podcasts', 24, 'delete_podcasts'),
(96, 'Can view podcasts', 24, 'view_podcasts'),
(97, 'Can add podcasts with categorys', 25, 'add_podcastswithcategorys'),
(98, 'Can change podcasts with categorys', 25, 'change_podcastswithcategorys'),
(99, 'Can delete podcasts with categorys', 25, 'delete_podcastswithcategorys'),
(100, 'Can view podcasts with categorys', 25, 'view_podcastswithcategorys'),
(101, 'Can add podcasts with keywords', 26, 'add_podcastswithkeywords'),
(102, 'Can change podcasts with keywords', 26, 'change_podcastswithkeywords'),
(103, 'Can delete podcasts with keywords', 26, 'delete_podcastswithkeywords'),
(104, 'Can view podcasts with keywords', 26, 'view_podcastswithkeywords'),
(105, 'Can add subcat item', 27, 'add_subcatitem'),
(106, 'Can change subcat item', 27, 'change_subcatitem'),
(107, 'Can delete subcat item', 27, 'delete_subcatitem'),
(108, 'Can view subcat item', 27, 'view_subcatitem'),
(109, 'Can add subcat podcast', 28, 'add_subcatpodcast'),
(110, 'Can change subcat podcast', 28, 'change_subcatpodcast'),
(111, 'Can delete subcat podcast', 28, 'delete_subcatpodcast'),
(112, 'Can view subcat podcast', 28, 'view_subcatpodcast'),
(113, 'Can add url podcasts', 29, 'add_urlpodcasts'),
(114, 'Can change url podcasts', 29, 'change_urlpodcasts'),
(115, 'Can delete url podcasts', 29, 'delete_urlpodcasts'),
(116, 'Can view url podcasts', 29, 'view_urlpodcasts');

-- --------------------------------------------------------

--
-- Структура таблицы `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$180000$zTOkOB7sxkOU$Z6TOLrc7CsEeZJ1EWfjKIIA9R5gJU2x1tKR/AJe2XXM=', '2020-01-23 20:53:17.514148', 1, 'admin', '', '', 'vomoran@gmail.com', 1, 1, '2020-01-21 19:48:55.763659');

-- --------------------------------------------------------

--
-- Структура таблицы `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `categorys`
--

CREATE TABLE `categorys` (
  `id_category` smallint(6) NOT NULL COMMENT 'айди категории',
  `title_category` tinytext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'название категории'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='таблица категорий и их id';

-- --------------------------------------------------------

--
-- Структура таблицы `cat_item`
--

CREATE TABLE `cat_item` (
  `id_item` smallint(6) NOT NULL COMMENT 'айди  категории',
  `title_category` tinytext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'категория выпуска'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='категории выпусков';

-- --------------------------------------------------------

--
-- Структура таблицы `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL
) ;

--
-- Дамп данных таблицы `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2020-01-21 20:18:53.885215', '0', 'UrlPodcasts object (0)', 1, '[{\"added\": {}}]', 29, 1),
(2, '2020-01-21 20:19:17.927481', '0', 'UrlPodcasts object (0)', 1, '[{\"added\": {}}]', 29, 1),
(3, '2020-01-21 20:25:56.456317', '0', 'UrlPodcasts object (0)', 1, '[{\"added\": {}}]', 29, 1),
(4, '2020-01-21 20:33:02.597118', '0', 'UrlPodcasts object (0)', 1, '[{\"added\": {}}]', 29, 1),
(5, '2020-01-22 08:46:30.094634', 'None', 'UrlPodcasts object (None)', 1, '[{\"added\": {}}]', 29, 1),
(6, '2020-01-22 08:48:28.964575', 'None', 'UrlPodcasts object (None)', 1, '[{\"added\": {}}]', 29, 1),
(7, '2020-01-22 12:28:12.964612', 'None', 'UrlPodcasts object (None)', 1, '[{\"added\": {}}]', 29, 1),
(8, '2020-01-22 14:56:21.845559', 'None', 'UrlPodcasts object (None)', 1, '[{\"added\": {}}]', 29, 1),
(9, '2020-01-22 15:22:36.382236', 'None', 'UrlPodcasts object (None)', 1, '[{\"added\": {}}]', 29, 1),
(10, '2020-01-23 18:26:30.397285', 'None', 'UrlPodcasts object (None)', 1, '[{\"added\": {}}]', 29, 1),
(11, '2020-01-23 18:36:41.410023', 'None', 'UrlPodcasts object (None)', 1, '[{\"added\": {}}]', 29, 1),
(12, '2020-01-23 18:40:44.274609', 'None', 'UrlPodcasts object (None)', 1, '[{\"added\": {}}]', 29, 1),
(13, '2020-01-23 20:38:57.877757', 'None', 'UrlPodcasts object (None)', 1, '[{\"added\": {}}]', 29, 1),
(14, '2020-01-23 20:39:21.332816', 'None', 'UrlPodcasts object (None)', 1, '[{\"added\": {}}]', 29, 1),
(15, '2020-01-23 20:39:44.370128', 'None', 'UrlPodcasts object (None)', 1, '[{\"added\": {}}]', 29, 1),
(16, '2020-01-23 20:40:19.558949', 'None', 'UrlPodcasts object (None)', 1, '[{\"added\": {}}]', 29, 1),
(17, '2020-01-23 20:42:14.963695', 'None', 'UrlPodcasts object (None)', 1, '[{\"added\": {}}]', 29, 1),
(18, '2020-01-23 20:42:28.384974', '712', 'UrlPodcasts object (712)', 3, '', 29, 1),
(19, '2020-01-23 20:42:28.392225', '711', 'UrlPodcasts object (711)', 3, '', 29, 1),
(20, '2020-01-23 20:42:28.397511', '710', 'UrlPodcasts object (710)', 3, '', 29, 1),
(21, '2020-01-23 20:42:28.416766', '709', 'UrlPodcasts object (709)', 3, '', 29, 1),
(22, '2020-01-23 20:42:28.420259', '708', 'UrlPodcasts object (708)', 3, '', 29, 1),
(23, '2020-01-23 20:42:28.421900', '707', 'UrlPodcasts object (707)', 3, '', 29, 1),
(24, '2020-01-23 20:42:28.425119', '706', 'UrlPodcasts object (706)', 3, '', 29, 1),
(25, '2020-01-23 20:42:28.426639', '705', 'UrlPodcasts object (705)', 3, '', 29, 1),
(26, '2020-01-23 20:42:28.429809', '704', 'UrlPodcasts object (704)', 3, '', 29, 1),
(27, '2020-01-23 20:42:28.432771', '703', 'UrlPodcasts object (703)', 3, '', 29, 1),
(28, '2020-01-23 20:42:28.434542', '702', 'UrlPodcasts object (702)', 3, '', 29, 1),
(29, '2020-01-23 20:42:28.444865', '701', 'UrlPodcasts object (701)', 3, '', 29, 1),
(30, '2020-01-23 20:42:28.454331', '700', 'UrlPodcasts object (700)', 3, '', 29, 1),
(31, '2020-01-23 20:42:28.461046', '699', 'UrlPodcasts object (699)', 3, '', 29, 1),
(32, '2020-01-23 20:42:28.466003', '698', 'UrlPodcasts object (698)', 3, '', 29, 1),
(33, '2020-01-23 20:42:28.477488', '697', 'UrlPodcasts object (697)', 3, '', 29, 1),
(34, '2020-01-23 20:42:28.483051', '696', 'UrlPodcasts object (696)', 3, '', 29, 1),
(35, '2020-01-23 20:42:28.488865', '695', 'UrlPodcasts object (695)', 3, '', 29, 1),
(36, '2020-01-23 20:42:28.494746', '694', 'UrlPodcasts object (694)', 3, '', 29, 1),
(37, '2020-01-23 20:42:28.502611', '693', 'UrlPodcasts object (693)', 3, '', 29, 1),
(38, '2020-01-23 20:42:28.512848', '692', 'UrlPodcasts object (692)', 3, '', 29, 1),
(39, '2020-01-23 20:42:28.519450', '691', 'UrlPodcasts object (691)', 3, '', 29, 1),
(40, '2020-01-23 20:42:28.525526', '690', 'UrlPodcasts object (690)', 3, '', 29, 1),
(41, '2020-01-23 20:42:28.532166', '689', 'UrlPodcasts object (689)', 3, '', 29, 1),
(42, '2020-01-23 20:42:28.537806', '688', 'UrlPodcasts object (688)', 3, '', 29, 1),
(43, '2020-01-23 20:42:28.542012', '687', 'UrlPodcasts object (687)', 3, '', 29, 1),
(44, '2020-01-23 20:42:28.545618', '686', 'UrlPodcasts object (686)', 3, '', 29, 1),
(45, '2020-01-23 20:42:28.555905', '685', 'UrlPodcasts object (685)', 3, '', 29, 1),
(46, '2020-01-23 20:42:28.567862', '684', 'UrlPodcasts object (684)', 3, '', 29, 1),
(47, '2020-01-23 20:42:28.576580', '683', 'UrlPodcasts object (683)', 3, '', 29, 1),
(48, '2020-01-23 20:42:28.583631', '682', 'UrlPodcasts object (682)', 3, '', 29, 1),
(49, '2020-01-23 20:42:28.590489', '681', 'UrlPodcasts object (681)', 3, '', 29, 1),
(50, '2020-01-23 20:42:28.594055', '680', 'UrlPodcasts object (680)', 3, '', 29, 1),
(51, '2020-01-23 20:42:28.597944', '679', 'UrlPodcasts object (679)', 3, '', 29, 1),
(52, '2020-01-23 20:42:28.607402', '678', 'UrlPodcasts object (678)', 3, '', 29, 1),
(53, '2020-01-23 20:42:28.613909', '677', 'UrlPodcasts object (677)', 3, '', 29, 1),
(54, '2020-01-23 20:42:28.625049', '676', 'UrlPodcasts object (676)', 3, '', 29, 1),
(55, '2020-01-23 20:42:28.632634', '675', 'UrlPodcasts object (675)', 3, '', 29, 1),
(56, '2020-01-23 20:42:28.639496', '674', 'UrlPodcasts object (674)', 3, '', 29, 1),
(57, '2020-01-23 20:42:28.645860', '673', 'UrlPodcasts object (673)', 3, '', 29, 1),
(58, '2020-01-23 20:42:28.651495', '672', 'UrlPodcasts object (672)', 3, '', 29, 1),
(59, '2020-01-23 20:42:28.672062', '671', 'UrlPodcasts object (671)', 3, '', 29, 1),
(60, '2020-01-23 20:42:28.677890', '670', 'UrlPodcasts object (670)', 3, '', 29, 1),
(61, '2020-01-23 20:42:28.685494', '669', 'UrlPodcasts object (669)', 3, '', 29, 1),
(62, '2020-01-23 20:42:28.697996', '668', 'UrlPodcasts object (668)', 3, '', 29, 1),
(63, '2020-01-23 20:42:28.712372', '667', 'UrlPodcasts object (667)', 3, '', 29, 1),
(64, '2020-01-23 20:42:28.724828', '666', 'UrlPodcasts object (666)', 3, '', 29, 1),
(65, '2020-01-23 20:42:28.734303', '665', 'UrlPodcasts object (665)', 3, '', 29, 1),
(66, '2020-01-23 20:42:28.743309', '664', 'UrlPodcasts object (664)', 3, '', 29, 1),
(67, '2020-01-23 20:42:28.749497', '663', 'UrlPodcasts object (663)', 3, '', 29, 1),
(68, '2020-01-23 20:42:28.753853', '662', 'UrlPodcasts object (662)', 3, '', 29, 1),
(69, '2020-01-23 20:42:28.760890', '661', 'UrlPodcasts object (661)', 3, '', 29, 1),
(70, '2020-01-23 20:42:28.764665', '660', 'UrlPodcasts object (660)', 3, '', 29, 1),
(71, '2020-01-23 20:42:28.771942', '659', 'UrlPodcasts object (659)', 3, '', 29, 1),
(72, '2020-01-23 20:42:28.779577', '658', 'UrlPodcasts object (658)', 3, '', 29, 1),
(73, '2020-01-23 20:42:28.784685', '657', 'UrlPodcasts object (657)', 3, '', 29, 1),
(74, '2020-01-23 20:42:28.788198', '656', 'UrlPodcasts object (656)', 3, '', 29, 1),
(75, '2020-01-23 20:42:28.791312', '655', 'UrlPodcasts object (655)', 3, '', 29, 1),
(76, '2020-01-23 20:42:28.796893', '654', 'UrlPodcasts object (654)', 3, '', 29, 1),
(77, '2020-01-23 20:42:28.816129', '653', 'UrlPodcasts object (653)', 3, '', 29, 1),
(78, '2020-01-23 20:42:28.828448', '652', 'UrlPodcasts object (652)', 3, '', 29, 1),
(79, '2020-01-23 20:42:28.833460', '651', 'UrlPodcasts object (651)', 3, '', 29, 1),
(80, '2020-01-23 20:42:28.835872', '650', 'UrlPodcasts object (650)', 3, '', 29, 1),
(81, '2020-01-23 20:42:28.841765', '649', 'UrlPodcasts object (649)', 3, '', 29, 1),
(82, '2020-01-23 20:42:28.856055', '648', 'UrlPodcasts object (648)', 3, '', 29, 1),
(83, '2020-01-23 20:42:28.865816', '647', 'UrlPodcasts object (647)', 3, '', 29, 1),
(84, '2020-01-23 20:42:28.873997', '646', 'UrlPodcasts object (646)', 3, '', 29, 1),
(85, '2020-01-23 20:42:28.884316', '645', 'UrlPodcasts object (645)', 3, '', 29, 1),
(86, '2020-01-23 20:42:28.892714', '644', 'UrlPodcasts object (644)', 3, '', 29, 1),
(87, '2020-01-23 20:42:28.898089', '643', 'UrlPodcasts object (643)', 3, '', 29, 1),
(88, '2020-01-23 20:42:28.910437', '642', 'UrlPodcasts object (642)', 3, '', 29, 1),
(89, '2020-01-23 20:42:28.917979', '641', 'UrlPodcasts object (641)', 3, '', 29, 1),
(90, '2020-01-23 20:42:28.927689', '640', 'UrlPodcasts object (640)', 3, '', 29, 1),
(91, '2020-01-23 20:42:28.933217', '639', 'UrlPodcasts object (639)', 3, '', 29, 1),
(92, '2020-01-23 20:42:28.939660', '638', 'UrlPodcasts object (638)', 3, '', 29, 1),
(93, '2020-01-23 20:42:28.945658', '637', 'UrlPodcasts object (637)', 3, '', 29, 1),
(94, '2020-01-23 20:42:28.955609', '636', 'UrlPodcasts object (636)', 3, '', 29, 1),
(95, '2020-01-23 20:42:28.967977', '635', 'UrlPodcasts object (635)', 3, '', 29, 1),
(96, '2020-01-23 20:42:28.973355', '634', 'UrlPodcasts object (634)', 3, '', 29, 1),
(97, '2020-01-23 20:42:28.980433', '633', 'UrlPodcasts object (633)', 3, '', 29, 1),
(98, '2020-01-23 20:42:28.986728', '632', 'UrlPodcasts object (632)', 3, '', 29, 1),
(99, '2020-01-23 20:42:28.993019', '631', 'UrlPodcasts object (631)', 3, '', 29, 1),
(100, '2020-01-23 20:42:28.998422', '630', 'UrlPodcasts object (630)', 3, '', 29, 1),
(101, '2020-01-23 20:42:29.011701', '629', 'UrlPodcasts object (629)', 3, '', 29, 1),
(102, '2020-01-23 20:42:29.017779', '628', 'UrlPodcasts object (628)', 3, '', 29, 1),
(103, '2020-01-23 20:42:29.023594', '627', 'UrlPodcasts object (627)', 3, '', 29, 1),
(104, '2020-01-23 20:42:29.029922', '626', 'UrlPodcasts object (626)', 3, '', 29, 1),
(105, '2020-01-23 20:42:29.041538', '625', 'UrlPodcasts object (625)', 3, '', 29, 1),
(106, '2020-01-23 20:42:29.047915', '624', 'UrlPodcasts object (624)', 3, '', 29, 1),
(107, '2020-01-23 20:42:29.054558', '623', 'UrlPodcasts object (623)', 3, '', 29, 1),
(108, '2020-01-23 20:42:29.063450', '622', 'UrlPodcasts object (622)', 3, '', 29, 1),
(109, '2020-01-23 20:42:29.079490', '621', 'UrlPodcasts object (621)', 3, '', 29, 1),
(110, '2020-01-23 20:42:29.090013', '620', 'UrlPodcasts object (620)', 3, '', 29, 1),
(111, '2020-01-23 20:42:29.101490', '619', 'UrlPodcasts object (619)', 3, '', 29, 1),
(112, '2020-01-23 20:42:29.107724', '618', 'UrlPodcasts object (618)', 3, '', 29, 1),
(113, '2020-01-23 20:42:29.128177', '617', 'UrlPodcasts object (617)', 3, '', 29, 1),
(114, '2020-01-23 20:42:29.134786', '616', 'UrlPodcasts object (616)', 3, '', 29, 1),
(115, '2020-01-23 20:42:29.142529', '615', 'UrlPodcasts object (615)', 3, '', 29, 1),
(116, '2020-01-23 20:42:29.150706', '614', 'UrlPodcasts object (614)', 3, '', 29, 1),
(117, '2020-01-23 20:42:29.157686', '613', 'UrlPodcasts object (613)', 3, '', 29, 1),
(118, '2020-01-23 20:44:43.531990', 'None', 'UrlPodcasts object (None)', 1, '[{\"added\": {}}]', 29, 1),
(119, '2020-01-23 20:47:25.135609', 'None', 'UrlPodcasts object (None)', 1, '[{\"added\": {}}]', 29, 1),
(120, '2020-01-23 20:53:27.917435', 'None', 'UrlPodcasts object (None)', 1, '[{\"added\": {}}]', 29, 1),
(121, '2020-01-23 20:59:06.555494', 'None', 'UrlPodcasts object (None)', 1, '[{\"added\": {}}]', 29, 1),
(122, '2020-01-23 21:09:17.154561', 'None', 'UrlPodcasts object (None)', 1, '[{\"added\": {}}]', 29, 1),
(123, '2020-01-23 21:13:59.089908', 'None', 'UrlPodcasts object (None)', 1, '[{\"added\": {}}]', 29, 1),
(124, '2020-01-23 21:34:11.142382', 'None', 'UrlPodcasts object (None)', 1, '[{\"added\": {}}]', 29, 1),
(125, '2020-01-23 21:36:19.863142', 'None', 'UrlPodcasts object (None)', 1, '[{\"added\": {}}]', 29, 1),
(126, '2020-01-24 12:41:36.370376', 'None', 'UrlPodcasts object (None)', 1, '[{\"added\": {}}]', 29, 1),
(127, '2020-01-24 12:43:24.017446', 'None', 'UrlPodcasts object (None)', 1, '[{\"added\": {}}]', 29, 1),
(128, '2020-01-24 12:54:05.744028', 'None', 'UrlPodcasts object (None)', 1, '[{\"added\": {}}]', 29, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'pd_backend', 'authgroup'),
(8, 'pd_backend', 'authgrouppermissions'),
(9, 'pd_backend', 'authpermission'),
(10, 'pd_backend', 'authuser'),
(11, 'pd_backend', 'authusergroups'),
(12, 'pd_backend', 'authuseruserpermissions'),
(13, 'pd_backend', 'categorys'),
(14, 'pd_backend', 'catitem'),
(15, 'pd_backend', 'djangoadminlog'),
(16, 'pd_backend', 'djangocontenttype'),
(17, 'pd_backend', 'djangomigrations'),
(18, 'pd_backend', 'djangosession'),
(19, 'pd_backend', 'errorlinks'),
(20, 'pd_backend', 'items'),
(21, 'pd_backend', 'itemswithkeywords'),
(22, 'pd_backend', 'keywords'),
(23, 'pd_backend', 'keywordsitems'),
(24, 'pd_backend', 'podcasts'),
(25, 'pd_backend', 'podcastswithcategorys'),
(26, 'pd_backend', 'podcastswithkeywords'),
(27, 'pd_backend', 'subcatitem'),
(28, 'pd_backend', 'subcatpodcast'),
(29, 'pd_backend', 'urlpodcasts'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Структура таблицы `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2020-01-21 19:44:46.173048'),
(2, 'auth', '0001_initial', '2020-01-21 19:44:46.431218'),
(3, 'admin', '0001_initial', '2020-01-21 19:44:47.342734'),
(4, 'admin', '0002_logentry_remove_auto_add', '2020-01-21 19:44:47.576504'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2020-01-21 19:44:47.588847'),
(6, 'contenttypes', '0002_remove_content_type_name', '2020-01-21 19:44:47.730929'),
(7, 'auth', '0002_alter_permission_name_max_length', '2020-01-21 19:44:47.850226'),
(8, 'auth', '0003_alter_user_email_max_length', '2020-01-21 19:44:47.869594'),
(9, 'auth', '0004_alter_user_username_opts', '2020-01-21 19:44:47.887176'),
(10, 'auth', '0005_alter_user_last_login_null', '2020-01-21 19:44:47.988970'),
(11, 'auth', '0006_require_contenttypes_0002', '2020-01-21 19:44:48.009670'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2020-01-21 19:44:48.027520'),
(13, 'auth', '0008_alter_user_username_max_length', '2020-01-21 19:44:48.047076'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2020-01-21 19:44:48.065092'),
(15, 'auth', '0010_alter_group_name_max_length', '2020-01-21 19:44:48.081172'),
(16, 'auth', '0011_update_proxy_permissions', '2020-01-21 19:44:48.092785'),
(17, 'sessions', '0001_initial', '2020-01-21 19:44:48.112287'),
(18, 'pd_backend', '0001_initial', '2020-01-21 19:53:38.451278');

-- --------------------------------------------------------

--
-- Структура таблицы `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('8j4c3wtwosnp4k0yqxq6mzx7ohpg777n', 'NDVlOTVmYmRhM2ViMWNjNzIyYWUxM2MyZjJiZTE4YTNlNmMwMTk4OTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3MmIzYWU1ZTdkMWY2ZDYxYWRhNTg5ZDVhOWI0ZTU1YjY5OTI5Yjk4In0=', '2020-02-06 20:53:17.537659');

-- --------------------------------------------------------

--
-- Структура таблицы `error_links`
--

CREATE TABLE `error_links` (
  `url` tinytext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'битая ссылка'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='таблица с битыми ссылками';

-- --------------------------------------------------------

--
-- Структура таблицы `items`
--

CREATE TABLE `items` (
  `id_podcast` mediumint(9) NOT NULL COMMENT 'к какому подкасту относится',
  `title_audio` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'название выпуска',
  `description_audio` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'описание выпуска',
  `audio` tinytext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'сам выпуск',
  `image_audio` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'картинка выпуска',
  `pubdata_audio` datetime DEFAULT NULL COMMENT 'дата публикации выпуска',
  `duration_audio` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'длительность выпуска',
  `id_item` mediumint(9) NOT NULL COMMENT 'айди выпуска'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Выпуски подкастов';

-- --------------------------------------------------------

--
-- Структура таблицы `items_with_keywords`
--

CREATE TABLE `items_with_keywords` (
  `id_item` mediumint(9) NOT NULL COMMENT 'айди выпуска',
  `id_keyword` smallint(6) NOT NULL COMMENT 'айди ключевого слова'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='связь ключ слов с выпусками';

-- --------------------------------------------------------

--
-- Структура таблицы `keywords`
--

CREATE TABLE `keywords` (
  `id_keyword` mediumint(9) NOT NULL COMMENT 'айди ключ. слова',
  `title_keyword` tinytext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'само ключ слово'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='таблица ключ слов и их айди';

-- --------------------------------------------------------

--
-- Структура таблицы `keywords_items`
--

CREATE TABLE `keywords_items` (
  `id_keyword_item` smallint(6) NOT NULL COMMENT 'айди ключевого слова',
  `title_keyword` tinytext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'само ключ слово'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='таблица ключ. слов для выпусков';

-- --------------------------------------------------------

--
-- Структура таблицы `podcasts`
--

CREATE TABLE `podcasts` (
  `title_podcast` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'название подкаста',
  `description_podcast` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'описание подкаста',
  `url_image_podcast` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ссылка картинки подкаста',
  `author_podcast` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'автор подкаста',
  `id_podcast` mediumint(9) NOT NULL COMMENT 'Айди подкаста'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `podcasts_with_categorys`
--

CREATE TABLE `podcasts_with_categorys` (
  `id_podcast` mediumint(9) NOT NULL COMMENT 'айди подкаста',
  `id_category` smallint(6) NOT NULL COMMENT 'айди категории'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `podcasts_with_keywords`
--

CREATE TABLE `podcasts_with_keywords` (
  `id_podcast` mediumint(9) NOT NULL COMMENT 'айди подкаста',
  `id_keyword` mediumint(9) NOT NULL COMMENT 'айди ключевого слова'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='таблица связки, ключ слова с подкастом';

-- --------------------------------------------------------

--
-- Структура таблицы `subcat_item`
--

CREATE TABLE `subcat_item` (
  `id_item` smallint(6) NOT NULL COMMENT 'айди выпуска',
  `title_subcategory` tinytext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'сама подкатегория'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='таблица подкатегорий выпусков';

-- --------------------------------------------------------

--
-- Структура таблицы `subcat_podcast`
--

CREATE TABLE `subcat_podcast` (
  `id_podcast` mediumint(9) NOT NULL COMMENT 'айди подкаста',
  `title_subcat` tinytext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'его подкатегории'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Таблица с подкатегориями к подкастам';

-- --------------------------------------------------------

--
-- Структура таблицы `url_podcasts`
--

CREATE TABLE `url_podcasts` (
  `url_podcast` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ссылка на источник',
  `status_podcast` tinyint(3) NOT NULL DEFAULT 1,
  `id` mediumint(9) NOT NULL COMMENT 'id подкаста'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Индексы таблицы `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Индексы таблицы `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Индексы таблицы `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Индексы таблицы `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Индексы таблицы `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Индексы таблицы `categorys`
--
ALTER TABLE `categorys`
  ADD PRIMARY KEY (`id_category`);

--
-- Индексы таблицы `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Индексы таблицы `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Индексы таблицы `error_links`
--
ALTER TABLE `error_links`
  ADD UNIQUE KEY `url` (`url`) USING HASH;

--
-- Индексы таблицы `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id_item`);

--
-- Индексы таблицы `keywords`
--
ALTER TABLE `keywords`
  ADD PRIMARY KEY (`id_keyword`);

--
-- Индексы таблицы `keywords_items`
--
ALTER TABLE `keywords_items`
  ADD PRIMARY KEY (`id_keyword_item`);

--
-- Индексы таблицы `podcasts`
--
ALTER TABLE `podcasts`
  ADD PRIMARY KEY (`id_podcast`),
  ADD UNIQUE KEY `id_podcast` (`id_podcast`);

--
-- Индексы таблицы `podcasts_with_categorys`
--
ALTER TABLE `podcasts_with_categorys`
  ADD KEY `id_category` (`id_category`),
  ADD KEY `Основная инфа канала` (`id_podcast`);

--
-- Индексы таблицы `url_podcasts`
--
ALTER TABLE `url_podcasts`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;
--
-- AUTO_INCREMENT для таблицы `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `categorys`
--
ALTER TABLE `categorys`
  MODIFY `id_category` smallint(6) NOT NULL AUTO_INCREMENT COMMENT 'айди категории';
--
-- AUTO_INCREMENT для таблицы `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT для таблицы `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT для таблицы `items`
--
ALTER TABLE `items`
  MODIFY `id_item` mediumint(9) NOT NULL AUTO_INCREMENT COMMENT 'айди выпуска';
--
-- AUTO_INCREMENT для таблицы `keywords`
--
ALTER TABLE `keywords`
  MODIFY `id_keyword` mediumint(9) NOT NULL AUTO_INCREMENT COMMENT 'айди ключ. слова';
--
-- AUTO_INCREMENT для таблицы `keywords_items`
--
ALTER TABLE `keywords_items`
  MODIFY `id_keyword_item` smallint(6) NOT NULL AUTO_INCREMENT COMMENT 'айди ключевого слова';
--
-- AUTO_INCREMENT для таблицы `url_podcasts`
--
ALTER TABLE `url_podcasts`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT COMMENT 'id подкаста';
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Ограничения внешнего ключа таблицы `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Ограничения внешнего ключа таблицы `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ограничения внешнего ключа таблицы `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ограничения внешнего ключа таблицы `podcasts_with_categorys`
--
ALTER TABLE `podcasts_with_categorys`
  ADD CONSTRAINT `podcasts_with_categorys_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `categorys` (`id_category`),
  ADD CONSTRAINT `Основная инфа канала` FOREIGN KEY (`id_podcast`) REFERENCES `podcasts` (`id_podcast`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
