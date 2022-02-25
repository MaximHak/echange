-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Фев 25 2022 г., 11:34
-- Версия сервера: 10.4.20-MariaDB
-- Версия PHP: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `exchange`
--

-- --------------------------------------------------------

--
-- Структура таблицы `event_tabel`
--

CREATE TABLE `event_tabel` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `name` varchar(50) NOT NULL,
  `char_code` varchar(50) NOT NULL,
  `value` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `event_tabel`
--

INSERT INTO `event_tabel` (`id`, `date`, `name`, `char_code`, `value`) VALUES
(1, '2022-02-24', 'Dram armenesc', 'AMD', 0.3745),
(3, '2022-02-24', 'Dolar australian', 'AUD', 13.0272),
(4, '2022-02-24', 'Manat azer', 'AZN', 10.5829),
(6, '2022-02-24', 'Leva bulgara', 'BGN', 10.4113),
(8, '2022-02-24', 'Dolar canadian', 'CAD', 14.1147),
(9, '2022-02-24', 'Franc elvetian', 'CHF', 19.5167),
(10, '2022-02-24', 'Coroana ceha', 'CZK', 0.8309),
(12, '2022-02-24', 'Coroana daneza', 'DKK', 2.7366),
(17, '2022-02-24', 'Lira sterlina', 'GBP', 24.3863),
(18, '2022-02-24', 'Lari georgian', 'GEL', 5.9776),
(20, '2022-02-24', 'Kuna croata', 'HRK', 2.7013),
(21, '2022-02-24', 'Forint ungar', 'HUF', 5.7054),
(23, '2022-02-24', 'Coroana islandeza', 'ISK', 1.4417),
(25, '2022-02-24', 'Yen japonez', 'JPY', 15.5951),
(26, '2022-02-24', 'Som kirghiz', 'KGS', 2.1175),
(27, '2022-02-24', 'Tenghe kazah', 'KZT', 0.4102),
(32, '2022-02-24', 'Coroana norvegiana', 'NOK', 2.0291),
(33, '2022-02-24', 'Zlot polonez', 'PLN', 4.4784),
(35, '2022-02-24', 'Leu romanesc', 'RON', 4.115),
(36, '2022-02-24', 'Rubla ruseasca', 'RUB', 0.2249),
(37, '2022-02-24', 'Coroana suedeza', 'SEK', 1.9265),
(42, '2022-02-24', 'Lira turceasca', 'TRY', 1.2978),
(43, '2022-02-24', 'Hrivna ucraineana', 'UAH', 0.6112),
(44, '2022-02-24', 'Dolar S.U.A.', 'USD', 17.9476),
(45, '2022-02-24', 'Sum uzbek', 'UZS', 0.1653),
(46, '2022-02-24', 'D.S.T.', 'XDR', 25.1728),
(47, '2022-02-24', 'Euro', 'EUR', 20.3561),
(48, '2022-02-24', 'Dinar sirb', 'RSD', 17.3093),
(49, '2022-02-24', 'Shekel israelian', 'ILS', 5.5693),
(50, '2022-02-24', 'Rubla belarusa', 'BYN', 6.7856),
(51, '2022-02-24', 'Somoni tadjic', 'TJS', 1.5945),
(53, '2022-02-24', 'Dolar neozeelandez', 'NZD', 12.1739),
(54, '2022-02-24', 'Yuan Renminbi chinezesc', 'CNY', 2.8411),
(56, '2022-02-24', 'Ringgit malayezian', 'MYR', 4.2891),
(59, '2022-02-24', 'Dinar kuweitian', 'KWD', 59.3368),
(60, '2022-02-24', 'Manat turkmen', 'TMT', 5.1279),
(61, '2022-02-24', 'Dirham E.A.U.', 'AED', 4.8864),
(62, '2022-02-24', 'Denar macedonian', 'MKD', 3.3035),
(63, '2022-02-24', 'Dolar Hong Kong', 'HKD', 2.2997),
(64, '2022-02-24', 'Lek albanez', 'ALL', 1.6781),
(65, '2022-02-24', 'Rupia indiana', 'INR', 2.4069),
(66, '2022-02-24', 'Won sud-coreean', 'KRW', 1.5038);

-- --------------------------------------------------------

--
-- Структура таблицы `exch_tabel`
--

CREATE TABLE `exch_tabel` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `name` varchar(50) NOT NULL,
  `char_code` varchar(50) NOT NULL,
  `value` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `exch_tabel`
--

INSERT INTO `exch_tabel` (`id`, `date`, `name`, `char_code`, `value`) VALUES
(1, '2022-02-25', 'Dram armenesc', 'AMD', 0.3749),
(3, '2022-02-25', 'Dolar australian', 'AUD', 12.9347),
(4, '2022-02-25', 'Manat azer', 'AZN', 10.6218),
(6, '2022-02-25', 'Leva bulgara', 'BGN', 10.3032),
(8, '2022-02-25', 'Dolar canadian', 'CAD', 14.0712),
(9, '2022-02-25', 'Franc elvetian', 'CHF', 19.5307),
(10, '2022-02-25', 'Coroana ceha', 'CZK', 0.8085),
(12, '2022-02-25', 'Coroana daneza', 'DKK', 2.7083),
(17, '2022-02-25', 'Lira sterlina', 'GBP', 24.1651),
(18, '2022-02-25', 'Lari georgian', 'GEL', 5.725),
(20, '2022-02-25', 'Kuna croata', 'HRK', 2.6683),
(21, '2022-02-25', 'Forint ungar', 'HUF', 5.5088),
(23, '2022-02-25', 'Coroana islandeza', 'ISK', 1.4179),
(25, '2022-02-25', 'Yen japonez', 'JPY', 15.7122),
(26, '2022-02-25', 'Som kirghiz', 'KGS', 2.128),
(27, '2022-02-25', 'Tenghe kazah', 'KZT', 0.385),
(32, '2022-02-25', 'Coroana norvegiana', 'NOK', 1.9966),
(33, '2022-02-25', 'Zlot polonez', 'PLN', 4.3421),
(35, '2022-02-25', 'Leu romanesc', 'RON', 4.0717),
(36, '2022-02-25', 'Rubla ruseasca', 'RUB', 0.2153),
(37, '2022-02-25', 'Coroana suedeza', 'SEK', 1.8825),
(42, '2022-02-25', 'Lira turceasca', 'TRY', 1.2498),
(43, '2022-02-25', 'Hrivna ucraineana', 'UAH', 0.5923),
(44, '2022-02-25', 'Dolar S.U.A.', 'USD', 18.0337),
(45, '2022-02-25', 'Sum uzbek', 'UZS', 0.1664),
(46, '2022-02-25', 'D.S.T.', 'XDR', 25.1524),
(47, '2022-02-25', 'Euro', 'EUR', 20.1519),
(48, '2022-02-25', 'Dinar sirb', 'RSD', 17.1305),
(49, '2022-02-25', 'Shekel israelian', 'ILS', 5.5123),
(50, '2022-02-25', 'Rubla belarusa', 'BYN', 6.4531),
(51, '2022-02-25', 'Somoni tadjic', 'TJS', 1.6016),
(53, '2022-02-25', 'Dolar neozeelandez', 'NZD', 12.0799),
(54, '2022-02-25', 'Yuan Renminbi chinezesc', 'CNY', 2.8496),
(56, '2022-02-25', 'Ringgit malayezian', 'MYR', 4.2881),
(59, '2022-02-25', 'Dinar kuweitian', 'KWD', 59.5486),
(60, '2022-02-25', 'Manat turkmen', 'TMT', 5.1525),
(61, '2022-02-25', 'Dirham E.A.U.', 'AED', 4.9098),
(62, '2022-02-25', 'Denar macedonian', 'MKD', 3.2712),
(63, '2022-02-25', 'Dolar Hong Kong', 'HKD', 2.3093),
(64, '2022-02-25', 'Lek albanez', 'ALL', 1.6615),
(65, '2022-02-25', 'Rupia indiana', 'INR', 2.3837),
(66, '2022-02-25', 'Won sud-coreean', 'KRW', 1.4998);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `event_tabel`
--
ALTER TABLE `event_tabel`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `exch_tabel`
--
ALTER TABLE `exch_tabel`
  ADD PRIMARY KEY (`id`);

DELIMITER $$
--
-- События
--
CREATE DEFINER=`root`@`localhost` EVENT `copy_exchange` ON SCHEDULE EVERY 1 DAY STARTS '2022-02-25 12:25:30' ON COMPLETION NOT PRESERVE ENABLE DO INSERT INTO event_tabel (id, date, name, char_code, value) VALUES ('47','2022-02-24','Euro','EUR','20.3561');$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
