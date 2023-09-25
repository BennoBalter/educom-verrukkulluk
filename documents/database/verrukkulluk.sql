-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 25 sep 2023 om 10:19
-- Serverversie: 10.4.28-MariaDB
-- PHP-versie: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `verrukkulluk`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `artikel`
--

CREATE TABLE `artikel` (
  `id` int(255) NOT NULL,
  `artikel_titel` varchar(255) NOT NULL,
  `artikel_omschrijving` varchar(255) NOT NULL,
  `artikel_afbeelding` varchar(255) NOT NULL,
  `artikel_omvang_unit` int(255) NOT NULL,
  `artikel_meeteenheid` varchar(255) NOT NULL,
  `artikel_prijs_unit` int(10) NOT NULL,
  `artikel_voedingswaarden_100` int(10) NOT NULL,
  `artikel_voorraad` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `artikel`
--

INSERT INTO `artikel` (`id`, `artikel_titel`, `artikel_omschrijving`, `artikel_afbeelding`, `artikel_omvang_unit`, `artikel_meeteenheid`, `artikel_prijs_unit`, `artikel_voedingswaarden_100`, `artikel_voorraad`) VALUES
(1, 'pasta', 'italiaanse spaghettipasta', 'url/filepath', 500, 'g', 2, 64, 4),
(2, 'rundergehakt', 'mager gehakt van rundervlees', 'url/filepath', 1000, 'g', 9, 225, 2),
(3, 'friet', 'aardappelfriet diepvries Belgisch', 'url/filepath', 2000, 'g', 4, 131, 8),
(4, 'peperkoek', 'peperkoek, lekker in zuurvlees of voor tussendoor', 'url/filepath', 400, 'g', 1, 169, 11),
(5, 'rijst', 'witte rijst', 'url/filepath', 1000, 'g', 1, 80, 5),
(6, 'bloem', 'bakkersbloem', 'url/filepath', 1000, 'g', 2, 34, 6),
(7, 'filodeeg', 'losse vellen', 'url/filepath', 8, 'stuk', 2, 291, 8),
(8, 'prei', 'verse voorgesneden prei van Hollandse bodem', 'url/filepath', 350, 'g', 1, 7, 3);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `gebruiker`
--

CREATE TABLE `gebruiker` (
  `id` int(11) NOT NULL,
  `gebruiker_naam` varchar(255) NOT NULL,
  `gebruiker_wachtwoord` varchar(255) NOT NULL,
  `gebruiker_email` varchar(255) NOT NULL,
  `gebruiker_afbeelding` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `gebruiker`
--

INSERT INTO `gebruiker` (`id`, `gebruiker_naam`, `gebruiker_wachtwoord`, `gebruiker_email`, `gebruiker_afbeelding`) VALUES
(1, 'Aapje', 'Aapje1991!', 'aapje1991@live.nl', 'url'),
(2, 'Beepje', 'Beepje1991!', 'beepje1991@live.nl', 'url'),
(3, 'Ceepje', 'Ceepje1991!', 'ceepje1991@live.nl', 'url'),
(4, 'Deepje', 'Deepje1991!', 'deepje1991@live.nl', 'url');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `ingrediënt`
--

CREATE TABLE `ingrediënt` (
  `id` int(255) NOT NULL,
  `recept_id` int(255) NOT NULL,
  `artikel_id` int(255) NOT NULL,
  `artikel_hoeveelheid` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `ingrediënt`
--

INSERT INTO `ingrediënt` (`id`, `recept_id`, `artikel_id`, `artikel_hoeveelheid`) VALUES
(29, 1, 1, 150),
(30, 2, 3, 200),
(31, 1, 2, 250),
(32, 2, 4, 80),
(33, 3, 5, 150),
(34, 3, 6, 350),
(35, 4, 7, 4),
(36, 4, 8, 700);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `keukentype`
--

CREATE TABLE `keukentype` (
  `id` int(255) NOT NULL,
  `record_type_keukenoftype` varchar(255) NOT NULL,
  `recept_keukentype_omschrijving` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `keukentype`
--

INSERT INTO `keukentype` (`id`, `record_type_keukenoftype`, `recept_keukentype_omschrijving`) VALUES
(9, 'K', 'Nederlands'),
(10, 'T', 'Vleesgerecht'),
(14, 'T', 'Gebaksgerecht'),
(15, 'K', 'Vietnamees'),
(16, 'T', 'Veganistisch');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `recept`
--

CREATE TABLE `recept` (
  `id` int(255) NOT NULL,
  `recept_titel` varchar(255) NOT NULL,
  `recept_omschrijving` varchar(255) NOT NULL,
  `gebruiker_id` int(255) NOT NULL,
  `recept_datum_toegevoegd` date NOT NULL,
  `recept_afbeelding` varchar(255) NOT NULL,
  `recept_keuken_id` int(255) NOT NULL,
  `recept_type_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `recept`
--

INSERT INTO `recept` (`id`, `recept_titel`, `recept_omschrijving`, `gebruiker_id`, `recept_datum_toegevoegd`, `recept_afbeelding`, `recept_keuken_id`, `recept_type_id`) VALUES
(1, 'Spaghetti Bolognese', 'Lorem ipsum dolor sit amet.', 1, '2020-09-10', 'url/filepath', 9, 10),
(2, 'Zuurvlees', 'Lorem ipsum dolor sit amet.', 0, '2021-09-25', 'url/filepath', 9, 10),
(3, 'Rijstevlaai', 'Lorem ipsum dolor sit amet.', 0, '2018-09-05', 'url/filepath', 9, 14),
(4, 'Loempia\'s', 'Lorem ipsum dolor sit amet.', 0, '2019-09-11', 'url/filepath', 15, 16);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `receptinfo`
--

CREATE TABLE `receptinfo` (
  `id` int(11) NOT NULL,
  `record_type` varchar(1) NOT NULL,
  `recept_id` int(20) NOT NULL,
  `gebruiker_id` int(11) NOT NULL,
  `datum` date DEFAULT NULL,
  `num` int(20) NOT NULL,
  `text` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `receptinfo`
--

INSERT INTO `receptinfo` (`id`, `record_type`, `recept_id`, `gebruiker_id`, `datum`, `num`, `text`) VALUES
(1, 'O', 1, 1, '2016-09-02', 0, 'Toppie'),
(2, 'O', 2, 2, '2019-10-10', 0, 'Moet een beetje ketj'),
(3, 'O', 3, 3, '2021-11-02', 0, 'Prima'),
(4, 'O', 4, 4, '2019-06-12', 0, 'Lekker'),
(5, 'B', 1, 1, '0000-00-00', 1, 'Verzamel ingrediënten'),
(6, 'B', 2, 1, '0000-00-00', 2, 'Voeg ingrediënten samen'),
(7, 'B', 2, 1, '0000-00-00', 1, 'Verzamel ingrediënten'),
(8, 'B', 1, 1, '0000-00-00', 2, 'Voeg ingrediënten samen'),
(9, 'B', 3, 1, '0000-00-00', 1, 'Verzamel ingrediënten'),
(10, 'B', 3, 1, '0000-00-00', 2, 'Voeg ingrediënten samen'),
(11, 'B', 4, 1, '0000-00-00', 1, 'Verzamel ingrediënten'),
(12, 'B', 4, 1, '0000-00-00', 2, 'Voeg ingrediënten samen'),
(13, 'F', 1, 2, '0000-00-00', 0, ''),
(14, 'F', 2, 3, '0000-00-00', 0, ''),
(15, 'F', 3, 1, '0000-00-00', 0, ''),
(16, 'F', 4, 4, '0000-00-00', 0, ''),
(17, 'W', 1, 1, '0000-00-00', 5, ''),
(18, 'W', 2, 1, '0000-00-00', 4, ''),
(19, 'W', 3, 1, '0000-00-00', 5, ''),
(20, 'W', 4, 1, '0000-00-00', 5, '');

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `artikel`
--
ALTER TABLE `artikel`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `gebruiker`
--
ALTER TABLE `gebruiker`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `ingrediënt`
--
ALTER TABLE `ingrediënt`
  ADD PRIMARY KEY (`id`),
  ADD KEY `artikel_id` (`artikel_id`),
  ADD KEY `recept_id` (`recept_id`);

--
-- Indexen voor tabel `keukentype`
--
ALTER TABLE `keukentype`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `recept`
--
ALTER TABLE `recept`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recept_keuken_id` (`recept_keuken_id`),
  ADD KEY `recept_type_id` (`recept_type_id`);

--
-- Indexen voor tabel `receptinfo`
--
ALTER TABLE `receptinfo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recept_id` (`recept_id`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `artikel`
--
ALTER TABLE `artikel`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT voor een tabel `gebruiker`
--
ALTER TABLE `gebruiker`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT voor een tabel `ingrediënt`
--
ALTER TABLE `ingrediënt`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT voor een tabel `keukentype`
--
ALTER TABLE `keukentype`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT voor een tabel `recept`
--
ALTER TABLE `recept`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT voor een tabel `receptinfo`
--
ALTER TABLE `receptinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `ingrediënt`
--
ALTER TABLE `ingrediënt`
  ADD CONSTRAINT `ingrediënt_ibfk_1` FOREIGN KEY (`artikel_id`) REFERENCES `artikel` (`id`),
  ADD CONSTRAINT `ingrediënt_ibfk_2` FOREIGN KEY (`recept_id`) REFERENCES `recept` (`id`);

--
-- Beperkingen voor tabel `recept`
--
ALTER TABLE `recept`
  ADD CONSTRAINT `recept_ibfk_1` FOREIGN KEY (`recept_keuken_id`) REFERENCES `keukentype` (`id`),
  ADD CONSTRAINT `recept_ibfk_2` FOREIGN KEY (`recept_type_id`) REFERENCES `keukentype` (`id`);

--
-- Beperkingen voor tabel `receptinfo`
--
ALTER TABLE `receptinfo`
  ADD CONSTRAINT `receptinfo_ibfk_1` FOREIGN KEY (`recept_id`) REFERENCES `recept` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
