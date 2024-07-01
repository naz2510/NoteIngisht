
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;





CREATE TABLE `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `content` varchar(1000) NOT NULL,CREATE TABLE `todo2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `todo` varchar(45) NOT NULL,
  `tdate` date DEFAULT NULL,
  `status` varchar(45) NOT NULL,
  `uid1` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid1_idx` (`uid1`),
  CONSTRAINT `uid1` FOREIGN KEY (`uid1`) REFERENCES `user2` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `uid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid_idx` (`uid`),
  CONSTRAINT `uid` FOREIGN KEY (`uid`) REFERENCES `user2` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
SELECT * FROM notes_saver.post;




CREATE TABLE `todo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `todo` varchar(45) NOT NULL,
  `tdate` date DEFAULT NULL,
  `status` varchar(45) NOT NULL,
  `uid1` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid1_idx` (`uid1`),
  CONSTRAINT `uid1` FOREIGN KEY (`uid1`) REFERENCES `user2` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






