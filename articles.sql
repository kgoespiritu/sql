/*
 * Author:       kgoespiritu
 * Create Date:  20150425
 * Summary:      CREATE TABLE articles
                 MySQL 5.6 Database
 */

--------------------------------------------------------------------
/* OLD Structure with RESERVED WORDS */
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
/* With Year PARTITION , HASH , 1 PARTITION ( Default ) */
CREATE TABLE article
(
id         INT UNSIGNED AUTO_INCREMENT,
author_id    INT UNSIGNED NOT NULL DEFAULT 0,
category_id  INT UNSIGNED NOT NULL DEFAULT 0,
active       BOOL NOT NULL DEFAULT 0,
title        VARCHAR(50) NOT NULL,
record_text         TEXT,
thumb_file   VARCHAR(50),
record_date         datetime DEFAULT CURRENT_TIMESTAMP,
KEY(id,record_date)
)
PARTITION BY HASH ( YEAR(record_date) );
----------------------------------------------------------------------
/* Range Partitioning */
CREATE TABLE article
(
id         INT UNSIGNED AUTO_INCREMENT,
author_id    INT UNSIGNED NOT NULL DEFAULT 0,
category_id  INT UNSIGNED NOT NULL DEFAULT 0,
active       BOOL NOT NULL DEFAULT 0,
title        VARCHAR(50) NOT NULL,
record_text         TEXT,
thumb_file   VARCHAR(50),
record_date         datetime DEFAULT CURRENT_TIMESTAMP,
KEY(id,record_date)
)
PARTITION BY RANGE ( YEAR(record_date) )
(
PARTITION p0 VALUES LESS THAN (2000),
PARTITION p1 VALUES LESS THAN (2005),
PARTITION p2 VALUES LESS THAN (2010),
PARTITION p3 VALUES LESS THAN (2015),
PARTITION p4 VALUES LESS THAN (2020)
);

----------------------------------------------------------------------

/* Range Partitioning */
CREATE TABLE article
(
id         INT UNSIGNED AUTO_INCREMENT,
author_id    INT UNSIGNED NOT NULL DEFAULT 0,
category_id  INT UNSIGNED NOT NULL DEFAULT 0,
active       BOOL NOT NULL DEFAULT 0,
title        VARCHAR(50) NOT NULL,
record_text         TEXT,
thumb_file   VARCHAR(50),
record_date         datetime DEFAULT CURRENT_TIMESTAMP,
KEY(id,record_date)
)
PARTITION BY RANGE ( (YEAR(record_date) * 100) + MONTH(record_date))
(
PARTITION p0 VALUES LESS THAN (200000),
PARTITION p1 VALUES LESS THAN (200500),
PARTITION p2 VALUES LESS THAN (201000),
PARTITION p4 VALUES LESS THAN (201101),
PARTITION p5 VALUES LESS THAN (201201),
PARTITION p6 VALUES LESS THAN (201301),
PARTITION p7 VALUES LESS THAN (201401),
PARTITION p8 VALUES LESS THAN (201501),
PARTITION p9 VALUES LESS THAN (201601),
PARTITION p10 VALUES LESS THAN (201701),
PARTITION p11 VALUES LESS THAN (201801),
PARTITION p12 VALUES LESS THAN (201901),
PARTITION p13 VALUES LESS THAN (202001)
);

EXPLAIN PARTITIONS SELECT * FROM article WHERE YEAR(record_date) = 2010;
-- 13 partitions;

EXPLAIN PARTITIONS SELECT * FROM article WHERE record_date = '2010-05-01';
-- 2 partitions;

EXPLAIN PARTITIONS SELECT * FROM article WHERE record_date < '2010-05-01' AND record_date > '2010-01-01';
-- 13 partitions

----------------------------------------------------------------------
/* Range Partitioning , Hash Subpartition 12s */
CREATE TABLE article
(
id         INT UNSIGNED AUTO_INCREMENT,
author_id    INT UNSIGNED NOT NULL DEFAULT 0,
category_id  INT UNSIGNED NOT NULL DEFAULT 0,
active       BOOL NOT NULL DEFAULT 0,
title        VARCHAR(50) NOT NULL,
record_text         TEXT,
thumb_file   VARCHAR(50),
record_date         datetime DEFAULT CURRENT_TIMESTAMP,
KEY(id,record_date)
)
PARTITION BY RANGE ( YEAR(record_date) )
SUBPARTITION BY HASH ( MONTH(record_date) )
SUBPARTITIONS 12
(
PARTITION p0 VALUES LESS THAN (2000),
PARTITION p1 VALUES LESS THAN (2005),
PARTITION p2 VALUES LESS THAN (2010),
PARTITION p3 VALUES LESS THAN (2015),
PARTITION p4 VALUES LESS THAN (2020)
);

EXPLAIN PARTITIONS SELECT * FROM article WHERE YEAR(record_date) = 2010;
-- 60 partitions;

EXPLAIN PARTITIONS SELECT * FROM article WHERE record_date = '2010-05-01';
-- 2 partitions;

EXPLAIN PARTITIONS SELECT * FROM article WHERE record_date < '2010-05-01' AND record_date > '2010-01-01';
-- 12 partitions

------------------------------------------------------------------------

/* HASH Partitioning */
CREATE TABLE article
(
id         INT UNSIGNED AUTO_INCREMENT,
author_id    INT UNSIGNED NOT NULL DEFAULT 0,
category_id  INT UNSIGNED NOT NULL DEFAULT 0,
active       BOOL NOT NULL DEFAULT 0,
title        VARCHAR(50) NOT NULL,
record_text         TEXT,
thumb_file   VARCHAR(50),
record_date         datetime DEFAULT CURRENT_TIMESTAMP,
KEY(id,record_date)
)
PARTITION BY HASH ( (YEAR(record_date) * 100) + MONTH(record_date))
PARTITIONS 100;

EXPLAIN PARTITIONS SELECT * FROM article WHERE YEAR(record_date) = 2010;
-- 60 partitions;

EXPLAIN PARTITIONS SELECT * FROM article WHERE record_date = '2010-05-01';
-- 2 partitions;

EXPLAIN PARTITIONS SELECT * FROM article WHERE record_date < '2010-05-01' AND record_date > '2010-01-01';
-- 12 partitions

------------------------------------------------------------------------

/* HASH Partitioning */
CREATE TABLE article
(
id         INT UNSIGNED AUTO_INCREMENT,
author_id    INT UNSIGNED NOT NULL DEFAULT 0,
category_id  INT UNSIGNED NOT NULL DEFAULT 0,
active       BOOL NOT NULL DEFAULT 0,
title        VARCHAR(50) NOT NULL,
record_text         TEXT,
thumb_file   VARCHAR(50),
record_date         datetime DEFAULT CURRENT_TIMESTAMP,
KEY(id,record_date)
)
PARTITION BY HASH(to_days(record_date)
PARTITIONS 100;

EXPLAIN PARTITIONS SELECT * FROM article WHERE YEAR(record_date) = 2010;
-- 100 partitions;

EXPLAIN PARTITIONS SELECT * FROM article WHERE record_date = '2010-05-01';
-- 2 partitions;

EXPLAIN PARTITIONS SELECT * FROM article WHERE record_date < '2010-05-01' AND record_date > '2010-01-01';
-- 100 partitions

EXPLAIN PARTITIONS SELECT * FROM article WHERE record_date BETWEEN '2010-02-01' AND '2010-05-01';
-- 100 partitions

EXPLAIN PARTITIONS SELECT * FROM article WHERE record_date BETWEEN unix_timestamp('2010-02-01') AND unix_timestamp('2010-05-01');
-- 100 partitions

---------------------------------------------------------------------------------------

/* HASH / HASH Partitioning */
/* NOT POSSIBLE : it is only possible to mix range/list partitioning with hash/key partitioning */

---------------------------------------------------------------------------------------

/* RANGE / HASH Partitioning */
CREATE TABLE article
(
id         INT UNSIGNED AUTO_INCREMENT,
author_id    INT UNSIGNED NOT NULL DEFAULT 0,
category_id  INT UNSIGNED NOT NULL DEFAULT 0,
active       BOOL NOT NULL DEFAULT 0,
title        VARCHAR(50) NOT NULL,
record_text         TEXT,
thumb_file   VARCHAR(50),
record_date         datetime DEFAULT CURRENT_TIMESTAMP,
KEY(id,record_date)
)
PARTITION BY RANGE(YEAR(record_date))
SUBPARTITION BY HASH(MONTH(record_date))
SUBPARTITIONS 12
(
PARTITION p1990 VALUES LESS THAN (1990),
PARTITION p2000 VALUES LESS THAN (2000),
PARTITION p2005 VALUES LESS THAN (2005),
PARTITION p2006 VALUES LESS THAN (2006),
PARTITION p2007 VALUES LESS THAN (2007),
PARTITION p2008 VALUES LESS THAN (2008),
PARTITION p2009 VALUES LESS THAN (2009),
PARTITION p2010 VALUES LESS THAN (2010),
PARTITION p2011 VALUES LESS THAN (2011),
PARTITION p2012 VALUES LESS THAN (2012),
PARTITION p2013 VALUES LESS THAN (2013),
PARTITION p2014 VALUES LESS THAN (2014),
PARTITION p2015 VALUES LESS THAN (2015),
PARTITION p2016 VALUES LESS THAN (2016),
PARTITION p2017 VALUES LESS THAN (2017),
PARTITION p2018 VALUES LESS THAN (2018),
PARTITION p2019 VALUES LESS THAN (2019),
PARTITION p2020 VALUES LESS THAN (2020)
);
EXPLAIN PARTITIONS SELECT * FROM article WHERE YEAR(record_date) = 2010;
-- 216 partitions;

EXPLAIN PARTITIONS SELECT * FROM article WHERE record_date = '2010-05-01';
-- 2 partitions;

EXPLAIN PARTITIONS SELECT * FROM article WHERE record_date < '2010-05-01' AND record_date > '2010-01-01';
-- 12 partitions

EXPLAIN PARTITIONS SELECT * FROM article WHERE record_date BETWEEN '2010-02-01' AND '2010-05-01';
-- 12 partitions

EXPLAIN PARTITIONS SELECT * FROM article WHERE record_date BETWEEN unix_timestamp('2010-02-01') AND unix_timestamp('2010-05-01');
-- 216 partitions
------------------------------------------------------------------------

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
