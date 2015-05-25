CREATE
[ TEMPORARY ]
TABLE
[ IF NOT EXISTS ]
tbl_name
=======================
( create_definition , ... )
[ table_options ]
[ partition_options ]
=======================
[ ( create_definition  , ...) ]
[ table_options ]
[ partition_options ]
select_statement
=======================
{ LIKE old_tbl_name | ( LIKE old_tbl_name )}



create_definition:
col_name column_definition
[ CONSTRAINT [ symbol ] ] PRIMARY KEY [ index_type ] ( index_col_name , ... ) [ index_option ] ...
{ INDEX | KEY } [ index_name ] [ index_type ] ( index_col_name , ... ) [ index_option ] ...
[ CONSTRAINT [ sumbol ] ] UNIQUE [ INDEX | KEY ] [ index_name ] [ index_type ] ( index_col_name , ... ) [ index_option ] ...
{ FULLTEXT | SPATIAL } [ INDEX | KEY ] [ index_name ] ( index_col_name , ... ) [ index_option ] ...
[ CONSTRAINT [ symbol ] ] FOREIGN KEY [ index_name ] ( index_col_name , ... ) reference_definition
CHECK( expr )


column_definition:
data_type [ NOT NULL | NULL ] [ DEFAULT default_value ] [ AUTO_INCREMENT ] [ UNIQUE [ KEY ] | [ PRIMARY ] KEY ] [ COMMENT 'string' ]
[ COLUMN_FORMAT { FIXED | DYNAMIC | DEFAULT } ]
[ STORAGE { DISK | MEMORY | DEFAULT } ]
[ reference_definition ]

index_col_name:
col_name [ ( length ) ] [ ASC | DESC ]

index_type:
USING { BTREE | HASH }

index_option:
KEY_BLOCK_SIZE [=] value
index_type
WITH_PARSER parser_name
COMMENT 'string'

reference_definition:
REFERENCES tbl_name ( index_col_name , ... ) [ MATCH FULL | MATCH PARTIAL | MATCH SIMPLE ] [ ON DELETE reference_option ] [ ON UPDATE reference_option ]

reference_option :
RESTRICT | CASCADE | SET NULL | NO ACTION

table_options :
table_option , ...

table_option:
ENGINE [=] engine_name
AUTO_INCREMENT [=] value
AVG_ROW_LENGTH [=] value
[ DEFAULT ] CHARACTER SET [=] charset_name
CHECKSUM [=] { 0 | 1 }
[ DEFAULT ] COLLATE [=] collation_name
COMMENT [=] 'string'
CONNECTION [=] 'connection_string'
DATA DIRECTORY [=] 'absolute path to directory'
DELAY_KEY_WRITE [=] { 0 | 1 }
INDEX DIRECTORY [=] 'absolute path to directory'
INSERT_METHOD [=] { NO | FIRST | LAST }
KEY_BLOCK_SIZE [=] value
MAX_ROWS [=] value
MIN_ROWS [=] value
PACK_KEYS [=] { 0 | 1 | DEFAULT }
PASSWORD [=] 'string'
ROW_FORMAT [=] { DEFAULT | DYNAMIC | FIXED | COMPRESSED | REDUNDANT | COMPACT }
STATS_AUTO_RECALC [=] { DEFAULT | 0 | 1 }
STATS_PERSISTENT [=] { DEFAULT | 0 | 1 }
STATS_SAMPLE_PAGES [=] value
TABLESPACE tablespace_name [ STORAGE { DISK | MEMORY | DEFAULT } ]
UNION [=] ( tbl_name , ... )

