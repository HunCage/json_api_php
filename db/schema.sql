-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Gép: pelda_host:3306
-- Létrehozás ideje: 2021. Máj 26. 16:46
-- Kiszolgáló verziója: 8.0.25
-- PHP verzió: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `test_db`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `instruments`
--

CREATE TABLE `instruments` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `brand` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `price` int DEFAULT NULL,
  `quantity` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- A tábla adatainak kiíratása `instruments`
--

INSERT INTO `instruments` (`id`, `name`, `description`, `brand`, `price`, `quantity`) VALUES
(1, 'American Original 50s Telecaster', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam scelerisque, justo id dapibus convallis, est sapien consequat nibh, ut tristique tellus magna a mi. Vestibulum interdum orci non lectus tincidunt dictum. Etiam facilisis orci a elit facilisis, ac pretium velit dictum. Pellentesque eu auctor diam. Curabitur suscipit leo eu sollicitudin venenatis.', 'Fender', 649900, 1),
(2, 'Troublemaker Telecaster', 'Quisque vel tellus nec leo vestibulum molestie. Donec fringilla urna non erat dictum posuere. Nullam luctus convallis facilisis. Praesent elementum varius metus sit amet elementum. Praesent vitae leo non sapien rutrum elementum. Aenean eget hendrerit turpis. Morbi in sagittis quam, varius finibus nisi. Sed eu mi malesuada, semper felis eu, rutrum tellus. Quisque rutrum id dui vitae luctus. Praesent vehicula cursus mollis.', 'Fender', 469990, 3),
(3, 'PM-2 Standard Parlor, Natural', 'Nulla mollis arcu magna. Mauris ac commodo turpis, eget placerat ligula. Suspendisse potenti. Nullam congue nisi at quam interdum, eget consectetur sem ultricies. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Vestibulum scelerisque risus mi, eget lacinia purus sagittis in. Suspendisse blandit eu est a placerat.', 'Fender', 217500, 8),
(4, 'Steve Vai Signature JEM77 - Blue Floral Pattern', 'Nunc lorem lacus, commodo a eros a, venenatis eleifend nunc. Pellentesque interdum, odio tincidunt aliquam aliquam, velit nulla tempus tortor, non tempus mi turpis ut risus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Vivamus vitae aliquet arcu. Sed pretium, ipsum sed sagittis tempus, magna ligula sollicitudin massa, mollis suscipit arcu arcu sed est. Nam eleifend dui ante, sit amet ultrices dui laoreet ac.', 'Ibanez', 474775, 2),
(5, 'J Custom RG8560 Electric Guitar - Sapphire Blue', 'Vivamus eu purus luctus, porta orci et, gravida nulla. Duis elementum lacus eu arcu ullamcorper tincidunt. Integer quis sem et ante mollis finibus vitae et nunc. Sed porttitor interdum ipsum, sit amet varius dui convallis non. Mauris lobortis erat ac urna dictum mollis. Nam luctus urna quis erat venenatis, imperdiet dapibus est sodales. Fusce ornare consequat felis, eu accumsan erat vulputate quis. Donec suscipit consequat mi quis posuere. Donec nulla augue, imperdiet sed orci at, tristique pretium ipsum. Mauris a lacus mauris. Integer pretium fringilla lacus vitae dignissim.', 'Ibanez', 892800, 1),
(6, 'Viper-1000 - See Thru Black Cherry Satin', 'Vivamus eu purus luctus, porta orci et, gravida nulla. Duis elementum lacus eu arcu ullamcorper tincidunt. Integer quis sem et ante mollis finibus vitae et nunc. Sed porttitor interdum ipsum, sit amet varius dui convallis non. Mauris lobortis erat ac urna dictum mollis. Nam luctus urna quis erat venenatis, imperdiet dapibus est sodales.', 'ESP LTD', 329000, 4);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `instruments`
--
ALTER TABLE `instruments`
  ADD PRIMARY KEY (`id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `instruments`
--
ALTER TABLE `instruments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
