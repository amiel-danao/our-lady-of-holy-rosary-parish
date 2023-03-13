-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 17, 2022 at 06:46 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `church$church_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_interface_theme`
--

CREATE TABLE `admin_interface_theme` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `title` varchar(50) NOT NULL,
  `title_visible` tinyint(1) NOT NULL,
  `logo` varchar(100) NOT NULL,
  `logo_visible` tinyint(1) NOT NULL,
  `css_header_background_color` varchar(10) NOT NULL,
  `title_color` varchar(10) NOT NULL,
  `css_header_text_color` varchar(10) NOT NULL,
  `css_header_link_color` varchar(10) NOT NULL,
  `css_header_link_hover_color` varchar(10) NOT NULL,
  `css_module_background_color` varchar(10) NOT NULL,
  `css_module_text_color` varchar(10) NOT NULL,
  `css_module_link_color` varchar(10) NOT NULL,
  `css_module_link_hover_color` varchar(10) NOT NULL,
  `css_module_rounded_corners` tinyint(1) NOT NULL,
  `css_generic_link_color` varchar(10) NOT NULL,
  `css_generic_link_hover_color` varchar(10) NOT NULL,
  `css_save_button_background_color` varchar(10) NOT NULL,
  `css_save_button_background_hover_color` varchar(10) NOT NULL,
  `css_save_button_text_color` varchar(10) NOT NULL,
  `css_delete_button_background_color` varchar(10) NOT NULL,
  `css_delete_button_background_hover_color` varchar(10) NOT NULL,
  `css_delete_button_text_color` varchar(10) NOT NULL,
  `list_filter_dropdown` tinyint(1) NOT NULL,
  `related_modal_active` tinyint(1) NOT NULL,
  `related_modal_background_color` varchar(10) NOT NULL,
  `related_modal_rounded_corners` tinyint(1) NOT NULL,
  `logo_color` varchar(10) NOT NULL,
  `recent_actions_visible` tinyint(1) NOT NULL,
  `favicon` varchar(100) NOT NULL,
  `related_modal_background_opacity` varchar(5) NOT NULL,
  `env_name` varchar(50) NOT NULL,
  `env_visible_in_header` tinyint(1) NOT NULL,
  `env_color` varchar(10) NOT NULL,
  `env_visible_in_favicon` tinyint(1) NOT NULL,
  `related_modal_close_button_visible` tinyint(1) NOT NULL,
  `language_chooser_active` tinyint(1) NOT NULL,
  `language_chooser_display` varchar(10) NOT NULL,
  `list_filter_sticky` tinyint(1) NOT NULL,
  `form_pagination_sticky` tinyint(1) NOT NULL,
  `form_submit_sticky` tinyint(1) NOT NULL,
  `css_module_background_selected_color` varchar(10) NOT NULL,
  `css_module_link_selected_color` varchar(10) NOT NULL,
  `logo_max_height` smallint(5) UNSIGNED NOT NULL CHECK (`logo_max_height` >= 0),
  `logo_max_width` smallint(5) UNSIGNED NOT NULL CHECK (`logo_max_width` >= 0),
  `foldable_apps` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin_interface_theme`
--

INSERT INTO `admin_interface_theme` (`id`, `name`, `active`, `title`, `title_visible`, `logo`, `logo_visible`, `css_header_background_color`, `title_color`, `css_header_text_color`, `css_header_link_color`, `css_header_link_hover_color`, `css_module_background_color`, `css_module_text_color`, `css_module_link_color`, `css_module_link_hover_color`, `css_module_rounded_corners`, `css_generic_link_color`, `css_generic_link_hover_color`, `css_save_button_background_color`, `css_save_button_background_hover_color`, `css_save_button_text_color`, `css_delete_button_background_color`, `css_delete_button_background_hover_color`, `css_delete_button_text_color`, `list_filter_dropdown`, `related_modal_active`, `related_modal_background_color`, `related_modal_rounded_corners`, `logo_color`, `recent_actions_visible`, `favicon`, `related_modal_background_opacity`, `env_name`, `env_visible_in_header`, `env_color`, `env_visible_in_favicon`, `related_modal_close_button_visible`, `language_chooser_active`, `language_chooser_display`, `list_filter_sticky`, `form_pagination_sticky`, `form_submit_sticky`, `css_module_background_selected_color`, `css_module_link_selected_color`, `logo_max_height`, `logo_max_width`, `foldable_apps`) VALUES
(1, 'Django', 1, 'Django administration', 1, '', 1, '#0C4B33', '#F5DD5D', '#44B78B', '#FFFFFF', '#C9F0DD', '#44B78B', '#FFFFFF', '#FFFFFF', '#C9F0DD', 1, '#0C3C26', '#156641', '#0C4B33', '#0C3C26', '#FFFFFF', '#BA2121', '#A41515', '#FFFFFF', 1, 1, '#000000', 1, '#FFFFFF', 1, '', '0.3', '', 1, '#E74C3C', 1, 1, 1, 'code', 1, 0, 0, '#FFFFCC', '#FFFFFF', 100, 400, 1);

-- --------------------------------------------------------

--
-- Table structure for table `app_brand`
--

CREATE TABLE `app_brand` (
  `id` bigint(20) NOT NULL,
  `title` varchar(75) NOT NULL,
  `summary` longtext DEFAULT NULL,
  `createdAt` datetime(6) NOT NULL,
  `updatedAt` datetime(6) DEFAULT NULL,
  `content` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `app_breed`
--

CREATE TABLE `app_breed` (
  `breed_name` varchar(80) NOT NULL,
  `species` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `app_breed`
--

INSERT INTO `app_breed` (`breed_name`, `species`) VALUES
('Abyssinian', 'Cat'),
('German Sheperd', 'Dog');

-- --------------------------------------------------------

--
-- Table structure for table `app_category`
--

CREATE TABLE `app_category` (
  `id` bigint(20) NOT NULL,
  `title` varchar(75) NOT NULL,
  `metaTitle` varchar(100) DEFAULT NULL,
  `slug` varchar(100) NOT NULL,
  `content` longtext DEFAULT NULL,
  `parentId` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `app_customer`
--

CREATE TABLE `app_customer` (
  `id` bigint(20) NOT NULL,
  `roleId` smallint(6) NOT NULL,
  `firstName` varchar(50) DEFAULT NULL,
  `middleName` varchar(50) DEFAULT NULL,
  `lastName` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `email` varchar(254) NOT NULL,
  `passwordHash` varchar(32) NOT NULL,
  `registeredAt` datetime(6) NOT NULL,
  `lastLogin` datetime(6) DEFAULT NULL,
  `intro` longtext DEFAULT NULL,
  `profile` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `app_immunizationhistory`
--

CREATE TABLE `app_immunizationhistory` (
  `pet_id` bigint(20) NOT NULL,
  `pet_age` smallint(5) UNSIGNED NOT NULL CHECK (`pet_age` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `app_immunizationhistory_vaccine`
--

CREATE TABLE `app_immunizationhistory_vaccine` (
  `id` bigint(20) NOT NULL,
  `immunizationhistory_id` bigint(20) NOT NULL,
  `vaccine_id` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `app_item`
--

CREATE TABLE `app_item` (
  `id` bigint(20) NOT NULL,
  `sku` varchar(100) NOT NULL,
  `mrp` double NOT NULL,
  `discount` double NOT NULL,
  `price` double NOT NULL,
  `quantity` smallint(6) NOT NULL,
  `sold` smallint(6) NOT NULL,
  `available` smallint(6) NOT NULL,
  `defective` smallint(6) NOT NULL,
  `createdBy` bigint(20) NOT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `createdAt` datetime(6) NOT NULL,
  `updatedAt` datetime(6) DEFAULT NULL,
  `brandId` bigint(20) NOT NULL,
  `orderId` bigint(20) NOT NULL,
  `productId` bigint(20) NOT NULL,
  `supplierId` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `app_medicalhistory`
--

CREATE TABLE `app_medicalhistory` (
  `pet_id` bigint(20) NOT NULL,
  `date` datetime(6) NOT NULL,
  `description` varchar(200) NOT NULL,
  `veterinarian` varchar(50) NOT NULL,
  `diagnosis` varchar(200) NOT NULL,
  `tests_performed` varchar(200) DEFAULT NULL,
  `test_results` varchar(200) NOT NULL,
  `action` varchar(200) DEFAULT NULL,
  `medication` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `app_order`
--

CREATE TABLE `app_order` (
  `id` bigint(20) NOT NULL,
  `type` smallint(6) NOT NULL,
  `status` smallint(6) NOT NULL,
  `subTotal` double NOT NULL,
  `itemDiscount` double NOT NULL,
  `tax` double NOT NULL,
  `shipping` double NOT NULL,
  `total` double NOT NULL,
  `promo` varchar(50) DEFAULT NULL,
  `discount` double NOT NULL,
  `grandTotal` double NOT NULL,
  `createdAt` datetime(6) NOT NULL,
  `updatedAt` datetime(6) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `userId` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `app_orderitem`
--

CREATE TABLE `app_orderitem` (
  `id` bigint(20) NOT NULL,
  `sku` varchar(100) NOT NULL,
  `price` double NOT NULL,
  `discount` double NOT NULL,
  `quantity` smallint(6) NOT NULL,
  `createdAt` datetime(6) NOT NULL,
  `updatedAt` datetime(6) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `itemId` bigint(20) NOT NULL,
  `orderId` bigint(20) NOT NULL,
  `productId` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `app_pet`
--

CREATE TABLE `app_pet` (
  `id` bigint(20) NOT NULL,
  `owner` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `date_of_birth` datetime(6) NOT NULL,
  `pet_age` smallint(5) UNSIGNED NOT NULL CHECK (`pet_age` >= 0),
  `gender` varchar(10) NOT NULL,
  `weight` double NOT NULL,
  `height` double NOT NULL,
  `species` varchar(10) NOT NULL,
  `allergies` varchar(50) NOT NULL,
  `existing_conditions` varchar(80) NOT NULL,
  `image` varchar(300) NOT NULL,
  `breed_id` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `app_product`
--

CREATE TABLE `app_product` (
  `id` bigint(20) NOT NULL,
  `title` varchar(75) NOT NULL,
  `summary` longtext DEFAULT NULL,
  `type` smallint(6) NOT NULL,
  `createdAt` datetime(6) NOT NULL,
  `updatedAt` datetime(6) DEFAULT NULL,
  `content` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `app_productmeta`
--

CREATE TABLE `app_productmeta` (
  `id` bigint(20) NOT NULL,
  `key` varchar(50) NOT NULL,
  `content` longtext DEFAULT NULL,
  `productId` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `app_transaction`
--

CREATE TABLE `app_transaction` (
  `id` bigint(20) NOT NULL,
  `code` varchar(100) NOT NULL,
  `type` smallint(6) NOT NULL,
  `mode` smallint(6) NOT NULL,
  `status` smallint(6) NOT NULL,
  `createdAt` datetime(6) NOT NULL,
  `updatedAt` datetime(6) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `orderId` bigint(20) NOT NULL,
  `userId` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `app_vaccine`
--

CREATE TABLE `app_vaccine` (
  `name` varchar(80) NOT NULL,
  `brand` varchar(80) NOT NULL,
  `capacity` double NOT NULL,
  `side_effects` varchar(80) NOT NULL,
  `effect_duration` double NOT NULL,
  `intake_type` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add brand', 1, 'add_brand'),
(2, 'Can change brand', 1, 'change_brand'),
(3, 'Can delete brand', 1, 'delete_brand'),
(4, 'Can view brand', 1, 'view_brand'),
(5, 'Can add breed', 2, 'add_breed'),
(6, 'Can change breed', 2, 'change_breed'),
(7, 'Can delete breed', 2, 'delete_breed'),
(8, 'Can view breed', 2, 'view_breed'),
(9, 'Can add customer', 3, 'add_customer'),
(10, 'Can change customer', 3, 'change_customer'),
(11, 'Can delete customer', 3, 'delete_customer'),
(12, 'Can view customer', 3, 'view_customer'),
(13, 'Can add item', 4, 'add_item'),
(14, 'Can change item', 4, 'change_item'),
(15, 'Can delete item', 4, 'delete_item'),
(16, 'Can view item', 4, 'view_item'),
(17, 'Can add order', 5, 'add_order'),
(18, 'Can change order', 5, 'change_order'),
(19, 'Can delete order', 5, 'delete_order'),
(20, 'Can view order', 5, 'view_order'),
(21, 'Can add pet', 6, 'add_pet'),
(22, 'Can change pet', 6, 'change_pet'),
(23, 'Can delete pet', 6, 'delete_pet'),
(24, 'Can view pet', 6, 'view_pet'),
(25, 'Can add product', 7, 'add_product'),
(26, 'Can change product', 7, 'change_product'),
(27, 'Can delete product', 7, 'delete_product'),
(28, 'Can view product', 7, 'view_product'),
(29, 'Can add vaccine', 8, 'add_vaccine'),
(30, 'Can change vaccine', 8, 'change_vaccine'),
(31, 'Can delete vaccine', 8, 'delete_vaccine'),
(32, 'Can view vaccine', 8, 'view_vaccine'),
(33, 'Can add medical history', 9, 'add_medicalhistory'),
(34, 'Can change medical history', 9, 'change_medicalhistory'),
(35, 'Can delete medical history', 9, 'delete_medicalhistory'),
(36, 'Can view medical history', 9, 'view_medicalhistory'),
(37, 'Can add transaction', 10, 'add_transaction'),
(38, 'Can change transaction', 10, 'change_transaction'),
(39, 'Can delete transaction', 10, 'delete_transaction'),
(40, 'Can view transaction', 10, 'view_transaction'),
(41, 'Can add order item', 11, 'add_orderitem'),
(42, 'Can change order item', 11, 'change_orderitem'),
(43, 'Can delete order item', 11, 'delete_orderitem'),
(44, 'Can view order item', 11, 'view_orderitem'),
(45, 'Can add category', 12, 'add_category'),
(46, 'Can change category', 12, 'change_category'),
(47, 'Can delete category', 12, 'delete_category'),
(48, 'Can view category', 12, 'view_category'),
(49, 'Can add product meta', 13, 'add_productmeta'),
(50, 'Can change product meta', 13, 'change_productmeta'),
(51, 'Can delete product meta', 13, 'delete_productmeta'),
(52, 'Can view product meta', 13, 'view_productmeta'),
(53, 'Can add product category', 14, 'add_productcategory'),
(54, 'Can change product category', 14, 'change_productcategory'),
(55, 'Can delete product category', 14, 'delete_productcategory'),
(56, 'Can view product category', 14, 'view_productcategory'),
(57, 'Can add immunization history', 15, 'add_immunizationhistory'),
(58, 'Can change immunization history', 15, 'change_immunizationhistory'),
(59, 'Can delete immunization history', 15, 'delete_immunizationhistory'),
(60, 'Can view immunization history', 15, 'view_immunizationhistory'),
(61, 'Can add Theme', 16, 'add_theme'),
(62, 'Can change Theme', 16, 'change_theme'),
(63, 'Can delete Theme', 16, 'delete_theme'),
(64, 'Can view Theme', 16, 'view_theme'),
(65, 'Can add log entry', 17, 'add_logentry'),
(66, 'Can change log entry', 17, 'change_logentry'),
(67, 'Can delete log entry', 17, 'delete_logentry'),
(68, 'Can view log entry', 17, 'view_logentry'),
(69, 'Can add permission', 18, 'add_permission'),
(70, 'Can change permission', 18, 'change_permission'),
(71, 'Can delete permission', 18, 'delete_permission'),
(72, 'Can view permission', 18, 'view_permission'),
(73, 'Can add group', 19, 'add_group'),
(74, 'Can change group', 19, 'change_group'),
(75, 'Can delete group', 19, 'delete_group'),
(76, 'Can view group', 19, 'view_group'),
(77, 'Can add user', 20, 'add_user'),
(78, 'Can change user', 20, 'change_user'),
(79, 'Can delete user', 20, 'delete_user'),
(80, 'Can view user', 20, 'view_user'),
(81, 'Can add content type', 21, 'add_contenttype'),
(82, 'Can change content type', 21, 'change_contenttype'),
(83, 'Can delete content type', 21, 'delete_contenttype'),
(84, 'Can view content type', 21, 'view_contenttype'),
(85, 'Can add session', 22, 'add_session'),
(86, 'Can change session', 22, 'change_session'),
(87, 'Can delete session', 22, 'delete_session'),
(88, 'Can view session', 22, 'view_session');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$320000$kaouUeyerpa4iOMPHmg0B0$FhZgzSEXfmyz4BVy9p16bifn56cVN9U6fOfESHnx+cU=', '2022-06-17 14:45:21.773688', 1, 'admin1', '', '', 'admin1@email.com', 1, 1, '2022-06-17 14:36:03.503616');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2022-06-17 14:45:47.649129', 'Abyssinian', 'Abyssinian', 1, '[{\"added\": {}}]', 2, 1),
(2, '2022-06-17 16:17:13.505881', 'Abyssinian', 'Abyssinian', 2, '[]', 2, 1),
(3, '2022-06-17 16:17:17.902606', 'German Sheperd', 'German Sheperd', 1, '[{\"added\": {}}]', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(17, 'admin', 'logentry'),
(16, 'admin_interface', 'theme'),
(1, 'app', 'brand'),
(2, 'app', 'breed'),
(12, 'app', 'category'),
(3, 'app', 'customer'),
(15, 'app', 'immunizationhistory'),
(4, 'app', 'item'),
(9, 'app', 'medicalhistory'),
(5, 'app', 'order'),
(11, 'app', 'orderitem'),
(6, 'app', 'pet'),
(7, 'app', 'product'),
(14, 'app', 'productcategory'),
(13, 'app', 'productmeta'),
(10, 'app', 'transaction'),
(8, 'app', 'vaccine'),
(19, 'auth', 'group'),
(18, 'auth', 'permission'),
(20, 'auth', 'user'),
(21, 'contenttypes', 'contenttype'),
(22, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-06-17 14:35:02.677022'),
(2, 'auth', '0001_initial', '2022-06-17 14:35:06.477776'),
(3, 'admin', '0001_initial', '2022-06-17 14:35:07.277729'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-06-17 14:35:07.333734'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-06-17 14:35:07.411720'),
(6, 'admin_interface', '0001_initial', '2022-06-17 14:35:07.573724'),
(7, 'admin_interface', '0002_add_related_modal', '2022-06-17 14:35:08.070681'),
(8, 'admin_interface', '0003_add_logo_color', '2022-06-17 14:35:08.201685'),
(9, 'admin_interface', '0004_rename_title_color', '2022-06-17 14:35:08.279677'),
(10, 'admin_interface', '0005_add_recent_actions_visible', '2022-06-17 14:35:08.406659'),
(11, 'admin_interface', '0006_bytes_to_str', '2022-06-17 14:35:08.802636'),
(12, 'admin_interface', '0007_add_favicon', '2022-06-17 14:35:08.952642'),
(13, 'admin_interface', '0008_change_related_modal_background_opacity_type', '2022-06-17 14:35:09.136622'),
(14, 'admin_interface', '0009_add_enviroment', '2022-06-17 14:35:09.389599'),
(15, 'admin_interface', '0010_add_localization', '2022-06-17 14:35:09.483596'),
(16, 'admin_interface', '0011_add_environment_options', '2022-06-17 14:35:09.867570'),
(17, 'admin_interface', '0012_update_verbose_names', '2022-06-17 14:35:09.960574'),
(18, 'admin_interface', '0013_add_related_modal_close_button', '2022-06-17 14:35:10.261559'),
(19, 'admin_interface', '0014_name_unique', '2022-06-17 14:35:10.447536'),
(20, 'admin_interface', '0015_add_language_chooser_active', '2022-06-17 14:35:10.620542'),
(21, 'admin_interface', '0016_add_language_chooser_display', '2022-06-17 14:35:10.757523'),
(22, 'admin_interface', '0017_change_list_filter_dropdown', '2022-06-17 14:35:10.791531'),
(23, 'admin_interface', '0018_theme_list_filter_sticky', '2022-06-17 14:35:10.981504'),
(24, 'admin_interface', '0019_add_form_sticky', '2022-06-17 14:35:11.370479'),
(25, 'admin_interface', '0020_module_selected_colors', '2022-06-17 14:35:11.650463'),
(26, 'admin_interface', '0021_file_extension_validator', '2022-06-17 14:35:11.707459'),
(27, 'admin_interface', '0022_add_logo_max_width_and_height', '2022-06-17 14:35:11.949447'),
(28, 'admin_interface', '0023_theme_foldable_apps', '2022-06-17 14:35:12.400420'),
(29, 'admin_interface', '0024_remove_theme_css', '2022-06-17 14:35:12.485424'),
(30, 'app', '0001_initial', '2022-06-17 14:35:19.374993'),
(31, 'contenttypes', '0002_remove_content_type_name', '2022-06-17 14:35:19.696989'),
(32, 'auth', '0002_alter_permission_name_max_length', '2022-06-17 14:35:19.874963'),
(33, 'auth', '0003_alter_user_email_max_length', '2022-06-17 14:35:19.967972'),
(34, 'auth', '0004_alter_user_username_opts', '2022-06-17 14:35:20.017966'),
(35, 'auth', '0005_alter_user_last_login_null', '2022-06-17 14:35:20.218942'),
(36, 'auth', '0006_require_contenttypes_0002', '2022-06-17 14:35:20.239940'),
(37, 'auth', '0007_alter_validators_add_error_messages', '2022-06-17 14:35:20.289950'),
(38, 'auth', '0008_alter_user_username_max_length', '2022-06-17 14:35:20.384937'),
(39, 'auth', '0009_alter_user_last_name_max_length', '2022-06-17 14:35:20.471926'),
(40, 'auth', '0010_alter_group_name_max_length', '2022-06-17 14:35:20.586921'),
(41, 'auth', '0011_update_proxy_permissions', '2022-06-17 14:35:20.734910'),
(42, 'auth', '0012_alter_user_first_name_max_length', '2022-06-17 14:35:20.833907'),
(43, 'sessions', '0001_initial', '2022-06-17 14:35:21.225884');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('45lxyyrbuti2mk6cxas7krmkqmt42ags', '.eJxVjEEOwiAQRe_C2hBGoA4u3XuGZhgGqRpISrsy3l2bdKHb_977LzXSupRx7TKPU1JnBerwu0Xih9QNpDvVW9Pc6jJPUW-K3mnX15bkedndv4NCvXxrtk6sQ39ChGjBOYmGAqARGwDSQNEHtB4CReREnEloyJxdCsYfEdT7A8ueN9E:1o2DDt:qHL3Ws0s57h0iYGypYKQ-ZiWn5phS6MUweWBXwWY0C4', '2022-07-01 14:45:21.783686');

-- --------------------------------------------------------

--
-- Table structure for table `product_category`
--

CREATE TABLE `product_category` (
  `productId` bigint(20) NOT NULL,
  `categoryId` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_interface_theme`
--
ALTER TABLE `admin_interface_theme`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_interface_theme_name_30bda70f_uniq` (`name`);

--
-- Indexes for table `app_brand`
--
ALTER TABLE `app_brand`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_breed`
--
ALTER TABLE `app_breed`
  ADD PRIMARY KEY (`breed_name`);

--
-- Indexes for table `app_category`
--
ALTER TABLE `app_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app_category_parentId_a1e1153a_fk_app_category_id` (`parentId`);

--
-- Indexes for table `app_customer`
--
ALTER TABLE `app_customer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `mobile` (`mobile`);

--
-- Indexes for table `app_immunizationhistory`
--
ALTER TABLE `app_immunizationhistory`
  ADD PRIMARY KEY (`pet_id`),
  ADD UNIQUE KEY `app_immunizationhistory_pet_id_pet_age_b0ea8ef7_uniq` (`pet_id`,`pet_age`);

--
-- Indexes for table `app_immunizationhistory_vaccine`
--
ALTER TABLE `app_immunizationhistory_vaccine`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `app_immunizationhistory__immunizationhistory_id_v_dadd0ad6_uniq` (`immunizationhistory_id`,`vaccine_id`),
  ADD KEY `app_immunizationhist_vaccine_id_31f29c63_fk_app_vacci` (`vaccine_id`);

--
-- Indexes for table `app_item`
--
ALTER TABLE `app_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app_item_orderId_fe01a7dc_fk_app_order_id` (`orderId`),
  ADD KEY `app_item_productId_474bf06c_fk_app_product_id` (`productId`),
  ADD KEY `app_item_supplierId_2843372b_fk_app_customer_id` (`supplierId`),
  ADD KEY `app_item_brandId_7f5fae63_fk_app_brand_id` (`brandId`);

--
-- Indexes for table `app_medicalhistory`
--
ALTER TABLE `app_medicalhistory`
  ADD PRIMARY KEY (`pet_id`);

--
-- Indexes for table `app_order`
--
ALTER TABLE `app_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app_order_userId_4e2d326b_fk_app_customer_id` (`userId`);

--
-- Indexes for table `app_orderitem`
--
ALTER TABLE `app_orderitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app_orderitem_itemId_28ae16c4_fk_app_item_id` (`itemId`),
  ADD KEY `app_orderitem_orderId_e8ca5ade_fk_app_order_id` (`orderId`),
  ADD KEY `app_orderitem_productId_8dbef1c0_fk_app_product_id` (`productId`);

--
-- Indexes for table `app_pet`
--
ALTER TABLE `app_pet`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `owner` (`owner`),
  ADD KEY `app_pet_breed_id_e6feb058_fk_app_breed_breed_name` (`breed_id`);

--
-- Indexes for table `app_product`
--
ALTER TABLE `app_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_productmeta`
--
ALTER TABLE `app_productmeta`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `app_productmeta_productId_key_b81deebf_uniq` (`productId`,`key`);

--
-- Indexes for table `app_transaction`
--
ALTER TABLE `app_transaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app_transaction_orderId_b40841fe_fk_app_order_id` (`orderId`),
  ADD KEY `app_transaction_userId_1c7df56d_fk_app_customer_id` (`userId`);

--
-- Indexes for table `app_vaccine`
--
ALTER TABLE `app_vaccine`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `product_category`
--
ALTER TABLE `product_category`
  ADD PRIMARY KEY (`productId`),
  ADD UNIQUE KEY `product_category_productId_categoryId_9a16ec49_uniq` (`productId`,`categoryId`),
  ADD KEY `product_category_categoryId_8e79224c_fk_app_category_id` (`categoryId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_interface_theme`
--
ALTER TABLE `admin_interface_theme`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `app_brand`
--
ALTER TABLE `app_brand`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_category`
--
ALTER TABLE `app_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_customer`
--
ALTER TABLE `app_customer`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_immunizationhistory_vaccine`
--
ALTER TABLE `app_immunizationhistory_vaccine`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_item`
--
ALTER TABLE `app_item`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_order`
--
ALTER TABLE `app_order`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_orderitem`
--
ALTER TABLE `app_orderitem`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_pet`
--
ALTER TABLE `app_pet`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_product`
--
ALTER TABLE `app_product`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_productmeta`
--
ALTER TABLE `app_productmeta`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_transaction`
--
ALTER TABLE `app_transaction`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `app_category`
--
ALTER TABLE `app_category`
  ADD CONSTRAINT `app_category_parentId_a1e1153a_fk_app_category_id` FOREIGN KEY (`parentId`) REFERENCES `app_category` (`id`);

--
-- Constraints for table `app_immunizationhistory`
--
ALTER TABLE `app_immunizationhistory`
  ADD CONSTRAINT `app_immunizationhistory_pet_id_e3fb7804_fk_app_pet_id` FOREIGN KEY (`pet_id`) REFERENCES `app_pet` (`id`);

--
-- Constraints for table `app_immunizationhistory_vaccine`
--
ALTER TABLE `app_immunizationhistory_vaccine`
  ADD CONSTRAINT `app_immunizationhist_immunizationhistory__40facf1d_fk_app_immun` FOREIGN KEY (`immunizationhistory_id`) REFERENCES `app_immunizationhistory` (`pet_id`),
  ADD CONSTRAINT `app_immunizationhist_vaccine_id_31f29c63_fk_app_vacci` FOREIGN KEY (`vaccine_id`) REFERENCES `app_vaccine` (`name`);

--
-- Constraints for table `app_item`
--
ALTER TABLE `app_item`
  ADD CONSTRAINT `app_item_brandId_7f5fae63_fk_app_brand_id` FOREIGN KEY (`brandId`) REFERENCES `app_brand` (`id`),
  ADD CONSTRAINT `app_item_orderId_fe01a7dc_fk_app_order_id` FOREIGN KEY (`orderId`) REFERENCES `app_order` (`id`),
  ADD CONSTRAINT `app_item_productId_474bf06c_fk_app_product_id` FOREIGN KEY (`productId`) REFERENCES `app_product` (`id`),
  ADD CONSTRAINT `app_item_supplierId_2843372b_fk_app_customer_id` FOREIGN KEY (`supplierId`) REFERENCES `app_customer` (`id`);

--
-- Constraints for table `app_medicalhistory`
--
ALTER TABLE `app_medicalhistory`
  ADD CONSTRAINT `app_medicalhistory_pet_id_a2b14484_fk_app_pet_id` FOREIGN KEY (`pet_id`) REFERENCES `app_pet` (`id`);

--
-- Constraints for table `app_order`
--
ALTER TABLE `app_order`
  ADD CONSTRAINT `app_order_userId_4e2d326b_fk_app_customer_id` FOREIGN KEY (`userId`) REFERENCES `app_customer` (`id`);

--
-- Constraints for table `app_orderitem`
--
ALTER TABLE `app_orderitem`
  ADD CONSTRAINT `app_orderitem_itemId_28ae16c4_fk_app_item_id` FOREIGN KEY (`itemId`) REFERENCES `app_item` (`id`),
  ADD CONSTRAINT `app_orderitem_orderId_e8ca5ade_fk_app_order_id` FOREIGN KEY (`orderId`) REFERENCES `app_order` (`id`),
  ADD CONSTRAINT `app_orderitem_productId_8dbef1c0_fk_app_product_id` FOREIGN KEY (`productId`) REFERENCES `app_product` (`id`);

--
-- Constraints for table `app_pet`
--
ALTER TABLE `app_pet`
  ADD CONSTRAINT `app_pet_breed_id_e6feb058_fk_app_breed_breed_name` FOREIGN KEY (`breed_id`) REFERENCES `app_breed` (`breed_name`);

--
-- Constraints for table `app_productmeta`
--
ALTER TABLE `app_productmeta`
  ADD CONSTRAINT `app_productmeta_productId_81b6a821_fk_app_product_id` FOREIGN KEY (`productId`) REFERENCES `app_product` (`id`);

--
-- Constraints for table `app_transaction`
--
ALTER TABLE `app_transaction`
  ADD CONSTRAINT `app_transaction_orderId_b40841fe_fk_app_order_id` FOREIGN KEY (`orderId`) REFERENCES `app_order` (`id`),
  ADD CONSTRAINT `app_transaction_userId_1c7df56d_fk_app_customer_id` FOREIGN KEY (`userId`) REFERENCES `app_customer` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `product_category`
--
ALTER TABLE `product_category`
  ADD CONSTRAINT `product_category_categoryId_8e79224c_fk_app_category_id` FOREIGN KEY (`categoryId`) REFERENCES `app_category` (`id`),
  ADD CONSTRAINT `product_category_productId_a19e7b26_fk_app_product_id` FOREIGN KEY (`productId`) REFERENCES `app_product` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
