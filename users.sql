/*
 * Author:       kgoespiritu
 * Create Date:  20150425
 * Summary:      CREATE TABLE users
                 MySQL 5.6 Database
 */

CREATE TABLE users
(
`id`          INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
`active`      BOOL NOT NULL DEFAULT 0,
`username`    VARCHAR(50)
);

ALTER TABLE users ADD COLUMN `active` BOOL NOT NULL DEFAULT 0 AFTER `id`