-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 22 sep 2023 om 14:11
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

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `keukentype`
--

CREATE TABLE `keukentype` (
  `id` int(255) NOT NULL,
  `record_type_keukenoftype` varchar(255) NOT NULL,
  `recept_keukentype_omschrijving` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `receptinfo`
--

CREATE TABLE `receptinfo` (
  `id` int(11) NOT NULL,
  `record_type` varchar(1) NOT NULL,
  `recept_id` int(20) NOT NULL,
  `gebruiker_id` int(11) NOT NULL,
  `datum` date NOT NULL,
  `num` int(20) NOT NULL,
  `text` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  ADD KEY `gebruiker_id` (`gebruiker_id`),
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
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT voor een tabel `keukentype`
--
ALTER TABLE `keukentype`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
  ADD CONSTRAINT `recept_ibfk_1` FOREIGN KEY (`gebruiker_id`) REFERENCES `gebruiker` (`id`),
  ADD CONSTRAINT `recept_ibfk_2` FOREIGN KEY (`recept_keuken_id`) REFERENCES `keukentype` (`id`),
  ADD CONSTRAINT `recept_ibfk_3` FOREIGN KEY (`recept_type_id`) REFERENCES `keukentype` (`id`);

--
-- Beperkingen voor tabel `receptinfo`
--
ALTER TABLE `receptinfo`
  ADD CONSTRAINT `receptinfo_ibfk_1` FOREIGN KEY (`gebruiker_id`) REFERENCES `gebruiker` (`id`),
  ADD CONSTRAINT `receptinfo_ibfk_2` FOREIGN KEY (`recept_id`) REFERENCES `recept` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
