SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

CREATE TABLE `buses` (
  `id` int(11) NOT NULL,
  `busName` text NOT NULL,
  `busNumber` text NOT NULL,
  `busCapacity` int(11) NOT NULL,
  `busDetails` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `buses` (`id`,`busName`, `busNumber`, `busCapacity`,`busDetails`) VALUES
('1','Bus 1', '1234', 50, 'Guntur-Hyderabad'),
('2','Bus 2', '5678', 40, 'Vijayawada-Hyderabad'),
('3','Bus 3', '9012', 30, 'Vijayawada-Chennai');

ALTER TABLE `buses` ADD PRIMARY KEY (`id`);
ALTER TABLE `buses` MODIFY `id` int(11) 
  NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
