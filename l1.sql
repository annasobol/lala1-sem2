-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Апр 06 2021 г., 18:48
-- Версия сервера: 10.1.38-MariaDB
-- Версия PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `l1`
--
CREATE DATABASE IF NOT EXISTS `l1` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `l1`;

-- --------------------------------------------------------

--
-- Структура таблицы `client`
--

CREATE TABLE `client` (
  `id_client` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `ip` varchar(20) NOT NULL,
  `balance` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `client`
--

INSERT INTO `client` (`id_client`, `name`, `login`, `password`, `ip`, `balance`) VALUES
(1, 'Bob', 'bob111', 'passord', '127.255.255.255', '500'),
(2, 'Alice', 'wonderland', '12345', '127.0.0.1', '666'),
(3, 'Eve', 'eve', 'varchar', '100.255.255.12', '-10');

-- --------------------------------------------------------

--
-- Структура таблицы `seanse`
--

CREATE TABLE `seanse` (
  `id_seanse` int(11) NOT NULL,
  `start` datetime NOT NULL,
  `stop` datetime NOT NULL,
  `in_traffic` int(11) NOT NULL,
  `out_traffic` int(11) NOT NULL,
  `fid_client` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `seanse`
--

INSERT INTO `seanse` (`id_seanse`, `start`, `stop`, `in_traffic`, `out_traffic`, `fid_client`) VALUES
(1, '2021-04-04 00:00:00', '2021-04-22 10:06:00', 5000, 250, 2),
(2, '2021-04-21 09:00:00', '2021-04-29 23:17:00', 6400, 1500, 2),
(3, '2021-04-08 00:00:00', '2021-04-08 15:00:00', 600, 24, 1),
(4, '2021-04-09 06:00:00', '2021-04-21 00:00:00', 7000, 268, 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id_client`) USING BTREE;

--
-- Индексы таблицы `seanse`
--
ALTER TABLE `seanse`
  ADD PRIMARY KEY (`id_seanse`),
  ADD KEY `fid_client` (`fid_client`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `client`
--
ALTER TABLE `client`
  MODIFY `id_client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `seanse`
--
ALTER TABLE `seanse`
  MODIFY `id_seanse` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `seanse`
--
ALTER TABLE `seanse`
  ADD CONSTRAINT `seanse_ibfk_1` FOREIGN KEY (`fid_client`) REFERENCES `client` (`id_client`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
