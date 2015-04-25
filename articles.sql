/*
 * Author:       kgoespiritu
 * Create Date:  20150425
 * Summary:      CREATE TABLE articles
                 MySQL 5.6 Database
 */

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