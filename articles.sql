/*
 * Author:       kgoespiritu
 * Create Date:  20150425
 * Summary:      CREATE TABLE articles
                 MySQL 5.6 Database
 */

--------------------------------------------------------------------
CREATE TABLE article
(
`id`           INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
`author_id`    INT UNSIGNED NOT NULL DEFAULT 0,
`category_id`  INT UNSIGNED NOT NULL DEFAULT 0,
`active`       BOOL NOT NULL DEFAULT 0,
`title`        VARCHAR(50) NOT NULL,
`text`         TEXT,
`thumb_file`   VARCHAR(50),
`date`         datetime DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE article ADD COLUMN `thumb_file` VARCHAR(50) AFTER `text`;
---------------------------------------------------------------------

USE test;
CREATE TABLE article
(
id         INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
author_id    INT UNSIGNED NOT NULL DEFAULT 0,
category_id  INT UNSIGNED NOT NULL DEFAULT 0,
active       BOOL NOT NULL DEFAULT 0,
title        VARCHAR(50) NOT NULL,
record_text         TEXT,
thumb_file   VARCHAR(50),
record_date         datetime DEFAULT CURRENT_TIMESTAMP
);

----------------------------------------------------------------------

/*
PARTITION BY RANGE ( YEAR(`date`) )
SUBPARTITION BY HASH ( MONTH(`date`) )
SUBPARTITIONS 12
(
PARTITION p0 VALUES LESS THAN (2000),
PARTITION p1 VALUES LESS THAN (2005),
PARTITION p2 VALUES LESS THAN (2010),
PARTITION p3 VALUES LESS THAN (2015),
PARTITION p4 VALUES LESS THAN (2020)
);
*/
