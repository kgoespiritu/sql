SELECT
ALL | DISTINCT | DISTINCTROW
HIGH_PRIORITY
STRAIGHT_JOIN
SQL_SMALL_RESULT
SQL_BIG_RESULT
SQL_BUFFER_RESULT
SQL_CACHE | SQL_NO_CACHE
SQL_COUNT_FOUND_ROWS
select_expr [, ...]
FROM table_references
PARTITION( partition_list [ , ... ] )
WHERE where_condition
GROUP BY group_by_expr [ ASC | DESC ]
HAVING having_condition
ORDER BY { { col | expr | col_id } [ ASC | DESC ] } [ , ... ]
LIMIT { count [ OFFSET offset ] } | { offset , count }
PROCEDURE ...
INTO ...
FOR UPDATE | LOCK IN SHARE MODE
