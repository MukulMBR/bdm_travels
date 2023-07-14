SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `busNumber` text NOT NULL,
  `seatNumber` int(11) NOT NULL,
  `username` text NOT NULL,
  `bookingTime` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE `bookings`
ADD FOREIGN KEY (`id`) REFERENCES `buses`(`id`);

ALTER TABLE `bookings`
ADD FOREIGN KEY (`id`) REFERENCES `login`(`id`);

