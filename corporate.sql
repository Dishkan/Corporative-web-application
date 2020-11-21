-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Ноя 21 2020 г., 14:12
-- Версия сервера: 8.0.19
-- Версия PHP: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `corporate`
--

-- --------------------------------------------------------

--
-- Структура таблицы `articles`
--

CREATE TABLE `articles` (
  `id` int UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int UNSIGNED NOT NULL DEFAULT '1',
  `category_id` int UNSIGNED NOT NULL DEFAULT '1',
  `keywords` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_desc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `articles`
--

INSERT INTO `articles` (`id`, `title`, `text`, `desc`, `alias`, `img`, `created_at`, `updated_at`, `user_id`, `category_id`, `keywords`, `meta_desc`) VALUES
(1, 'This is the title of the first article. Enjoy it', '<p>Fusce rutrum lectus id nibh ullamcorper aliquet. Pellentesque pretium mauris et augue fringilla non bibendum turpis iaculis. Donec sit amet nunc lorem. Sed fringilla vehicula est at pellentesque. Aenean imperdiet elementum arcu id facilisis. Mauris sed leo eros.</p>\\n<p>Duis nulla purus, malesuada in gravida sed, viverra at elit. Praesent nec purus sem, non imperdiet quam. Praesent tincidunt tortor eu libero scelerisque quis consequat justo elementum. Maecenas aliquet facilisis ipsum, commodo eleifend odio ultrices et. Maecenas arcu arcu, luctus a laoreet et, fermentum vel lectus. Cras consectetur ipsum venenatis ligula aliquam hendrerit. Suspendisse rhoncus hendrerit fermentum. Ut eget rhoncus purus.</p>\\n<p>Cras a tellus eu justo lobortis tristique et nec mauris. Etiam tincidunt tellus ut odio elementum adipiscing. Maecenas cursus dolor sit amet leo elementum ut semper velit lobortis. Pellentesque posue</p>\', \'Fusce nec accumsan eros. Aenean ac orci a magna vestibulum posuere quis nec nisi. Maecenas rutrum vehicula condimentum. Donec volutpat nisl ac mauris consectetur gravida.\\r\\n\\r\\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vel vulputate nibh. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.\\r\\n\\r\\nIn facilisis ornare arcu, sodales facilisis neque blandit ac. Ut blandit ipsum quis arcu adipiscing sit amet semper sem feugiat. Nam sed dapibus arcu. Nullam eleifend molestie lectus. Nullam nec risus purus\r\n', '<p>Fusce rutrum lectus id nibh ullamcorper aliquet. Pellentesque pretium mauris et augue fringilla non bibendum turpis iaculis. Donec sit amet nunc lorem. Sed fringilla vehicula est at pellentesque. Aenean imperdiet elementum arcu id facilisis. Mauris sed leo eros.</p>', 'article-1', '{\"mini\":\"003-55x55.jpg \",\"max\":\"003-816x282.jpg \",\"path\":\"0081-700x345.jpg\"}', '2020-10-18 13:23:53', NULL, 1, 1, 'some key_words', 'some desc'),
(2, 'Nice & Clean. The best for your blog!', '<p>Fusce rutrum lectus id nibh ullamcorper aliquet. Pellentesque pretium mauris et augue fringilla non bibendum turpis iaculis. Donec sit amet nunc lorem. Sed fringilla vehicula est at pellentesque. Aenean imperdiet elementum arcu id facilisis. Mauris sed leo eros.</p>\\n<p>Duis nulla purus, malesuada in gravida sed, viverra at elit. Praesent nec purus sem, non imperdiet quam. Praesent tincidunt tortor eu libero scelerisque quis consequat justo elementum. Maecenas aliquet facilisis ipsum, commodo eleifend odio ultrices et. Maecenas arcu arcu, luctus a laoreet et, fermentum vel lectus. Cras consectetur ipsum venenatis ligula aliquam hendrerit. Suspendisse rhoncus hendrerit fermentum. Ut eget rhoncus purus.</p>\\n<p>Cras a tellus eu justo lobortis tristique et nec mauris. Etiam tincidunt tellus ut odio elementum adipiscing. Maecenas cursus dolor sit amet leo elementum ut semper velit lobortis. Pellentesque posue</p>\', \'Fusce nec accumsan eros. Aenean ac orci a magna vestibulum posuere quis nec nisi. Maecenas rutrum vehicula condimentum. Donec volutpat nisl ac mauris consectetur gravida.\\r\\n\\r\\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vel vulputate nibh. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.\\r\\n\\r\\nIn facilisis ornare arcu, sodales facilisis neque blandit ac. Ut blandit ipsum quis arcu adipiscing sit amet semper sem feugiat. Nam sed dapibus arcu. Nullam eleifend molestie lectus. Nullam nec risus purus.\r\n', '<p>Fusce rutrum lectus id nibh ullamcorper aliquet. Pellentesque pretium mauris et augue fringilla non bibendum turpis iaculis. Donec sit amet nunc lorem. Sed fringilla vehicula est at pellentesque. Aenean imperdiet elementum arcu id facilisis. Mauris sed leo eros.</p>', 'article-2', '{\"mini\":\"001-55x55.png \",\"max\":\"001-816x282.png \",\"path\":\"0081-700x345.jpg\"}', '2020-10-15 13:23:53', NULL, 1, 2, 'some key_words', 'meta_desc'),
(3, 'Section shortcodes & sticky posts!', '<p>Fusce rutrum lectus id nibh ullamcorper aliquet. Pellentesque pretium mauris et augue fringilla non bibendum turpis iaculis. Donec sit amet nunc lorem. Sed fringilla vehicula est at pellentesque. Aenean imperdiet elementum arcu id facilisis. Mauris sed leo eros.</p>\\n<p>Duis nulla purus, malesuada in gravida sed, viverra at elit. Praesent nec purus sem, non imperdiet quam. Praesent tincidunt tortor eu libero scelerisque quis consequat justo elementum. Maecenas aliquet facilisis ipsum, commodo eleifend odio ultrices et. Maecenas arcu arcu, luctus a laoreet et, fermentum vel lectus. Cras consectetur ipsum venenatis ligula aliquam hendrerit. Suspendisse rhoncus hendrerit fermentum. Ut eget rhoncus purus.</p>\\n<p>Cras a tellus eu justo lobortis tristique et nec mauris. Etiam tincidunt tellus ut odio elementum adipiscing. Maecenas cursus dolor sit amet leo elementum ut semper velit lobortis. Pellentesque posue</p>\', \'Fusce nec accumsan eros. Aenean ac orci a magna vestibulum posuere quis nec nisi. Maecenas rutrum vehicula condimentum. Donec volutpat nisl ac mauris consectetur gravida.\\r\\n\\r\\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vel vulputate nibh. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.\\r\\n\\r\\nIn facilisis ornare arcu, sodales facilisis neque blandit ac. Ut blandit ipsum quis arcu adipiscing sit amet semper sem feugiat. Nam sed dapibus arcu. Nullam eleifend molestie lectus. Nullam nec risus purus.\r\n', '<p>Fusce rutrum lectus id nibh ullamcorper aliquet. Pellentesque pretium mauris et augue fringilla non bibendum turpis iaculis. Donec sit amet nunc lorem. Sed fringilla vehicula est at pellentesque. Aenean imperdiet elementum arcu id facilisis. Mauris sed leo eros.</p>', 'article-3', '{\"mini\":\"0037-55x55.jpg \",\"max\":\"00212-816x282.jpg \",\"path\":\"0081-700x345.jpg\"}', '2020-10-20 13:23:53', NULL, 1, 1, 'some key_words', 'meta_desc'),
(4, 'Просто текст', '<p>Просто текст</p>', '<p>Просто текст</p>', 'prosto-tekst', '{\"mini\":\"6PE9Fpl0_mini.jpg\",\"max\":\"6PE9Fpl0_max.jpg\",\"path\":\"6PE9Fpl0.jpg\"}', '2020-11-06 06:09:45', '2020-11-06 06:09:45', 1, 2, 'Просто текст', 'Просто текст'),
(5, 'Some text', '<p>Some text</p>', '<p>Some text</p>', 'Some-text', '{\"mini\":\"z6jX1po1_mini.jpg\",\"max\":\"z6jX1po1_max.jpg\",\"path\":\"z6jX1po1.jpg\"}', '2020-11-06 06:11:45', '2020-11-11 07:35:09', 1, 3, 'Some text', 'Some text');

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int NOT NULL DEFAULT '0',
  `alias` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `title`, `parent_id`, `alias`, `created_at`, `updated_at`) VALUES
(1, 'Блог', 0, 'blog', NULL, NULL),
(2, 'Компьютеры', 1, 'computers', NULL, NULL),
(3, 'Интересное', 1, 'iteresting', NULL, NULL),
(4, 'Советы', 1, 'soveti', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE `comments` (
  `id` int UNSIGNED NOT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `site` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `article_id` int UNSIGNED NOT NULL DEFAULT '1',
  `user_id` int UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `comments`
--

INSERT INTO `comments` (`id`, `text`, `name`, `email`, `site`, `parent_id`, `created_at`, `updated_at`, `article_id`, `user_id`) VALUES
(1, 'Hello world!', 'Mark Zuckerberg', 'DH.17@mail.ru', 'https://www.facebook.com/', 0, NULL, NULL, 1, NULL),
(2, 'Hello world!', 'Bill Gates', 'email@mail.ru', 'https://www.google.com/', 0, NULL, NULL, 1, NULL),
(3, 'Hi there!', 'Elon Musk', 'email@mail.ru', 'https://twitter.com/', 1, '2020-10-24 19:21:15', NULL, 1, NULL),
(4, 'What`s up?', 'Pavel Durov', 'email@mail.ru', 'https://web.telegram.org/', 3, '2020-10-24 19:21:15', NULL, 1, NULL),
(5, 'What is going on?', 'Donald Trump', 'email@mail.ru', 'https://www.trump.com/', 4, '2020-10-24 19:25:23', NULL, 1, NULL),
(6, 'I am an Admin', 'Dishkan', 'user@mail.ru', 'dishkan.com', 5, '2020-10-25 09:11:17', NULL, 1, 1),
(7, 'aaaaaaaa', 'Logan', 'LG.18@mail.ru', 'sss', 0, '2020-10-26 12:05:52', '2020-10-26 12:05:52', 1, NULL),
(8, 'wwwwwwww', 'qweqweq', 'DH.17@mail.ru', 'ddd', 0, '2020-10-26 12:06:24', '2020-10-26 12:06:24', 1, NULL),
(9, 'eeeeee', 'Laravel', 'LV.18@mail.ru', 'aaa', 0, '2020-10-26 12:08:55', '2020-10-26 12:08:55', 1, NULL),
(10, 'hiii broo', 'Boss', 'Boss.@mail.ru', 'www', 7, '2020-10-26 12:23:01', '2020-10-26 12:23:01', 1, NULL),
(11, 'qqqqqq', 'qweqweq', 'DH.17@mail.ru', 'qq', 0, '2020-10-26 12:25:49', '2020-10-26 12:25:49', 1, NULL),
(13, 'How are you Bill?', 'Bruce', 'Bruce@mail.ru', 'bruceli,com', 2, '2020-10-26 13:10:00', '2020-10-26 13:10:00', 1, NULL),
(14, 'appppppppppp', 'zxczxc', 'wqeqe', 'eeee', 13, '2020-10-26 13:13:41', '2020-10-26 13:13:41', 1, NULL),
(15, 'ggggggggg', 'wwwwww', 'qqqqqqq', 'rrrrrrr', 0, '2020-10-26 14:17:57', '2020-10-26 14:17:57', 1, NULL),
(16, 'aaaaaaaaaa', 'qweqweq', 'DH.17@mail.ru', 'sss', 2, '2020-10-29 07:33:22', '2020-10-29 07:33:22', 1, NULL),
(17, 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa111111111111111111111111', 'Laravel', 'LV.18@mail.ru', 'ss', 0, '2020-10-29 07:35:26', '2020-10-29 07:35:26', 1, NULL),
(18, 'wwwwwwwwwwwwwwweeqweqweqe', 'Umka', 'asdasd', 'sssss', 17, '2020-10-29 07:35:51', '2020-10-29 07:35:51', 1, NULL),
(19, 'asdasdadd', 'Boss', 'Boss.@mail.ru', 'www', 18, '2020-11-06 11:14:10', '2020-11-06 11:14:10', 1, NULL),
(20, 'wwwwwwwwww', 'Dishkan', 'DH.17@mail.ru', 'sss', 0, '2020-11-06 11:27:07', '2020-11-06 11:27:07', 2, NULL),
(21, 'aaaaaaaaaaaa', 'zxczxc', 'wwwwwwwww', 'dddddd', 0, '2020-11-06 11:27:28', '2020-11-06 11:27:28', 2, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `filters`
--

CREATE TABLE `filters` (
  `id` int UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `filters`
--

INSERT INTO `filters` (`id`, `title`, `alias`, `created_at`, `updated_at`) VALUES
(1, 'Brand Identity', 'brand-identity', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `menus`
--

CREATE TABLE `menus` (
  `id` int UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `menus`
--

INSERT INTO `menus` (`id`, `title`, `path`, `parent`, `created_at`, `updated_at`) VALUES
(1, 'Главная', 'http://company.loc', 0, NULL, NULL),
(2, 'Блог', 'http://company.loc/articles', 0, NULL, NULL),
(3, 'Компьютеры', 'http://company.loc/articles/cat/computers', 2, NULL, '2020-11-10 05:41:36'),
(4, 'Интересное', 'http://company.loc/articles/cat/iteresting', 2, NULL, '2020-11-10 05:41:43'),
(5, 'Советы', 'http://company.loc/articles/cat/soveti', 2, NULL, '2020-11-10 05:41:50'),
(6, 'Портфолио', 'http://company.loc/portfolios', 0, NULL, NULL),
(7, 'Контакты', 'http://company.loc/contacts', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2020_10_16_184008_create_sessions_table', 1),
(7, '2020_10_17_111243_create_articles_table', 1),
(8, '2020_10_17_113340_create_portfolios_table', 1),
(9, '2020_10_17_114754_create_filters_table', 1),
(10, '2020_10_17_152244_create_comments_table', 1),
(11, '2020_10_17_165406_create_sliders_table', 1),
(12, '2020_10_17_165655_create_menus_table', 1),
(13, '2020_10_17_165915_create_categories_table', 1),
(14, '2020_10_18_063527_change_articles_table', 2),
(15, '2020_10_18_064011_change_comments_table', 2),
(16, '2020_10_18_064211_change_portfolios_table', 2),
(17, '2020_10_26_185644_change__artickles__table2', 3),
(18, '2020_10_29_154726_change_portfolios_table2', 4),
(19, '2020_11_01_171928_create_roles_table', 5),
(20, '2020_11_01_172909_create_permissions_table', 5),
(21, '2020_11_01_173149_create_permission_role_table', 5),
(22, '2020_11_01_174148_create_role_user_table', 5),
(23, '2020_11_01_183829_change_role_user_table', 6),
(24, '2020_11_01_184121_change_permission_role_table', 6);

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `permissions`
--

CREATE TABLE `permissions` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'VIEW_ADMIN', NULL, NULL),
(2, 'ADD_ARTICLES', NULL, NULL),
(3, 'UPDATE_ARTICLES', NULL, NULL),
(4, 'DELETE_ARTICLES', NULL, NULL),
(5, 'ADMIN_USERS', NULL, NULL),
(6, 'VIEW_ADMIN_ARTICLES', NULL, NULL),
(7, 'EDIT_USERS', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `permission_role`
--

CREATE TABLE `permission_role` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role_id` int UNSIGNED NOT NULL DEFAULT '1',
  `permission_id` int UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `permission_role`
--

INSERT INTO `permission_role` (`id`, `created_at`, `updated_at`, `role_id`, `permission_id`) VALUES
(1, NULL, NULL, 1, 1),
(2, NULL, NULL, 1, 2),
(3, NULL, NULL, 1, 3),
(4, NULL, NULL, 1, 4),
(5, NULL, NULL, 1, 5),
(7, NULL, NULL, 1, 7),
(8, NULL, NULL, 2, 2),
(10, NULL, NULL, 1, 6);

-- --------------------------------------------------------

--
-- Структура таблицы `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `portfolios`
--

CREATE TABLE `portfolios` (
  `id` int UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `filter_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keywords` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_desc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `portfolios`
--

INSERT INTO `portfolios` (`id`, `title`, `text`, `customer`, `alias`, `img`, `created_at`, `updated_at`, `filter_alias`, `keywords`, `meta_desc`) VALUES
(1, 'Steep This!', 'Nullam volutpat, mauris scelerisque iaculis semper, justo odio rutrum urna, at cursus urna nisl et ipsum. Donec dapibus lacus nec sapien faucibus eget suscipit lorem mattis.\\r\\n\\r\\nDonec non mauris ac nulla consectetur pretium sit amet rhoncus neque. Maecenas aliquet, diam sed rhoncus vestibulum, sem lacus ultrices est, eu hendrerit tortor nulla in dui. Suspendisse enim purus, euismod interdum viverra eget, ultricies eu est. Maecenas dignissim mauris id est semper suscipit. Suspendisse venenatis vestibulum quam, quis porttitor arcu vestibulum et.\\r\\n\\r\\nSed porttitor eros ut purus elementum a consectetur purus vulputate \r\n', 'Steep This!', 'project1', '{\"mini\":\"0061-175x175.jpg\",\"max\":\"0061-770x368.jpg\",\"path\":\"0061.jpg\"}', '2020-10-29 16:22:24', NULL, 'brand-identity', '', ''),
(2, 'Kineda', 'Nullam volutpat, mauris scelerisque iaculis semper, justo odio rutrum urna, at cursus urna nisl et ipsum. Donec dapibus lacus nec sapien faucibus eget suscipit lorem mattis.\\r\\n\\r\\nDonec non mauris ac nulla consectetur pretium sit amet rhoncus neque. Maecenas aliquet, diam sed rhoncus vestibulum, sem lacus ultrices est, eu hendrerit tortor nulla in dui. Suspendisse enim purus, euismod interdum viverra eget, ultricies eu est. Maecenas dignissim mauris id est semper suscipit. Suspendisse venenatis vestibulum quam, quis porttitor arcu vestibulum et.\\r\\n\\r\\nSed porttitor eros ut purus elementum a consectetur purus vulputate\r\n', 'customer2', 'project2', '{\"mini\":\"009-175x175.jpg\",\"max\":\"009-770x368.jpg\",\"path\":\"009.jpg\"}', '2020-10-30 16:22:32', NULL, 'brand-identity', '', ''),
(3, 'Love', 'Nullam volutpat, mauris scelerisque iaculis semper, justo odio rutrum urna, at cursus urna nisl et ipsum. Donec dapibus lacus nec sapien faucibus eget suscipit lorem mattis.\\r\\n\\r\\nDonec non mauris ac nulla consectetur pretium sit amet rhoncus neque. Maecenas aliquet, diam sed rhoncus vestibulum, sem lacus ultrices est, eu hendrerit tortor nulla in dui. Suspendisse enim purus, euismod interdum viverra eget, ultricies eu est. Maecenas dignissim mauris id est semper suscipit. Suspendisse venenatis vestibulum quam, quis porttitor arcu vestibulum et.\\r\\n\\r\\nSed porttitor eros ut purus elementum a consectetur purus vulputate\r\n', 'customer3', 'project3', '{\"mini\":\"0011-175x175.jpg\",\"max\":\"0043-770x368.jpg\",\"path\":\"0043.jpg\"}', '2020-10-13 16:22:36', NULL, 'brand-identity', '', ''),
(4, 'Guanacos', 'Nullam volutpat, mauris scelerisque iaculis semper, justo odio rutrum urna, at cursus urna nisl et ipsum. Donec dapibus lacus nec sapien faucibus eget suscipit lorem mattis.\\r\\n\\r\\nDonec non mauris ac nulla consectetur pretium sit amet rhoncus neque. Maecenas aliquet, diam sed rhoncus vestibulum, sem lacus ultrices est, eu hendrerit tortor nulla in dui. Suspendisse enim purus, euismod interdum viverra eget, ultricies eu est. Maecenas dignissim mauris id est semper suscipit. Suspendisse venenatis vestibulum quam, quis porttitor arcu vestibulum et.\\r\\n\\r\\nSed porttitor eros ut purus elementum a consectetur purus vulputate\r\n', 'customer4', 'project4', '{\"mini\":\"0027-175x175.jpg\",\"max\":\"0027-770x368.jpg\",\"path\":\"0027.jpg\"}', '2020-10-07 16:22:40', NULL, 'brand-identity', '', ''),
(5, 'Miller Bob', 'Nullam volutpat, mauris scelerisque iaculis semper, justo odio rutrum urna, at cursus urna nisl et ipsum. Donec dapibus lacus nec sapien faucibus eget suscipit lorem mattis.\\r\\n\\r\\nDonec non mauris ac nulla consectetur pretium sit amet rhoncus neque. Maecenas aliquet, diam sed rhoncus vestibulum, sem lacus ultrices est, eu hendrerit tortor nulla in dui. Suspendisse enim purus, euismod interdum viverra eget, ultricies eu est. Maecenas dignissim mauris id est semper suscipit. Suspendisse venenatis vestibulum quam, quis porttitor arcu vestibulum et.\\r\\n\\r\\nSed porttitor eros ut purus elementum a consectetur purus vulputate\r\n', 'customer5', 'project5', '{\"mini\":\"0071-175x175.jpg\",\"max\":\"0071-770x368.jpg\",\"path\":\"0071.jpg\"}', '2020-10-10 16:22:42', NULL, 'brand-identity', '', ''),
(6, 'Nili Studios', 'Nullam volutpat, mauris scelerisque iaculis semper, justo odio rutrum urna, at cursus urna nisl et ipsum. Donec dapibus lacus nec sapien faucibus eget suscipit lorem mattis.\\r\\n\\r\\nDonec non mauris ac nulla consectetur pretium sit amet rhoncus neque. Maecenas aliquet, diam sed rhoncus vestibulum, sem lacus ultrices est, eu hendrerit tortor nulla in dui. Suspendisse enim purus, euismod interdum viverra eget, ultricies eu est. Maecenas dignissim mauris id est semper suscipit. Suspendisse venenatis vestibulum quam, quis porttitor arcu vestibulum et.\\r\\n\\r\\nSed porttitor eros ut purus elementum a consectetur purus vulputate\r\n', 'customer6', 'project6', '{\"mini\":\"0052-175x175.jpg\",\"max\":\"0052-770x368.jpg\",\"path\":\"0052.jpg\"}', '2020-10-21 16:22:46', NULL, 'brand-identity', '', ''),
(7, 'VItale Premium', 'Nullam volutpat, mauris scelerisque iaculis semper, justo odio rutrum urna, at cursus urna nisl et ipsum. Donec dapibus lacus nec sapien faucibus eget suscipit lorem mattis.\\r\\n\\r\\nDonec non mauris ac nulla consectetur pretium sit amet rhoncus neque. Maecenas aliquet, diam sed rhoncus vestibulum, sem lacus ultrices est, eu hendrerit tortor nulla in dui. Suspendisse enim purus, euismod interdum viverra eget, ultricies eu est. Maecenas dignissim mauris id est semper suscipit. Suspendisse venenatis vestibulum quam, quis porttitor arcu vestibulum et.\\r\\n\\r\\nSed porttitor eros ut purus elementum a consectetur purus vulputate\r\n', 'customer7', 'project7', '{\"mini\":\"0081-175x175.jpg\",\"max\":\"0081-770x368.jpg\",\"path\":\"0081.jpg\"}', '2020-10-26 16:22:49', NULL, 'brand-identity', '', ''),
(8, 'Digitpool Medien', 'Nullam volutpat, mauris scelerisque iaculis semper, justo odio rutrum urna, at cursus urna nisl et ipsum. Donec dapibus lacus nec sapien faucibus eget suscipit lorem mattis.\\r\\n\\r\\nDonec non mauris ac nulla consectetur pretium sit amet rhoncus neque. Maecenas aliquet, diam sed rhoncus vestibulum, sem lacus ultrices est, eu hendrerit tortor nulla in dui. Suspendisse enim purus, euismod interdum viverra eget, ultricies eu est. Maecenas dignissim mauris id est semper suscipit. Suspendisse venenatis vestibulum quam, quis porttitor arcu vestibulum et.\\r\\n\\r\\nSed porttitor eros ut purus elementum a consectetur purus vulputate\r\n', 'customer8', 'project8', '{\"mini\":\"0071-175x175.jpg\",\"max\":\"0071.jpg\",\"path\":\"0071-770x368.jpg\"}', '2020-10-14 16:22:53', NULL, 'brand-identity', '', ''),
(9, 'Octopus', 'Nullam volutpat, mauris scelerisque iaculis semper, justo odio rutrum urna, at cursus urna nisl et ipsum. Donec dapibus lacus nec sapien faucibus eget suscipit lorem mattis.\\r\\n\\r\\nDonec non mauris ac nulla consectetur pretium sit amet rhoncus neque. Maecenas aliquet, diam sed rhoncus vestibulum, sem lacus ultrices est, eu hendrerit tortor nulla in dui. Suspendisse enim purus, euismod interdum viverra eget, ultricies eu est. Maecenas dignissim mauris id est semper suscipit. Suspendisse venenatis vestibulum quam, quis porttitor arcu vestibulum et.\\r\\n\\r\\nSed porttitor eros ut purus elementum a consectetur purus vulputate\r\n', 'customer9', 'project9', '{\"mini\":\"0081-175x175.jpg\",\"max\":\"0081.jpg\",\"path\":\"0081-770x368.jpg\"}', '2020-10-26 16:22:56', NULL, 'brand-identity', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `roles`
--

CREATE TABLE `roles` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', NULL, NULL),
(2, 'Moderator', NULL, NULL),
(3, 'Guest', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `role_user`
--

CREATE TABLE `role_user` (
  `id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int UNSIGNED NOT NULL DEFAULT '1',
  `role_id` int UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `role_user`
--

INSERT INTO `role_user` (`id`, `created_at`, `updated_at`, `user_id`, `role_id`) VALUES
(1, NULL, NULL, 1, 1),
(2, NULL, NULL, 2, 2),
(5, NULL, NULL, 3, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('5Y2kNjhFyUe6g5VXImvZMa5x5hetMJcJhMt6WFTL', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36 Edg/86.0.622.69', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR1dJZFdsUXZnSUd3U2dSaHptNmNhZEw2U0p3ZTlIS3VrQk5FRExkSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTg6Imh0dHA6Ly9jb21wYW55LmxvYyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1605956555),
('myhU3am1YtNSD6zgX2SGdGjyldixnAfTMkcdEBca', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36 Edg/86.0.622.63', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiemxQUHBBS0V3RmpaUnVxQVYyb05WSWc1UWVXdExFR21YZE9zNk4xciI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjM3OiJodHRwOi8vY29tcGFueS5sb2MvYXJ0aWNsZXMvYXJ0aWNsZS0xIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJHJZbzJoNUVZekZkVlQvRnA1QVNEdXUvMlJvSVFyN3UuZ2JzU1lBUnN5cFdwWVcvYTFnWHFpIjt9', 1605129205);

-- --------------------------------------------------------

--
-- Структура таблицы `sliders`
--

CREATE TABLE `sliders` (
  `id` int UNSIGNED NOT NULL,
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `sliders`
--

INSERT INTO `sliders` (`id`, `img`, `desc`, `title`, `created_at`, `updated_at`) VALUES
(1, 'xx.jpg', 'Nam id quam a odio euismod pellentesque. Etiam congue rutrum risus non vestibulum. Quisque a diam at ligula blandit consequat. Mauris ac mi velit, a tempor neque\r\n', '<h2 style=\"color:#fff\">CORPORATE, MULTIPURPOSE.. <br /><span>PINK RIO</span></h2>', NULL, NULL),
(2, '00314.jpg', 'Nam id quam a odio euismod pellentesque. Etiam congue rutrum risus non vestibulum. Quisque a diam at ligula blandit consequat. Mauris ac mi velit, a tempor neque\r\n', '<h2 style=\"color:#fff\">PINKRIO. <span>STRONG AND POWERFUL.</span></h2>', NULL, NULL),
(3, 'dd.jpg', 'Nam id quam a odio euismod pellentesque. Etiam congue rutrum risus non vestibulum. Quisque a diam at ligula blandit consequat. Mauris ac mi velit, a tempor neque\r\n', '<h2 style=\"color:#fff\">PINKRIO. <span>STRONG AND POWERFUL.</span></h2>', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint UNSIGNED DEFAULT NULL,
  `profile_photo_path` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(1, 'Dishkan', 'user@mail.ru', NULL, '$2y$10$rYo2h5EYzFdVT/Fp5ASDuu/2RoIQr7u.gbsSYARsypWpYW/a1gXqi', NULL, NULL, 'kItyc05OfHKunR0WL5MzyvAwWIIpvJlUrJgCqZxqEkxn0cR1hlJ1rXH8qBTE', NULL, NULL, '2020-10-18 07:22:37', '2020-10-18 07:22:37'),
(2, 'Timur', 'Timur@mail.ru', NULL, '$2y$10$4FplkirB3Ozfu3s1S5SKLe2bWP5A0ruS8bbmtm.y4EJe/LQkrSbaC', NULL, NULL, NULL, NULL, NULL, '2020-11-10 07:37:54', '2020-11-10 07:37:54'),
(3, 'Гость', 'Guest12@mail.ru', NULL, '$2y$10$MXaUKHjDJe9w1ZAdaWIUte45QpL9f/UCr9A/SZ72I2PGuZwERGD1q', NULL, NULL, NULL, NULL, NULL, '2020-11-10 07:41:31', '2020-11-10 07:43:05');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `articles_alias_unique` (`alias`),
  ADD KEY `articles_user_id_foreign` (`user_id`),
  ADD KEY `articles_category_id_foreign` (`category_id`);

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_alias_unique` (`alias`);

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_article_id_foreign` (`article_id`),
  ADD KEY `comments_user_id_foreign` (`user_id`);

--
-- Индексы таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Индексы таблицы `filters`
--
ALTER TABLE `filters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `filters_alias_unique` (`alias`);

--
-- Индексы таблицы `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Индексы таблицы `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permission_role_role_id_foreign` (`role_id`),
  ADD KEY `permission_role_permission_id_foreign` (`permission_id`);

--
-- Индексы таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Индексы таблицы `portfolios`
--
ALTER TABLE `portfolios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `portfolios_alias_unique` (`alias`),
  ADD KEY `portfolios_filter_alias_foreign` (`filter_alias`);

--
-- Индексы таблицы `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_user_user_id_foreign` (`user_id`),
  ADD KEY `role_user_role_id_foreign` (`role_id`);

--
-- Индексы таблицы `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Индексы таблицы `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT для таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `filters`
--
ALTER TABLE `filters`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT для таблицы `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `permission_role`
--
ALTER TABLE `permission_role`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `portfolios`
--
ALTER TABLE `portfolios`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `role_user`
--
ALTER TABLE `role_user`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `articles_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `articles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ограничения внешнего ключа таблицы `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_article_id_foreign` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`),
  ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ограничения внешнего ключа таблицы `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`),
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Ограничения внешнего ключа таблицы `portfolios`
--
ALTER TABLE `portfolios`
  ADD CONSTRAINT `portfolios_filter_alias_foreign` FOREIGN KEY (`filter_alias`) REFERENCES `filters` (`alias`);

--
-- Ограничения внешнего ключа таблицы `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
