CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(10) unsigned NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `enabled` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

CREATE TABLE IF NOT EXISTS `role` (
  `role_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `role` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


ALTER TABLE `role`
  ADD PRIMARY KEY (`role_id`), ADD KEY `user_id` (`user_id`);

ALTER TABLE `role`
ADD CONSTRAINT `role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

-- To insert records execute following SQL

INSERT INTO `user` (`user_id`, `first_name`, `last_name`, `email`, `user_name`, `password`, `enabled`) VALUES
(1, 'Kate', 'Morton', 'kate123@gmail.com', 'kate', '$2a$10$niwmCfG7XiV455YZ1550je7qmQ/AjyYc1McxAcr8LRsUBlJzUwWB6', 1),
(2, 'Alex', 'Perry', 'alex123@yahoo.com', 'alex', '$2a$10$nka18qu7p/uaZd82BV32auRs2Pdi7Cx1rstd08JGuuKp535XfIa1y', 1);

INSERT INTO `role` (`role_id`, `user_id`, `role`) VALUES
(1, 1, 'ROLE_ADMIN'),
(2, 2, 'ROLE_USER');


-- Oracle DB Specific
-- For boolean @Column (@Column(name = "enabled", nullable = false, columnDefinition = "NUMBER(1)"))

INSERT INTO users (user_id, first_name, last_name, email, user_name, password, enabled) VALUES
(1, 'Kate', 'Morton', 'kate123@gmail.com', 'kate', '$2a$10$niwmCfG7XiV455YZ1550je7qmQ/AjyYc1McxAcr8LRsUBlJzUwWB6', 1);

INSERT INTO users (user_id, first_name, last_name, email, user_name, password, enabled) VALUES
(2, 'Alex', 'Perry', 'alex123@yahoo.com', 'alex', '$2a$10$nka18qu7p/uaZd82BV32auRs2Pdi7Cx1rstd08JGuuKp535XfIa1y', 1);

INSERT INTO role (role_id, user_id, role) VALUES
(1, 1, 'ROLE_ADMIN');

INSERT INTO role (role_id, user_id, role) VALUES
(2, 2, 'ROLE_USER');



CREATE SEQUENCE RANDOM_CONTAINER_SEQ INCREMENT BY 1 START WITH 100000000 MAXVALUE 9999999999999999 CYCLE NOCACHE;


