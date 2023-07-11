SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



INSERT INTO `login` (`id`, `username`, `password`) VALUES
(1, 'mukul@gmail.com', 'mukul'),
(2, 'bushi@gmail.com', 'bushi'),
(3, 'reddy@gmail.com', 'reddy'),
(4, 'mbr@gmail.com', 'mbr'),
(5, 'blue@gmail.com', 'blue');

ALTER TABLE `login` ADD PRIMARY KEY (`id`);
ALTER TABLE `login` MODIFY `id` int(11) 
  NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;