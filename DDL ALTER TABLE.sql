ALTER
[ ONLINE | OFFLINE ] /* cluster */
[ IGNORE ]
TABLE
tbl_name
[ alter_specification , ... ]
[ partition_options ]

alter_specifications:
table_options
ADD [ COLUMN ] col_name column_definition [ FIRST | AFTER col_name ]
ADD [ COLUMN ] (col_name column_definition , ... )
ADD { INDEX | KEY } [ index_name ] [ index_type ] ( index_col_name , .. ) [ index_option ] ...
ADD [ CONSTRAINT [ symbol ] ] PRIMARY KEY [ index_type ] ( index_col_name , .. ) [ index_option ] ...
ADD [ CONSTRAINT [ symbol ] ] UNIQUE [ INDEX | KEY ] [ index_name ][ index_type ] ( index_col_name , .. ) [ index_option ] ...
ADD FULLTEXT [ INDEX | KEY ] [ index_name ] ( index_col_name , .. ) [ index_option ] ...
ADD SPATIAL [ INDEX | KEY ] [ index_name ] ( index_col_name , .. ) [ index_option ] ...
ADD [ CONSTRAINT [ symbol ] ] FOREIGN KEY [ index_name ] ( index_col_name , .. ) reference_definition /* nonpartition innodb OR ndb */
ALGORITHM [=] { DEFAULT | INPLACE | COPY } /* cluster */
ALTER [ COLUMN ] col_name { SET DEFAULT literal | DROP DEFAULT }
CHANGE [ COLUMN ] old_col_name new_col_name column_definition [ FIRST | AFTER col_name ]
LOCK [=] { DEFAULT | NONE | SHARED | EXCLUSIVE}
MODIFY [ COLUMN ] col_name column_definition [ FIRST | AFTER col_name ]
DROP [ COLUMN ] col_name
DROP PRIMARY KEY
DROP { INDEX | KEY } index_name
DROP FOREIGN KEY fk_symbol
DISABLE KEYS
ENABLE KEYS
RENAME [ TO | AS ] new_tbl_name
ORDER BY col_name , ...
CONVET TO CHARACTER SET charset_name [ COLLATE collation_name ]
[ DEFAULT ] CHARACTER SET [=] charset_name [ COLLATE [=] collation_name ]
DISCARD TABLESPACE
IMPORT TABLESPACE
FORCE
ADD PARTITION ( partition_definition )
DROP PARTITION partition_names
TRUNCATE PARTITION { partition_names | ALL }
COALESCE PARTITION number
REORGANIZE PARTITION partition_names INTO (partition_definitions)
ECHANGE PARTITION partition_name WITH TABLE tbl_name
ANALYZE PARTITION { partition_names | ALL }
CHECK PARTITION { partition_names | ALL }
OPTIMIZE PARTITION { partition_names | ALL }
REBUILD PARTITION { partition_names | ALL }
REPAIR PARTITION { partition_names | ALL }
REMOVE PARTITIONING

index_col_name : col_name [ ( length ) ] [ ASC | DESC ]
index_type : USING { BTREE | HASH }

index_option :
KEY_BLOCK_SIZE [=] value
index_type
WITH PARSER parser_name
COMMENT 'string'

table_options:
table_option

partition_options:
partition_option