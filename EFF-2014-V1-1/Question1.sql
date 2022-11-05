CREATE DATABASE EFF2014_V1_1;
USE EFF2014_V1_1;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";



-- Database: `eff_2014_v1_1`
--

-- --------------------------------------------------------

--
-- Table structure for table `Academie`
--

CREATE TABLE `Academie` (
  `idAcademie` int(11) NOT NULL,
  `NomAcademie` varchar(255) NOT NULL,
  `idRegion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Academie`
--

INSERT INTO `Academie` (`idAcademie`, `NomAcademie`, `idRegion`) VALUES
(1, 'a1', 1),
(2, 'a2', 1),
(3, 'a3', 1),
(4, 'a4', 1),
(5, 'a5', 2),
(6, 'a6', 2),
(7, 'a7', 3),
(8, 'a8', 3);

-- --------------------------------------------------------

--
-- Table structure for table `Demande`
--

CREATE TABLE `Demande` (
  `idDemande` int(11) NOT NULL,
  `DateDem` date NOT NULL,
  `idProfesseur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Demande`
--

INSERT INTO `Demande` (`idDemande`, `DateDem`, `idProfesseur`) VALUES
(1, '2022-11-01', 1),
(2, '2022-11-01', 1),
(3, '2022-11-02', 2);

-- --------------------------------------------------------

--
-- Table structure for table `Detail_Demande`
--

CREATE TABLE `Detail_Demande` (
  `idDemande` int(11) NOT NULL,
  `idLycee` int(11) NOT NULL,
  `NurnOrdre` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Detail_Demande`
--

INSERT INTO `Detail_Demande` (`idDemande`, `idLycee`, `NurnOrdre`) VALUES
(1, 2, 1),
(2, 3, 2),
(3, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Lycee`
--

CREATE TABLE `Lycee` (
  `idLycee` int(11) NOT NULL,
  `NomLycee` varchar(255) NOT NULL,
  `Ville` varchar(255) NOT NULL,
  `idAcademie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Lycee`
--

INSERT INTO `Lycee` (`idLycee`, `NomLycee`, `Ville`, `idAcademie`) VALUES
(1, 'ly1', 'v1', 1),
(2, 'ly2', 'v1', 6),
(3, 'ly2', 'v1', 7),
(4, 'ly4', 'v2', 3),
(5, 'ly1', 'v1', 1),
(6, 'ly2', 'v1', 1),
(7, 'ly2', 'v1', 1),
(8, 'ly4', 'v2', 3);

-- --------------------------------------------------------

--
-- Table structure for table `professeur`
--

CREATE TABLE `professeur` (
  `idProfesseur` int(11) NOT NULL,
  `Nom` varchar(255) NOT NULL,
  `Prenom` varchar(255) NOT NULL,
  `DateN` date NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Pass` varchar(255) NOT NULL,
  `dateAfflycee` date NOT NULL,
  `EtatCivil` varchar(255) NOT NULL,
  `NEnfants` int(11) NOT NULL,
  `idLycee` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `professeur`
--

INSERT INTO `professeur` (`idProfesseur`, `Nom`, `Prenom`, `DateN`, `Email`, `Pass`, `dateAfflycee`, `EtatCivil`, `NEnfants`, `idLycee`) VALUES
(1, 'pro1', 'salam', '2022-10-05', 'email', 'password', '2018-10-05', 'clb', 0, 1),
(2, 'pro1', 'salam', '2022-10-05', 'email', 'password', '2018-10-05', 'clb', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Region`
--

CREATE TABLE `Region` (
  `idRegion` int(11) NOT NULL,
  `nomRegion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Region`
--

INSERT INTO `Region` (`idRegion`, `nomRegion`) VALUES
(1, 'r1'),
(2, 'r2'),
(3, 'r1'),
(4, 'r2'),
(5, 'r3'),
(6, 'r4');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Academie`
--
ALTER TABLE `Academie`
  ADD PRIMARY KEY (`idAcademie`),
  ADD KEY `ldReqion` (`idRegion`);

--
-- Indexes for table `Demande`
--
ALTER TABLE `Demande`
  ADD PRIMARY KEY (`idDemande`),
  ADD KEY `ldProfesseur` (`idProfesseur`);

--
-- Indexes for table `Detail_Demande`
--
ALTER TABLE `Detail_Demande`
  ADD PRIMARY KEY (`idDemande`,`idLycee`),
  ADD KEY `Detail_Demande_ibfk_2` (`idLycee`);

--
-- Indexes for table `Lycee`
--
ALTER TABLE `Lycee`
  ADD PRIMARY KEY (`idLycee`),
  ADD KEY `ldAcademie` (`idAcademie`);

--
-- Indexes for table `professeur`
--
ALTER TABLE `professeur`
  ADD PRIMARY KEY (`idProfesseur`),
  ADD KEY `ldLycee` (`idLycee`);

--
-- Indexes for table `Region`
--
ALTER TABLE `Region`
  ADD PRIMARY KEY (`idRegion`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Academie`
--
ALTER TABLE `Academie`
  MODIFY `idAcademie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `Demande`
--
ALTER TABLE `Demande`
  MODIFY `idDemande` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `Lycee`
--
ALTER TABLE `Lycee`
  MODIFY `idLycee` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `professeur`
--
ALTER TABLE `professeur`
  MODIFY `idProfesseur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Region`
--
ALTER TABLE `Region`
  MODIFY `idRegion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Academie`
--
ALTER TABLE `Academie`
  ADD CONSTRAINT `Academie_ibfk_1` FOREIGN KEY (`idRegion`) REFERENCES `Region` (`idRegion`);

--
-- Constraints for table `Demande`
--
ALTER TABLE `Demande`
  ADD CONSTRAINT `Demande_ibfk_1` FOREIGN KEY (`idProfesseur`) REFERENCES `professeur` (`idProfesseur`);

--
-- Constraints for table `Detail_Demande`
--
ALTER TABLE `Detail_Demande`
  ADD CONSTRAINT `Detail_Demande_ibfk_1` FOREIGN KEY (`idDemande`) REFERENCES `Demande` (`idDemande`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Detail_Demande_ibfk_2` FOREIGN KEY (`idLycee`) REFERENCES `Lycee` (`idLycee`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Lycee`
--
ALTER TABLE `Lycee`
  ADD CONSTRAINT `Lycee_ibfk_1` FOREIGN KEY (`idAcademie`) REFERENCES `Academie` (`idAcademie`);

--
-- Constraints for table `professeur`
--
ALTER TABLE `professeur`
  ADD CONSTRAINT `professeur_ibfk_1` FOREIGN KEY (`idLycee`) REFERENCES `Lycee` (`idLycee`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
