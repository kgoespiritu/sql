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
