INSERT
[ LOW_PRIORITY | DELAYED | HIGH_PRIORITY ]
[ IGNORE ]
INTO 'table_name'
PARTITION( ... )
---
( col_name , ... )
{ VALUE | VALUES } ( col_name , ... )
ON DUPLICATE KEY SET var=val , ...
---
SET var=val , ...
ON DUPLICATE KEY SET var=val , ...
---
( col_name , ... )
SELECT ...
ON DUPLICATE KEY SET var=val , ...