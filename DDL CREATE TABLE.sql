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

/* ================== */
/* create_definition: */
/* ================== */
col_name column_definition
[ CONSTRAINT [ symbol ] ] PRIMARY KEY [ index_type ] ( index_col_name , ... ) [ index_option ] ...
{ INDEX | KEY } [ index_name ] [ index_type ] ( index_col_name , ... ) [ index_option ] ...
[ CONSTRAINT [ sumbol ] ] UNIQUE [ INDEX | KEY ] [ index_name ] [ index_type ] ( index_col_name , ... ) [ index_option ] ...
{ FULLTEXT | SPATIAL } [ INDEX | KEY ] [ index_name ] ( index_col_name , ... ) [ index_option ] ...
[ CONSTRAINT [ symbol ] ] FOREIGN KEY [ index_name ] ( index_col_name , ... ) reference_definition /* unpartitoned InnoDB OR NDB + KEY + LINEAR KEY only */
CHECK( expr )

/* ================== */
/* column_definition: */
/* ================== */
data_type
[ NOT NULL | NULL ]
[ DEFAULT default_value ]
[ AUTO_INCREMENT ]
[ UNIQUE [ KEY ] | [ PRIMARY ] KEY ]
[ COMMENT 'string' ]
[ COLUMN_FORMAT { FIXED | DYNAMIC | DEFAULT } ] /* NDB silent ignore */
[ STORAGE { DISK | MEMORY | DEFAULT } ]         /* NDB only , syntax error */
[ reference_definition ]

/* ================== */
/* data_type: */
/* ================== */

/* ================== */
/* index_col_name: */
/* ================== */
col_name [ ( length ) ] [ ASC | DESC ]

/* ================== */
index_type:
/* ================== */
USING { BTREE | HASH }

index_option:
KEY_BLOCK_SIZE [=] value
index_type
WITH_PARSER parser_name
COMMENT 'string'

/* ================== */
reference_definition:
/* ================== */
REFERENCES tbl_name ( index_col_name , ... )
[ MATCH FULL | MATCH PARTIAL | MATCH SIMPLE ]
[ ON DELETE reference_option ]
[ ON UPDATE reference_option ]

/* ================== */
reference_option :
/* ================== */
RESTRICT | CASCADE | SET NULL | NO ACTION

/* ================== */
table_options :
/* ================== */
table_option , ...

/* ================== */
table_option:
/* ================== */
ENGINE [=] engine_name
AUTO_INCREMENT [=] value /* MyISAM , MEMORY , InnoDB , ARCHIVE */
AVG_ROW_LENGTH [=] value
[ DEFAULT ] CHARACTER SET [=] charset_name
CHECKSUM [=] { 0 | 1 } /* MyISAM */
[ DEFAULT ] COLLATE [=] collation_name
COMMENT [=] 'string' /* 2048 characters */
CONNECTION [=] 'connection_string' /* FEDERATED table SERVER */
DATA DIRECTORY [=] 'absolute path to directory' /* InnoDB , MyISAM */
DELAY_KEY_WRITE [=] { 0 | 1 } /* MyISAM */
INDEX DIRECTORY [=] 'absolute path to directory' /* InnoDB , MyISAM */
INSERT_METHOD [=] { NO | FIRST | LAST } /* MERGE */
KEY_BLOCK_SIZE [=] value /* hint : InnoDB : 0 , 1 , 2 , 4 , 8 , 16 */
MAX_ROWS [=] value /* hint : NDB : MAX 4294967295 */
MIN_ROWS [=] value /* MEMORY */
PACK_KEYS [=] { 0 | 1 | DEFAULT } /* MyISAM */
PASSWORD [=] 'string' /* NOT USED */
ROW_FORMAT [=] { DEFAULT | DYNAMIC | FIXED | COMPRESSED | REDUNDANT | COMPACT } /* storage_engine depeneden */
STATS_AUTO_RECALC [=] { DEFAULT | 0 | 1 } /* InnoDB Stats */
STATS_PERSISTENT [=] { DEFAULT | 0 | 1 } /* InnoDB Stats */
STATS_SAMPLE_PAGES [=] value
TABLESPACE tablespace_name [ STORAGE { DISK | MEMORY | DEFAULT } ] /* NDB Only */
UNION [=] ( tbl_name , ... ) /* only with MERGE tables */

/* ================== */
partition_options :
/* ================== */
PARTITION BY { 
	[ LINEAR ] HASH( expr )
	[ LINEAR ] KEY [ ALGORITHM = ( 1 | 2 ) ] ( column_list ) 
	RANGE{ ( expr ) | COLUMNS( column_list ) }
	LIST{ ( expr ) | COLUMNS( column_list ) }
	}
[ PARTITIONS num ]
[ SUBPARTITION BY  {
	[ LINEAR ] HASH ( expr )
	[ LINEAR ] KEY [ ALGORITHM = ( 1 | 2 ) ] ( column_list )
	}
	[ SUBPARTITIONS num ]
]
[ ( partition_definition , ... ) ]

/* ================== */
partition_definition:
/* ================== */
PARTITION partition_name
	[ VALUES {
		LESS THAN { ( expr | value_list ) }
		IN ( value_list )
		}
	]
	[ [ STORAGE ] ENGINE [=] engine_name ] /* NDB ? */
	[ COMMENT [=] 'comment_text' ]
	[ DATA DIRECTORY [=] 'data_dir' ]
	[ INDEX DIRECTORY [=] 'index_dir' ]
	[ MAX_ROWS [=] num ]
	[ MIN_ROWS [=] num ]
	[ TABLESPACE [=] tablespace_name ]
	[ NODEGROUP [=] node_group_id ]
	[ ( subpartition_definition , ... ) ]

/* ================== */
subpartition_definition:
/* ================== */
SUBPARTITION logical_name
	[ [ STORAGE ] ENGINE [=] engine_name ] /* NDB ? */
[ COMMENT [=] 'comment_text' ]
	[ DATA DIRECTORY [=] 'data_dir' ]
	[ INDEX DIRECTORY [=] 'index_dir' ]
	[ MAX_ROWS [=] num ]
	[ MIN_ROWS [=] num ]
	[ TABLESPACE [=] tablespace_name ]
	[ NODEGROUP [=] node_group_id ]

/* ================== */
select_statement:
/* ================== */
[ IGNORE | REPLACE ] [ AS ] SELECT ...

/* ================== */
storage_engine:
/* ================== */
InnoDB
MyISAM
MEMORY
CSV
ARCHIVE
EXAMPLE
FEDERATED
HEAP
MERGE
NDB
