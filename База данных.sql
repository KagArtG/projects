-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:62800
-- Время создания: Июл 21 2022 г., 17:26
-- Версия сервера: 8.0.24
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `vuz`
--

-- --------------------------------------------------------

--
-- Структура таблицы `bk_diplom`
--

CREATE TABLE `bk_diplom` (
  `ID_BkDiplom` int NOT NULL,
  `ID_Student` int NOT NULL,
  `ID_Prepodavateli` int NOT NULL,
  `Tema` varchar(40) NOT NULL,
  `Data_zachota` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `bk_gruppa`
--

CREATE TABLE `bk_gruppa` (
  `ID_BkGruppa` int NOT NULL,
  `Naim` varchar(40) NOT NULL,
  `ID_Kurs` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `bk_nagruzka_prepod`
--

CREATE TABLE `bk_nagruzka_prepod` (
  `ID_BkNagruxka_prepod` int NOT NULL,
  `ID_Prepod` int NOT NULL,
  `ID_Dichiplina` int NOT NULL,
  `Chasi` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `bk_prepod`
--

CREATE TABLE `bk_prepod` (
  `ID_BkPrepod` int NOT NULL,
  `Familia` varchar(40) NOT NULL,
  `Naim` varchar(40) NOT NULL,
  `Otchestvo` varchar(40) NOT NULL,
  `Kids` varchar(100) NOT NULL,
  `Kolvo_Kids` varchar(100) NOT NULL,
  `ZP` varchar(100) NOT NULL,
  `ID_Kategoria` int NOT NULL,
  `ID_Pol` int NOT NULL,
  `ID_Kafedra` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `bk_prepod`
--

INSERT INTO `bk_prepod` (`ID_BkPrepod`, `Familia`, `Naim`, `Otchestvo`, `Kids`, `Kolvo_Kids`, `ZP`, `ID_Kategoria`, `ID_Pol`, `ID_Kafedra`) VALUES
(1, 'Петров', 'Петя', 'Анатольевич', '+', '1', '70000', 2, 1, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `bk_provedenia_zanatia`
--

CREATE TABLE `bk_provedenia_zanatia` (
  `ID_BkProvedenia_zanatia` int NOT NULL,
  `ID_Gruppa` int NOT NULL,
  `ID_Prepodavateli` int NOT NULL,
  `ID_Dichiplina` int NOT NULL,
  `ID_Vid_Zanatia` int NOT NULL,
  `Data_Provedenia` date NOT NULL,
  `Vremya_Provedenia` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `bk_student`
--

CREATE TABLE `bk_student` (
  `ID_BkStudent` int NOT NULL,
  `Familia` varchar(40) NOT NULL,
  `Naim` varchar(40) NOT NULL,
  `Otchestvo` varchar(40) NOT NULL,
  `Den_Rozdenia` date NOT NULL,
  `Kids` varchar(100) NOT NULL,
  `Stepyxa` varchar(100) NOT NULL,
  `Razmer_Stepyxi` varchar(100) NOT NULL,
  `ID_Pol` int NOT NULL,
  `ID_Forma_Obuchenia` int NOT NULL,
  `ID_Gruppa` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `bk_student`
--

INSERT INTO `bk_student` (`ID_BkStudent`, `Familia`, `Naim`, `Otchestvo`, `Den_Rozdenia`, `Kids`, `Stepyxa`, `Razmer_Stepyxi`, `ID_Pol`, `ID_Forma_Obuchenia`, `ID_Gruppa`) VALUES
(1, 'Петров', 'Петя', 'Анатольевич', '1992-06-10', '0', '-', '-', 1, 1, 2),
(2, 'Петров', 'Сергей', 'Анатольевич', '2002-10-17', '0', '-', '-', 1, 2, 2),
(3, 'Петров', 'Арсен', 'Анатольевич', '2003-06-11', '0', '+', '1000', 1, 1, 2),
(4, 'Петров', 'Арсен', 'Анатольевич', '2003-06-11', '1', '+', '1000', 1, 1, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `bk_ych_plan`
--

CREATE TABLE `bk_ych_plan` (
  `ID_BkYch_plan` int NOT NULL,
  `ID_Kafedra` int NOT NULL,
  `ID_Dichiplina` int NOT NULL,
  `Data` date NOT NULL,
  `ID_Vid_Zanatia` int NOT NULL,
  `Chasi` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `bk_zachetnay_knizka`
--

CREATE TABLE `bk_zachetnay_knizka` (
  `ID_BkZactenay_knizka` int NOT NULL,
  `ID_Student` int NOT NULL,
  `ID_Prepodavateli` int NOT NULL,
  `ID_Forma_Kontrol` int NOT NULL,
  `ID_Dichiplina` int NOT NULL,
  `Ochenka` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `bk_zachislenie`
--

CREATE TABLE `bk_zachislenie` (
  `ID_BkZachislenie` int NOT NULL,
  `ID_Gruppa` int NOT NULL,
  `ID_Student` int NOT NULL,
  `Data_zach` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `concat_view`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `concat_view` (
`Den_rozdenia` date
,`ID_Forma_Obuchenia` int
,`ID_Gruppa` int
,`ID_Pol` int
,`id_student` int
,`Kids` varchar(100)
,`Razmer_Stepyxi` varchar(100)
,`Stepyxa` varchar(40)
,`ФИО` varchar(122)
);

-- --------------------------------------------------------

--
-- Структура таблицы `dichiplina`
--

CREATE TABLE `dichiplina` (
  `ID_Dichiplina` int NOT NULL,
  `Naim_dic` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `dichiplina`
--

INSERT INTO `dichiplina` (`ID_Dichiplina`, `Naim_dic`) VALUES
(1, 'Схемотехника'),
(2, 'Право'),
(3, 'Эксплуатация Кс');

-- --------------------------------------------------------

--
-- Структура таблицы `diplom`
--

CREATE TABLE `diplom` (
  `ID_Diplom` int NOT NULL,
  `ID_Student` int NOT NULL,
  `ID_Prepodavateli` int NOT NULL,
  `Tema` varchar(40) NOT NULL,
  `Data_zachota` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `diplom`
--

INSERT INTO `diplom` (`ID_Diplom`, `ID_Student`, `ID_Prepodavateli`, `Tema`, `Data_zachota`) VALUES
(1, 2, 1, 'Сравнительный анализ законов регионов', '2020-06-24'),
(2, 1, 2, 'Робот-охранник в Сбербанке', '2021-06-23'),
(3, 3, 3, 'Средства защиты предприятия', '2019-06-27'),
(4, 1, 1, 'Сравнительный анализ законов регионов', '2020-06-24');

--
-- Триггеры `diplom`
--
DELIMITER $$
CREATE TRIGGER `DiplomInsert_tr` AFTER INSERT ON `diplom` FOR EACH ROW BEGIN 
INSERT logdiplom SET 
logdiplom.DateLog = CURRENT_DATE, 
logdiplom.TimeLog = CURRENT_TIME, 
logdiplom.UserLog = CURRENT_USER, 
logdiplom.MessageLog = 'Добавление записи', 
logdiplom.ID_Diplom = NEW.id_diplom; 
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Структура таблицы `facultet`
--

CREATE TABLE `facultet` (
  `ID_Facultet` int NOT NULL,
  `Naim` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `facultet`
--

INSERT INTO `facultet` (`ID_Facultet`, `Naim`) VALUES
(1, 'Юристы'),
(2, 'Электронщики'),
(3, 'ИБ В ЗИ');

-- --------------------------------------------------------

--
-- Структура таблицы `forma_kontrol`
--

CREATE TABLE `forma_kontrol` (
  `ID_Forma_Kontrol` int NOT NULL,
  `Naim_fk` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `forma_kontrol`
--

INSERT INTO `forma_kontrol` (`ID_Forma_Kontrol`, `Naim_fk`) VALUES
(1, 'Зачет'),
(2, 'Проверочная'),
(3, 'Тест');

-- --------------------------------------------------------

--
-- Структура таблицы `forma_obuch`
--

CREATE TABLE `forma_obuch` (
  `ID_Forma_Obuch` int NOT NULL,
  `Naim` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `forma_obuch`
--

INSERT INTO `forma_obuch` (`ID_Forma_Obuch`, `Naim`) VALUES
(1, 'Очная'),
(2, 'Заочная');

-- --------------------------------------------------------

--
-- Структура таблицы `gruppa`
--

CREATE TABLE `gruppa` (
  `ID_Gruppa` int NOT NULL,
  `Naim_gr` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `God_zach` date DEFAULT NULL,
  `ID_Kurs` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `gruppa`
--

INSERT INTO `gruppa` (`ID_Gruppa`, `Naim_gr`, `God_zach`, `ID_Kurs`) VALUES
(1, 'СХ\\14-21', NULL, 1),
(2, 'ЭК-4\\15', NULL, 3),
(3, 'ИБ\\5-9-12', NULL, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `kafedra`
--

CREATE TABLE `kafedra` (
  `ID_Kafedra` int NOT NULL,
  `Naim_kaf` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ID_Facultet` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `kafedra`
--

INSERT INTO `kafedra` (`ID_Kafedra`, `Naim_kaf`, `ID_Facultet`) VALUES
(1, 'Юристы', 1),
(2, 'Электронщики', 2),
(3, 'ИБ В ЗИ', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `kategoria`
--

CREATE TABLE `kategoria` (
  `ID_Kategoria` int NOT NULL,
  `Naim_kat` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `kategoria`
--

INSERT INTO `kategoria` (`ID_Kategoria`, `Naim_kat`) VALUES
(1, 'Доцент'),
(2, 'Кандидат Докторских наук'),
(3, 'Профессор ');

-- --------------------------------------------------------

--
-- Структура таблицы `kurs`
--

CREATE TABLE `kurs` (
  `ID_Kurs` int NOT NULL,
  `Naim` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `kurs`
--

INSERT INTO `kurs` (`ID_Kurs`, `Naim`) VALUES
(1, '1'),
(2, '2'),
(3, '3'),
(4, '4');

-- --------------------------------------------------------

--
-- Структура таблицы `logdiplom`
--

CREATE TABLE `logdiplom` (
  `ID_LogDiplom` int NOT NULL,
  `DateLog` date NOT NULL,
  `TimeLog` time NOT NULL,
  `UserLog` varchar(100) NOT NULL,
  `MessageLog` varchar(100) NOT NULL,
  `ID_Diplom` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `loggruppa`
--

CREATE TABLE `loggruppa` (
  `ID_LogGruppa` int NOT NULL,
  `DateLog` date NOT NULL,
  `TimeLog` time NOT NULL,
  `UserLog` varchar(100) NOT NULL,
  `MessageLog` varchar(100) NOT NULL,
  `ID_Gruppa` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `lognagruzka_prepod`
--

CREATE TABLE `lognagruzka_prepod` (
  `ID_LogNagruzka_prepod` int NOT NULL,
  `DateLog` date NOT NULL,
  `TimeLog` time NOT NULL,
  `UserLog` varchar(100) NOT NULL,
  `MessageLog` varchar(100) NOT NULL,
  `ID_Nagruzka_Prepod` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `logprepod`
--

CREATE TABLE `logprepod` (
  `ID_LogPrepod` int NOT NULL,
  `DateLog` date NOT NULL,
  `TimeLog` time NOT NULL,
  `UserLog` varchar(100) NOT NULL,
  `MessageLog` varchar(100) NOT NULL,
  `ID_Prepodavateli` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `logprepod`
--

INSERT INTO `logprepod` (`ID_LogPrepod`, `DateLog`, `TimeLog`, `UserLog`, `MessageLog`, `ID_Prepodavateli`) VALUES
(1, '2022-06-27', '16:16:49', 'root@127.0.0.1', 'Добавление записи', 5),
(2, '2022-06-27', '16:54:13', 'root@127.0.0.1', 'Удаление записи', 5);

-- --------------------------------------------------------

--
-- Структура таблицы `logprovedenia_zanatia`
--

CREATE TABLE `logprovedenia_zanatia` (
  `ID_LogProvedenia_zanatia` int NOT NULL,
  `DateLog` date NOT NULL,
  `TimeLog` time NOT NULL,
  `UserLog` varchar(100) NOT NULL,
  `MessageLog` varchar(100) NOT NULL,
  `ID_Provedenia_Zanatia` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `logstudent`
--

CREATE TABLE `logstudent` (
  `ID_LogStudent` int NOT NULL,
  `DateLog` date NOT NULL,
  `TimeLog` time NOT NULL,
  `UserLog` varchar(100) NOT NULL,
  `MessageLog` varchar(100) NOT NULL,
  `ID_Student` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `logstudent`
--

INSERT INTO `logstudent` (`ID_LogStudent`, `DateLog`, `TimeLog`, `UserLog`, `MessageLog`, `ID_Student`) VALUES
(1, '2022-06-05', '20:28:16', 'root@127.0.0.1', 'Добавить запись', 7),
(2, '2022-06-27', '00:31:37', 'root@127.0.0.1', 'Добавление записи', 8),
(9, '2022-06-27', '16:18:49', 'root@127.0.0.1', 'Добавление записи', 10),
(10, '2022-06-27', '16:55:40', 'root@127.0.0.1', 'Удаление записи', 8),
(12, '2022-06-27', '16:57:46', 'root@127.0.0.1', 'Изменение записи', 1),
(13, '2022-06-27', '16:57:56', 'root@127.0.0.1', 'Изменение записи', 7),
(15, '2022-06-27', '16:59:04', 'root@127.0.0.1', 'Удаление записи', 7);

-- --------------------------------------------------------

--
-- Структура таблицы `logych_plan`
--

CREATE TABLE `logych_plan` (
  `ID_LogYch_plan` int NOT NULL,
  `DateLog` date NOT NULL,
  `TimeLog` time NOT NULL,
  `UserLog` varchar(100) NOT NULL,
  `MessageLog` varchar(100) NOT NULL,
  `ID_Ych_Plan` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `logzachetnay_knizka`
--

CREATE TABLE `logzachetnay_knizka` (
  `ID_LogZachetnay_Knizka` int NOT NULL,
  `DateLog` date NOT NULL,
  `TimeLog` time NOT NULL,
  `UserLog` varchar(100) NOT NULL,
  `MessageLog` varchar(100) NOT NULL,
  `ID_Zachetnaay_Knizka` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `logzachislenie`
--

CREATE TABLE `logzachislenie` (
  `ID_LogZachislenie` int NOT NULL,
  `DateLog` date NOT NULL,
  `TimeLog` time NOT NULL,
  `UserLog` varchar(100) NOT NULL,
  `MessageLog` varchar(100) NOT NULL,
  `ID_Zachislenie` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `nagruzka_prepod`
--

CREATE TABLE `nagruzka_prepod` (
  `ID_Nagruzka_Prepod` int NOT NULL,
  `ID_Prepod` int NOT NULL,
  `ID_Dichiplina` int NOT NULL,
  `Chasi` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `nagruzka_prepod`
--

INSERT INTO `nagruzka_prepod` (`ID_Nagruzka_Prepod`, `ID_Prepod`, `ID_Dichiplina`, `Chasi`) VALUES
(1, 1, 1, '48 ч'),
(2, 2, 3, '74 ч'),
(3, 3, 2, '52 ч');

-- --------------------------------------------------------

--
-- Структура таблицы `pol`
--

CREATE TABLE `pol` (
  `ID_Pol` int NOT NULL,
  `Naim_pol` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `pol`
--

INSERT INTO `pol` (`ID_Pol`, `Naim_pol`) VALUES
(1, 'Мужской'),
(2, 'Женский');

-- --------------------------------------------------------

--
-- Структура таблицы `prepodavateli`
--

CREATE TABLE `prepodavateli` (
  `ID_Prepodavateli` int NOT NULL,
  `Familia` varchar(40) NOT NULL,
  `Naim_prepod` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Otchestvo` varchar(40) NOT NULL,
  `Kids` varchar(100) NOT NULL,
  `Kolvo_kids` varchar(100) NOT NULL,
  `ZP` varchar(100) NOT NULL,
  `ID_Kategoria` int NOT NULL,
  `ID_Pol` int NOT NULL,
  `ID_Kafedra` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `prepodavateli`
--

INSERT INTO `prepodavateli` (`ID_Prepodavateli`, `Familia`, `Naim_prepod`, `Otchestvo`, `Kids`, `Kolvo_kids`, `ZP`, `ID_Kategoria`, `ID_Pol`, `ID_Kafedra`) VALUES
(1, 'Андрианов', 'Антон', 'Олегович', '-', '-', '57 000', 2, 1, 3),
(2, 'Жарких', 'Наталья', 'Дмитриевна', '-', '-', '45 000', 3, 2, 2),
(3, 'Шивилов', 'Анатолий ', 'Геннадьевич', '+', '4', '120 000', 1, 1, 1),
(4, 'Андрианов', 'Антон', 'Олегович', '+', '2', '79 000', 1, 1, 1);

--
-- Триггеры `prepodavateli`
--
DELIMITER $$
CREATE TRIGGER `PrepodDelete_tr` BEFORE DELETE ON `prepodavateli` FOR EACH ROW BEGIN 
INSERT logprepod SET 
logprepod.DateLog = CURRENT_DATE, 
logprepod.TimeLog = CURRENT_TIME, 
logprepod.UserLog = CURRENT_USER, 
logprepod.MessageLog = 'Удаление записи', 
logprepod.ID_Prepodavateli = OLD.ID_Prepodavateli; 

INSERT INTO bk_prepod SET 
bk_prepod.Familia = old.Familia, 
bk_prepod.Naim = old.Naim, 
bk_prepod.Otchestvo = old.Otchestvo, 
bk_prepod.Kids = old.Kids, 
bk_prepod.Kolvo_Kids = old.Kolvo_Kids,
bk_prepod.ZP = old.ZP,
bk_prepod.ID_Kategoria = old.ID_Kategoria,
bk_prepod.ID_Pol = old.ID_Pol,
bk_prepod.ID_Kafedra = old.ID_Kafedra;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `PrepodInsert_tr` AFTER INSERT ON `prepodavateli` FOR EACH ROW BEGIN 
INSERT logprepod SET 
logprepod.DateLog = CURRENT_DATE, 
logprepod.TimeLog = CURRENT_TIME, 
logprepod.UserLog = CURRENT_USER, 
logprepod.MessageLog = 'Добавление записи', 
logprepod.ID_Prepodavateli = NEW.ID_Prepodavateli; 
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `PrepodUpdate_tr` BEFORE UPDATE ON `prepodavateli` FOR EACH ROW BEGIN 
INSERT INTO logprepod SET 
logprepod.DateLog = CURRENT_DATE, 
logprepod.TimeLog = CURRENT_TIME, 
logprepod.UserLog = CURRENT_USER, 
logprepod.MessageLog = 'Изменение записи', 
logprepod.ID_Prepodavateli = old.id_Prepodavateli; 

INSERT INTO bk_prepod SET 
bk_prepod.Familia = old.Familia, 
bk_prepod.Naim_prepod = old.Naim_prepod, 
bk_prepod.Otchestvo = old.Otchestvo, 
bk_prepod.Kids = old.Kids, 
bk_prepod.Kolvo_Kids = old.Kolvo_Kids,
bk_prepod.ZP = old.ZP,
bk_prepod.ID_Kategoria = old.ID_Kategoria,
bk_prepod.ID_Pol = old.ID_Pol,
bk_prepod.ID_Kafedra = old.ID_Kafedra;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Структура таблицы `provedenie_zanatia`
--

CREATE TABLE `provedenie_zanatia` (
  `ID_Provedenie_zanatia` int NOT NULL,
  `ID_Gruppa` int NOT NULL,
  `ID_Prepodavateli` int NOT NULL,
  `ID_Dichiplina` int NOT NULL,
  `ID_Vid_Zanatia` int NOT NULL,
  `Data_Provedenia` date NOT NULL,
  `Vremya_Provedenia` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `provedenie_zanatia`
--

INSERT INTO `provedenie_zanatia` (`ID_Provedenie_zanatia`, `ID_Gruppa`, `ID_Prepodavateli`, `ID_Dichiplina`, `ID_Vid_Zanatia`, `Data_Provedenia`, `Vremya_Provedenia`) VALUES
(1, 3, 1, 2, 3, '2021-03-08', '12:24:35'),
(2, 1, 2, 1, 1, '2021-10-19', '19:24:35'),
(3, 2, 3, 3, 2, '2020-03-20', '00:00:00');

-- --------------------------------------------------------

--
-- Структура таблицы `student`
--

CREATE TABLE `student` (
  `ID_Student` int NOT NULL,
  `Familia` varchar(40) NOT NULL,
  `Naim_st` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Otchestvo` varchar(40) NOT NULL,
  `Den_Rozdenia` date NOT NULL,
  `Kids` varchar(100) NOT NULL,
  `Stepyxa` varchar(40) NOT NULL,
  `Razmer_Stepyxi` varchar(100) NOT NULL,
  `ID_Pol` int NOT NULL,
  `ID_Forma_Obuchenia` int NOT NULL,
  `ID_Gruppa` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `student`
--

INSERT INTO `student` (`ID_Student`, `Familia`, `Naim_st`, `Otchestvo`, `Den_Rozdenia`, `Kids`, `Stepyxa`, `Razmer_Stepyxi`, `ID_Pol`, `ID_Forma_Obuchenia`, `ID_Gruppa`) VALUES
(1, 'Петров', 'Сергей', 'Анатольевич', '2002-10-17', '-', '-', '-', 1, 2, 2),
(2, 'Моисеева', 'Ксения', 'Сергеевна ', '2004-08-09', '', '+', '1 000', 2, 1, 1),
(3, 'Самсонов', 'Абдул', 'Павлович', '2004-06-22', '', '+', '5 000', 1, 2, 2),
(5, 'Шестаков', 'Дмитрий', 'Данилович', '2002-12-12', '', '-', '-', 1, 1, 1),
(10, 'Андрианов', 'Петя', 'Анатольевич', '1994-06-09', '', '-', '-', 1, 1, 3);

--
-- Триггеры `student`
--
DELIMITER $$
CREATE TRIGGER `StudentDelete_tr` BEFORE DELETE ON `student` FOR EACH ROW BEGIN 
INSERT INTO logstudent SET 
logstudent.DateLog = CURRENT_DATE, 
logstudent.TimeLog = CURRENT_TIME, 
logstudent.UserLog = CURRENT_USER, 
logstudent.MessageLog = 'Удаление записи', 
logstudent.ID_Student = old.id_student; 

INSERT INTO bk_student SET 
bk_student.Familia = old.Familia, 
bk_student.Naim = old.Naim, 
bk_student.Otchestvo = old.Otchestvo, 
bk_student.Den_Rozdenia = old.Den_Rozdenia, 
bk_student.Kids = old.Kids, 
bk_student.Stepyxa = old.Stepyxa,
bk_student.Razmer_Stepyxi = old.Razmer_Stepyxi,
bk_student.ID_Pol = old.ID_Pol,
bk_student.ID_Forma_Obuchenia = old.ID_Forma_Obuchenia,
bk_student.ID_Gruppa = old.ID_Gruppa;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `StudentInsert_tr` AFTER INSERT ON `student` FOR EACH ROW BEGIN 
INSERT logstudent SET 
logstudent.DateLog = CURRENT_DATE, 
logstudent.TimeLog = CURRENT_TIME, 
logstudent.UserLog = CURRENT_USER, 
logstudent.MessageLog = 'Добавление записи', 
logstudent.id_student = NEW.id_student; 
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `StudentUpdate_tr` BEFORE UPDATE ON `student` FOR EACH ROW BEGIN 
INSERT INTO logstudent SET 
logstudent.DateLog = CURRENT_DATE, 
logstudent.TimeLog = CURRENT_TIME, 
logstudent.UserLog = CURRENT_USER, 
logstudent.MessageLog = 'Изменение записи', 
logstudent.ID_Student = old.id_student; 

INSERT INTO bk_student SET 
bk_student.Familia = old.Familia, 
bk_student.Naim = old.Naim, 
bk_student.Otchestvo = old.Otchestvo, 
bk_student.Den_Rozdenia = old.Den_Rozdenia, 
bk_student.Stepyxa = old.Stepyxa,
bk_student.Razmer_Stepyxi = old.Razmer_Stepyxi,
bk_student.ID_Pol = old.ID_Pol,
bk_student.ID_Forma_Obuchenia = old.ID_Forma_Obuchenia,
bk_student.ID_Gruppa = old.ID_Gruppa;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `sub_string`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `sub_string` (
`Kolvo` varchar(40)
,`Vid` varchar(40)
);

-- --------------------------------------------------------

--
-- Структура таблицы `vid_zanatia`
--

CREATE TABLE `vid_zanatia` (
  `ID_Vid_Zanatia` int NOT NULL,
  `Naim_vz` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `vid_zanatia`
--

INSERT INTO `vid_zanatia` (`ID_Vid_Zanatia`, `Naim_vz`) VALUES
(1, 'Лекция / 48'),
(2, 'Семинар / 36'),
(3, 'Практическая работа / 15');

-- --------------------------------------------------------

--
-- Структура таблицы `ych_plan`
--

CREATE TABLE `ych_plan` (
  `ID_Ych_Plan` int NOT NULL,
  `ID_Kafedra` int NOT NULL,
  `ID_Dichiplina` int NOT NULL,
  `Data` int NOT NULL,
  `ID_Vid_Zanatia` int NOT NULL,
  `Chasi` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `ych_plan`
--

INSERT INTO `ych_plan` (`ID_Ych_Plan`, `ID_Kafedra`, `ID_Dichiplina`, `Data`, `ID_Vid_Zanatia`, `Chasi`) VALUES
(1, 3, 3, 12, 1, '48 ч'),
(2, 2, 1, 15, 3, '12 ч'),
(3, 1, 2, 23, 2, '15 ч');

-- --------------------------------------------------------

--
-- Структура таблицы `zachet_knizka`
--

CREATE TABLE `zachet_knizka` (
  `ID_Zachetnaay_Knizka` int NOT NULL,
  `ID_Student` int NOT NULL,
  `ID_Prepodavateli` int NOT NULL,
  `ID_Forma_Kontrol` int NOT NULL,
  `ID_Dichiplina` int NOT NULL,
  `Ochenka` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `zachet_knizka`
--

INSERT INTO `zachet_knizka` (`ID_Zachetnaay_Knizka`, `ID_Student`, `ID_Prepodavateli`, `ID_Forma_Kontrol`, `ID_Dichiplina`, `Ochenka`) VALUES
(1, 2, 1, 2, 2, '5'),
(2, 1, 2, 1, 3, '4'),
(3, 3, 3, 3, 1, '3');

-- --------------------------------------------------------

--
-- Структура таблицы `zachislenie_grupp`
--

CREATE TABLE `zachislenie_grupp` (
  `ID_Zachislenie` int NOT NULL,
  `ID_Gruppa` int NOT NULL,
  `ID_Student` int NOT NULL,
  `Data_zach` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `zachislenie_grupp`
--

INSERT INTO `zachislenie_grupp` (`ID_Zachislenie`, `ID_Gruppa`, `ID_Student`, `Data_zach`) VALUES
(1, 3, 2, '2019-10-24'),
(2, 1, 1, '2018-10-24'),
(3, 2, 3, '2020-10-22');

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `zapros_1`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `zapros_1` (
);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `zapros_2`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `zapros_2` (
`Зарплата` varchar(100)
,`Имя` varchar(40)
,`Категория` varchar(40)
,`Кафедра` varchar(40)
,`Количество детей` varchar(100)
,`Наличие детей` varchar(100)
,`Отчество` varchar(40)
,`Пол` varchar(40)
,`Фамилия` varchar(40)
);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `zapros_5`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `zapros_5` (
`Имя` varchar(40)
,`Категория` varchar(40)
,`Кафедра` varchar(40)
,`Отчество` varchar(40)
,`Фамилия` varchar(40)
);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `zapros_6`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `zapros_6` (
`Вид занятия` varchar(40)
,`Время проведения` time
,`Группа` varchar(40)
,`Дата Проведения` date
,`Дисциплина` varchar(40)
,`Имя` varchar(40)
,`Отчество` varchar(40)
,`Фамилия` varchar(40)
);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `zapros_7`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `zapros_7` (
`Дисциплина` varchar(40)
,`Оценка` varchar(10)
,`Фамилия преподователя` varchar(40)
,`Фамилия студента` varchar(40)
,`Форма контроля` varchar(40)
);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `zapros_8`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `zapros_8` (
`Дисциплина` varchar(40)
,`Оценка` varchar(10)
,`Фамилия преподователя` varchar(40)
,`Фамилия студента` varchar(40)
,`Форма контроля` varchar(40)
);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `zapros_10`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `zapros_10` (
`Дисциплина` varchar(40)
,`Оценка` varchar(10)
,`Фамилия преподователя` varchar(40)
,`Фамилия студента` varchar(40)
,`Форма контроля` varchar(40)
);

-- --------------------------------------------------------

--
-- Структура для представления `concat_view`
--
DROP TABLE IF EXISTS `concat_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER VIEW `concat_view`  AS SELECT `student`.`ID_Student` AS `id_student`, concat(`student`.`Familia`,' ',`student`.`Naim_st`,' ',`student`.`Otchestvo`) AS `ФИО`, `student`.`ID_Pol` AS `ID_Pol`, `student`.`Den_Rozdenia` AS `Den_rozdenia`, `student`.`Kids` AS `Kids`, `student`.`ID_Gruppa` AS `ID_Gruppa`, `student`.`Stepyxa` AS `Stepyxa`, `student`.`Razmer_Stepyxi` AS `Razmer_Stepyxi`, `student`.`ID_Forma_Obuchenia` AS `ID_Forma_Obuchenia` FROM `student` ;

-- --------------------------------------------------------

--
-- Структура для представления `sub_string`
--
DROP TABLE IF EXISTS `sub_string`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER VIEW `sub_string`  AS SELECT substring_index(`vid_zanatia`.`Naim_vz`,' ',1) AS `Vid`, substring_index(`vid_zanatia`.`Naim_vz`,' ',-(1)) AS `Kolvo` FROM `vid_zanatia` ;

-- --------------------------------------------------------

--
-- Структура для представления `zapros_1`
--
DROP TABLE IF EXISTS `zapros_1`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER VIEW `zapros_1`  AS SELECT `student`.`Familia` AS `Фамилия`, `student`.`Naim` AS `Имя`, `student`.`Otchestvo` AS `Отчество`, `student`.`Den_Rozdenia` AS `День рождения`, `student`.`Kids` AS `Наличие детей`, `student`.`Stepyxa` AS `Степендия`, `student`.`Razmer_Stepyxi` AS `Размер степендии`, `pol`.`Naim` AS `Пол`, `forma_obuch`.`Naim` AS `Форма обучения`, `gruppa`.`Naim` AS `Группа` FROM (`pol` join (`forma_obuch` join (`gruppa` join `student` on((`gruppa`.`ID_Gruppa` = `student`.`ID_Gruppa`))) on((`forma_obuch`.`ID_Forma_Obuch` = `student`.`ID_Forma_Obuchenia`))) on((`pol`.`ID_Pol` = `student`.`ID_Pol`))) ;

-- --------------------------------------------------------

--
-- Структура для представления `zapros_2`
--
DROP TABLE IF EXISTS `zapros_2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER VIEW `zapros_2`  AS SELECT `prepodavateli`.`Familia` AS `Фамилия`, `prepodavateli`.`Naim_prepod` AS `Имя`, `prepodavateli`.`Otchestvo` AS `Отчество`, `prepodavateli`.`Kids` AS `Наличие детей`, `prepodavateli`.`Kolvo_kids` AS `Количество детей`, `prepodavateli`.`ZP` AS `Зарплата`, `pol`.`Naim_pol` AS `Пол`, `kategoria`.`Naim_kat` AS `Категория`, `kafedra`.`Naim_kaf` AS `Кафедра` FROM (`pol` join (`kafedra` join (`kategoria` join `prepodavateli` on((`kategoria`.`ID_Kategoria` = `prepodavateli`.`ID_Kategoria`))) on((`kafedra`.`ID_Kafedra` = `prepodavateli`.`ID_Kafedra`))) on((`pol`.`ID_Pol` = `prepodavateli`.`ID_Pol`))) ;

-- --------------------------------------------------------

--
-- Структура для представления `zapros_5`
--
DROP TABLE IF EXISTS `zapros_5`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER VIEW `zapros_5`  AS SELECT `prepodavateli`.`Familia` AS `Фамилия`, `prepodavateli`.`Naim_prepod` AS `Имя`, `prepodavateli`.`Otchestvo` AS `Отчество`, `kategoria`.`Naim_kat` AS `Категория`, `kafedra`.`Naim_kaf` AS `Кафедра` FROM (`kafedra` join (`kategoria` join `prepodavateli` on((`kategoria`.`ID_Kategoria` = `prepodavateli`.`ID_Kategoria`))) on((`kafedra`.`ID_Kafedra` = `prepodavateli`.`ID_Kafedra`))) WHERE (`kafedra`.`Naim_kaf` = 'ИБ В ЗИ') ;

-- --------------------------------------------------------

--
-- Структура для представления `zapros_6`
--
DROP TABLE IF EXISTS `zapros_6`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER VIEW `zapros_6`  AS SELECT `prepodavateli`.`Familia` AS `Фамилия`, `prepodavateli`.`Naim_prepod` AS `Имя`, `prepodavateli`.`Otchestvo` AS `Отчество`, `gruppa`.`Naim_gr` AS `Группа`, `dichiplina`.`Naim_dic` AS `Дисциплина`, `vid_zanatia`.`Naim_vz` AS `Вид занятия`, `provedenie_zanatia`.`Data_Provedenia` AS `Дата Проведения`, `provedenie_zanatia`.`Vremya_Provedenia` AS `Время проведения` FROM (`gruppa` join (`dichiplina` join (`prepodavateli` join (`vid_zanatia` join `provedenie_zanatia` on((`vid_zanatia`.`ID_Vid_Zanatia` = `provedenie_zanatia`.`ID_Vid_Zanatia`))) on((`prepodavateli`.`ID_Prepodavateli` = `provedenie_zanatia`.`ID_Prepodavateli`))) on((`dichiplina`.`ID_Dichiplina` = `provedenie_zanatia`.`ID_Dichiplina`))) on((`gruppa`.`ID_Gruppa` = `provedenie_zanatia`.`ID_Gruppa`))) ;

-- --------------------------------------------------------

--
-- Структура для представления `zapros_7`
--
DROP TABLE IF EXISTS `zapros_7`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER VIEW `zapros_7`  AS SELECT `student`.`Familia` AS `Фамилия студента`, `prepodavateli`.`Familia` AS `Фамилия преподователя`, `dichiplina`.`Naim_dic` AS `Дисциплина`, `forma_kontrol`.`Naim_fk` AS `Форма контроля`, `zachet_knizka`.`Ochenka` AS `Оценка` FROM (`student` join (`prepodavateli` join (`dichiplina` join (`forma_kontrol` join `zachet_knizka` on((`forma_kontrol`.`ID_Forma_Kontrol` = `zachet_knizka`.`ID_Forma_Kontrol`))) on((`dichiplina`.`ID_Dichiplina` = `zachet_knizka`.`ID_Dichiplina`))) on((`prepodavateli`.`ID_Prepodavateli` = `zachet_knizka`.`ID_Prepodavateli`))) on((`student`.`ID_Student` = `zachet_knizka`.`ID_Student`))) ;

-- --------------------------------------------------------

--
-- Структура для представления `zapros_8`
--
DROP TABLE IF EXISTS `zapros_8`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER VIEW `zapros_8`  AS SELECT `student`.`Familia` AS `Фамилия студента`, `prepodavateli`.`Familia` AS `Фамилия преподователя`, `dichiplina`.`Naim_dic` AS `Дисциплина`, `forma_kontrol`.`Naim_fk` AS `Форма контроля`, `zachet_knizka`.`Ochenka` AS `Оценка` FROM (`student` join (`prepodavateli` join (`dichiplina` join (`forma_kontrol` join `zachet_knizka` on((`forma_kontrol`.`ID_Forma_Kontrol` = `zachet_knizka`.`ID_Forma_Kontrol`))) on((`dichiplina`.`ID_Dichiplina` = `zachet_knizka`.`ID_Dichiplina`))) on((`prepodavateli`.`ID_Prepodavateli` = `zachet_knizka`.`ID_Prepodavateli`))) on((`student`.`ID_Student` = `zachet_knizka`.`ID_Student`))) WHERE ((`zachet_knizka`.`Ochenka` = '5') OR (`zachet_knizka`.`Ochenka` = '4')) ;

-- --------------------------------------------------------

--
-- Структура для представления `zapros_10`
--
DROP TABLE IF EXISTS `zapros_10`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER VIEW `zapros_10`  AS SELECT `student`.`Familia` AS `Фамилия студента`, `prepodavateli`.`Familia` AS `Фамилия преподователя`, `dichiplina`.`Naim_dic` AS `Дисциплина`, `forma_kontrol`.`Naim_fk` AS `Форма контроля`, `zachet_knizka`.`Ochenka` AS `Оценка` FROM (`student` join (`prepodavateli` join (`dichiplina` join (`forma_kontrol` join `zachet_knizka` on((`forma_kontrol`.`ID_Forma_Kontrol` = `zachet_knizka`.`ID_Forma_Kontrol`))) on((`dichiplina`.`ID_Dichiplina` = `zachet_knizka`.`ID_Dichiplina`))) on((`prepodavateli`.`ID_Prepodavateli` = `zachet_knizka`.`ID_Prepodavateli`))) on((`student`.`ID_Student` = `zachet_knizka`.`ID_Student`))) WHERE (`dichiplina`.`Naim_dic` = 'Право') ;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `bk_diplom`
--
ALTER TABLE `bk_diplom`
  ADD PRIMARY KEY (`ID_BkDiplom`);

--
-- Индексы таблицы `bk_gruppa`
--
ALTER TABLE `bk_gruppa`
  ADD PRIMARY KEY (`ID_BkGruppa`);

--
-- Индексы таблицы `bk_nagruzka_prepod`
--
ALTER TABLE `bk_nagruzka_prepod`
  ADD PRIMARY KEY (`ID_BkNagruxka_prepod`);

--
-- Индексы таблицы `bk_prepod`
--
ALTER TABLE `bk_prepod`
  ADD PRIMARY KEY (`ID_BkPrepod`);

--
-- Индексы таблицы `bk_provedenia_zanatia`
--
ALTER TABLE `bk_provedenia_zanatia`
  ADD PRIMARY KEY (`ID_BkProvedenia_zanatia`);

--
-- Индексы таблицы `bk_student`
--
ALTER TABLE `bk_student`
  ADD PRIMARY KEY (`ID_BkStudent`);

--
-- Индексы таблицы `bk_ych_plan`
--
ALTER TABLE `bk_ych_plan`
  ADD PRIMARY KEY (`ID_BkYch_plan`);

--
-- Индексы таблицы `bk_zachetnay_knizka`
--
ALTER TABLE `bk_zachetnay_knizka`
  ADD PRIMARY KEY (`ID_BkZactenay_knizka`);

--
-- Индексы таблицы `bk_zachislenie`
--
ALTER TABLE `bk_zachislenie`
  ADD PRIMARY KEY (`ID_BkZachislenie`);

--
-- Индексы таблицы `dichiplina`
--
ALTER TABLE `dichiplina`
  ADD PRIMARY KEY (`ID_Dichiplina`);

--
-- Индексы таблицы `diplom`
--
ALTER TABLE `diplom`
  ADD PRIMARY KEY (`ID_Diplom`),
  ADD KEY `ID_Prepodavateli` (`ID_Prepodavateli`),
  ADD KEY `ID_Student` (`ID_Student`);

--
-- Индексы таблицы `facultet`
--
ALTER TABLE `facultet`
  ADD PRIMARY KEY (`ID_Facultet`);

--
-- Индексы таблицы `forma_kontrol`
--
ALTER TABLE `forma_kontrol`
  ADD PRIMARY KEY (`ID_Forma_Kontrol`);

--
-- Индексы таблицы `forma_obuch`
--
ALTER TABLE `forma_obuch`
  ADD PRIMARY KEY (`ID_Forma_Obuch`);

--
-- Индексы таблицы `gruppa`
--
ALTER TABLE `gruppa`
  ADD PRIMARY KEY (`ID_Gruppa`),
  ADD KEY `ID_Kurs` (`ID_Kurs`);

--
-- Индексы таблицы `kafedra`
--
ALTER TABLE `kafedra`
  ADD PRIMARY KEY (`ID_Kafedra`),
  ADD KEY `ID_Facultet` (`ID_Facultet`);

--
-- Индексы таблицы `kategoria`
--
ALTER TABLE `kategoria`
  ADD PRIMARY KEY (`ID_Kategoria`);

--
-- Индексы таблицы `kurs`
--
ALTER TABLE `kurs`
  ADD PRIMARY KEY (`ID_Kurs`);

--
-- Индексы таблицы `logdiplom`
--
ALTER TABLE `logdiplom`
  ADD PRIMARY KEY (`ID_LogDiplom`);

--
-- Индексы таблицы `loggruppa`
--
ALTER TABLE `loggruppa`
  ADD PRIMARY KEY (`ID_LogGruppa`);

--
-- Индексы таблицы `lognagruzka_prepod`
--
ALTER TABLE `lognagruzka_prepod`
  ADD PRIMARY KEY (`ID_LogNagruzka_prepod`);

--
-- Индексы таблицы `logprepod`
--
ALTER TABLE `logprepod`
  ADD PRIMARY KEY (`ID_LogPrepod`);

--
-- Индексы таблицы `logprovedenia_zanatia`
--
ALTER TABLE `logprovedenia_zanatia`
  ADD PRIMARY KEY (`ID_LogProvedenia_zanatia`);

--
-- Индексы таблицы `logstudent`
--
ALTER TABLE `logstudent`
  ADD PRIMARY KEY (`ID_LogStudent`);

--
-- Индексы таблицы `logych_plan`
--
ALTER TABLE `logych_plan`
  ADD PRIMARY KEY (`ID_LogYch_plan`);

--
-- Индексы таблицы `logzachetnay_knizka`
--
ALTER TABLE `logzachetnay_knizka`
  ADD PRIMARY KEY (`ID_LogZachetnay_Knizka`);

--
-- Индексы таблицы `logzachislenie`
--
ALTER TABLE `logzachislenie`
  ADD PRIMARY KEY (`ID_LogZachislenie`);

--
-- Индексы таблицы `nagruzka_prepod`
--
ALTER TABLE `nagruzka_prepod`
  ADD PRIMARY KEY (`ID_Nagruzka_Prepod`),
  ADD KEY `ID_Dichiplina` (`ID_Dichiplina`),
  ADD KEY `ID_Prepod` (`ID_Prepod`);

--
-- Индексы таблицы `pol`
--
ALTER TABLE `pol`
  ADD PRIMARY KEY (`ID_Pol`);

--
-- Индексы таблицы `prepodavateli`
--
ALTER TABLE `prepodavateli`
  ADD PRIMARY KEY (`ID_Prepodavateli`),
  ADD KEY `ID_Kafedra` (`ID_Kafedra`),
  ADD KEY `ID_Kategoria` (`ID_Kategoria`),
  ADD KEY `ID_Pol` (`ID_Pol`);

--
-- Индексы таблицы `provedenie_zanatia`
--
ALTER TABLE `provedenie_zanatia`
  ADD PRIMARY KEY (`ID_Provedenie_zanatia`),
  ADD KEY `ID_Dichiplina` (`ID_Dichiplina`),
  ADD KEY `ID_Gruppa` (`ID_Gruppa`),
  ADD KEY `ID_Prepodavateli` (`ID_Prepodavateli`),
  ADD KEY `ID_Vid_Zanatia` (`ID_Vid_Zanatia`);

--
-- Индексы таблицы `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`ID_Student`),
  ADD KEY `ID_Pol` (`ID_Pol`),
  ADD KEY `ID_Forma_Obuchenia` (`ID_Forma_Obuchenia`),
  ADD KEY `ID_Gruppa` (`ID_Gruppa`);

--
-- Индексы таблицы `vid_zanatia`
--
ALTER TABLE `vid_zanatia`
  ADD PRIMARY KEY (`ID_Vid_Zanatia`);

--
-- Индексы таблицы `ych_plan`
--
ALTER TABLE `ych_plan`
  ADD PRIMARY KEY (`ID_Ych_Plan`),
  ADD KEY `ID_Dichiplina` (`ID_Dichiplina`),
  ADD KEY `ID_Kafedra` (`ID_Kafedra`),
  ADD KEY `ID_Vid_Zanatia` (`ID_Vid_Zanatia`);

--
-- Индексы таблицы `zachet_knizka`
--
ALTER TABLE `zachet_knizka`
  ADD PRIMARY KEY (`ID_Zachetnaay_Knizka`),
  ADD KEY `ID_Dichiplina` (`ID_Dichiplina`),
  ADD KEY `ID_Forma_Kontrol` (`ID_Forma_Kontrol`),
  ADD KEY `ID_Prepodavateli` (`ID_Prepodavateli`),
  ADD KEY `ID_Student` (`ID_Student`);

--
-- Индексы таблицы `zachislenie_grupp`
--
ALTER TABLE `zachislenie_grupp`
  ADD PRIMARY KEY (`ID_Zachislenie`),
  ADD KEY `ID_Gruppa` (`ID_Gruppa`),
  ADD KEY `ID_Student` (`ID_Student`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `bk_diplom`
--
ALTER TABLE `bk_diplom`
  MODIFY `ID_BkDiplom` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `bk_gruppa`
--
ALTER TABLE `bk_gruppa`
  MODIFY `ID_BkGruppa` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `bk_nagruzka_prepod`
--
ALTER TABLE `bk_nagruzka_prepod`
  MODIFY `ID_BkNagruxka_prepod` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `bk_prepod`
--
ALTER TABLE `bk_prepod`
  MODIFY `ID_BkPrepod` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `bk_provedenia_zanatia`
--
ALTER TABLE `bk_provedenia_zanatia`
  MODIFY `ID_BkProvedenia_zanatia` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `bk_student`
--
ALTER TABLE `bk_student`
  MODIFY `ID_BkStudent` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `bk_ych_plan`
--
ALTER TABLE `bk_ych_plan`
  MODIFY `ID_BkYch_plan` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `bk_zachetnay_knizka`
--
ALTER TABLE `bk_zachetnay_knizka`
  MODIFY `ID_BkZactenay_knizka` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `bk_zachislenie`
--
ALTER TABLE `bk_zachislenie`
  MODIFY `ID_BkZachislenie` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `dichiplina`
--
ALTER TABLE `dichiplina`
  MODIFY `ID_Dichiplina` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `diplom`
--
ALTER TABLE `diplom`
  MODIFY `ID_Diplom` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `facultet`
--
ALTER TABLE `facultet`
  MODIFY `ID_Facultet` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `forma_kontrol`
--
ALTER TABLE `forma_kontrol`
  MODIFY `ID_Forma_Kontrol` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `forma_obuch`
--
ALTER TABLE `forma_obuch`
  MODIFY `ID_Forma_Obuch` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `gruppa`
--
ALTER TABLE `gruppa`
  MODIFY `ID_Gruppa` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `kafedra`
--
ALTER TABLE `kafedra`
  MODIFY `ID_Kafedra` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `kategoria`
--
ALTER TABLE `kategoria`
  MODIFY `ID_Kategoria` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `kurs`
--
ALTER TABLE `kurs`
  MODIFY `ID_Kurs` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `logdiplom`
--
ALTER TABLE `logdiplom`
  MODIFY `ID_LogDiplom` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `loggruppa`
--
ALTER TABLE `loggruppa`
  MODIFY `ID_LogGruppa` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `lognagruzka_prepod`
--
ALTER TABLE `lognagruzka_prepod`
  MODIFY `ID_LogNagruzka_prepod` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `logprepod`
--
ALTER TABLE `logprepod`
  MODIFY `ID_LogPrepod` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `logprovedenia_zanatia`
--
ALTER TABLE `logprovedenia_zanatia`
  MODIFY `ID_LogProvedenia_zanatia` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `logstudent`
--
ALTER TABLE `logstudent`
  MODIFY `ID_LogStudent` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблицы `logych_plan`
--
ALTER TABLE `logych_plan`
  MODIFY `ID_LogYch_plan` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `logzachetnay_knizka`
--
ALTER TABLE `logzachetnay_knizka`
  MODIFY `ID_LogZachetnay_Knizka` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `logzachislenie`
--
ALTER TABLE `logzachislenie`
  MODIFY `ID_LogZachislenie` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `nagruzka_prepod`
--
ALTER TABLE `nagruzka_prepod`
  MODIFY `ID_Nagruzka_Prepod` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `pol`
--
ALTER TABLE `pol`
  MODIFY `ID_Pol` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `prepodavateli`
--
ALTER TABLE `prepodavateli`
  MODIFY `ID_Prepodavateli` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `provedenie_zanatia`
--
ALTER TABLE `provedenie_zanatia`
  MODIFY `ID_Provedenie_zanatia` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `student`
--
ALTER TABLE `student`
  MODIFY `ID_Student` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT для таблицы `vid_zanatia`
--
ALTER TABLE `vid_zanatia`
  MODIFY `ID_Vid_Zanatia` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `ych_plan`
--
ALTER TABLE `ych_plan`
  MODIFY `ID_Ych_Plan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `zachet_knizka`
--
ALTER TABLE `zachet_knizka`
  MODIFY `ID_Zachetnaay_Knizka` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `zachislenie_grupp`
--
ALTER TABLE `zachislenie_grupp`
  MODIFY `ID_Zachislenie` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `diplom`
--
ALTER TABLE `diplom`
  ADD CONSTRAINT `diplom_ibfk_1` FOREIGN KEY (`ID_Prepodavateli`) REFERENCES `prepodavateli` (`ID_Prepodavateli`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `diplom_ibfk_2` FOREIGN KEY (`ID_Student`) REFERENCES `student` (`ID_Student`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `gruppa`
--
ALTER TABLE `gruppa`
  ADD CONSTRAINT `gruppa_ibfk_1` FOREIGN KEY (`ID_Kurs`) REFERENCES `kurs` (`ID_Kurs`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `kafedra`
--
ALTER TABLE `kafedra`
  ADD CONSTRAINT `kafedra_ibfk_1` FOREIGN KEY (`ID_Facultet`) REFERENCES `facultet` (`ID_Facultet`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `nagruzka_prepod`
--
ALTER TABLE `nagruzka_prepod`
  ADD CONSTRAINT `nagruzka_prepod_ibfk_1` FOREIGN KEY (`ID_Dichiplina`) REFERENCES `dichiplina` (`ID_Dichiplina`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `nagruzka_prepod_ibfk_2` FOREIGN KEY (`ID_Prepod`) REFERENCES `prepodavateli` (`ID_Prepodavateli`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `prepodavateli`
--
ALTER TABLE `prepodavateli`
  ADD CONSTRAINT `prepodavateli_ibfk_1` FOREIGN KEY (`ID_Kafedra`) REFERENCES `kafedra` (`ID_Kafedra`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `prepodavateli_ibfk_2` FOREIGN KEY (`ID_Kategoria`) REFERENCES `kategoria` (`ID_Kategoria`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `prepodavateli_ibfk_3` FOREIGN KEY (`ID_Pol`) REFERENCES `pol` (`ID_Pol`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `provedenie_zanatia`
--
ALTER TABLE `provedenie_zanatia`
  ADD CONSTRAINT `provedenie_zanatia_ibfk_1` FOREIGN KEY (`ID_Dichiplina`) REFERENCES `dichiplina` (`ID_Dichiplina`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `provedenie_zanatia_ibfk_2` FOREIGN KEY (`ID_Gruppa`) REFERENCES `gruppa` (`ID_Gruppa`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `provedenie_zanatia_ibfk_3` FOREIGN KEY (`ID_Prepodavateli`) REFERENCES `prepodavateli` (`ID_Prepodavateli`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `provedenie_zanatia_ibfk_4` FOREIGN KEY (`ID_Vid_Zanatia`) REFERENCES `vid_zanatia` (`ID_Vid_Zanatia`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`ID_Pol`) REFERENCES `pol` (`ID_Pol`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `student_ibfk_2` FOREIGN KEY (`ID_Forma_Obuchenia`) REFERENCES `forma_obuch` (`ID_Forma_Obuch`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `student_ibfk_3` FOREIGN KEY (`ID_Gruppa`) REFERENCES `gruppa` (`ID_Gruppa`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `ych_plan`
--
ALTER TABLE `ych_plan`
  ADD CONSTRAINT `ych_plan_ibfk_1` FOREIGN KEY (`ID_Dichiplina`) REFERENCES `dichiplina` (`ID_Dichiplina`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `ych_plan_ibfk_2` FOREIGN KEY (`ID_Kafedra`) REFERENCES `kafedra` (`ID_Kafedra`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `ych_plan_ibfk_3` FOREIGN KEY (`ID_Vid_Zanatia`) REFERENCES `vid_zanatia` (`ID_Vid_Zanatia`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `zachet_knizka`
--
ALTER TABLE `zachet_knizka`
  ADD CONSTRAINT `zachet_knizka_ibfk_1` FOREIGN KEY (`ID_Dichiplina`) REFERENCES `dichiplina` (`ID_Dichiplina`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `zachet_knizka_ibfk_2` FOREIGN KEY (`ID_Forma_Kontrol`) REFERENCES `forma_kontrol` (`ID_Forma_Kontrol`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `zachet_knizka_ibfk_3` FOREIGN KEY (`ID_Prepodavateli`) REFERENCES `prepodavateli` (`ID_Prepodavateli`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `zachet_knizka_ibfk_4` FOREIGN KEY (`ID_Student`) REFERENCES `student` (`ID_Student`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `zachislenie_grupp`
--
ALTER TABLE `zachislenie_grupp`
  ADD CONSTRAINT `zachislenie_grupp_ibfk_1` FOREIGN KEY (`ID_Gruppa`) REFERENCES `gruppa` (`ID_Gruppa`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `zachislenie_grupp_ibfk_2` FOREIGN KEY (`ID_Student`) REFERENCES `student` (`ID_Student`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
