/*
 * Author:       kgoespiritu
 * Create Date:  20150425
 * Summary:      CREATE TABLE categorytag
                 MySQL 5.6 Database
 */

CREATE TABLE categorytag
(
`category_id`      INT UNSIGNED,
`article_id`      INT UNSIGNED,
PRIMARY KEY categorytag_pk (`category_id`,`article_id`)
);