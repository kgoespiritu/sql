/*
 * Author:       kgoespiritu
 * Create Date:  20150425
 * Summary:      CREATE TABLE categories
                 MySQL 5.6 Database
 */

/*
 * categories :
 * sql
 * mysql
 * html
 * javascript
 * css
 * php
 * jquery
 * c++
 * vb
 * java
 * c#
 * unix shell
 * dos
 * powershell
 */

CREATE TABLE categories
(
`id`      INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
`name`    VARCHAR(50)
);

INSERT INTO categories (`name`) VALUES 
('sql'),('mysql'),('html'),('javascript'),('css'),('php'),
('jquery'),('c++'),('vb'),('java'),('c#'),('unix shell'),('dos'),('powershell');