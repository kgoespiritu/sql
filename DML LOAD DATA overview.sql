LOAD DATA
[ LOW_PRIORITY | CONCURRENT ]
[ LOCAL ]
INFILE 'file_name'
[ REPLACE | IGNORE ]
INTO 'table_name'
[ PARTITION( ... ) ]
[ CHARACTER SET charset_name ]
---
[ { FIELDS | COLUMNS }
   [ TERMINATED BY 'str' ]
   [ [ OPTIONALLY ] ENCLOSED BY 'str' ]
   [ ESCAPED BY 'str' ]
]
[ LINES 
   [ STARTED BY 'str' ]
   [ TERMINATED BY 'str' ]
]
---
[ ROWS IDENTIFIED BY '<tag>' ]
---
[ IGNORE num { ROWS | LINES } ]
[ ( col_name , ... ) ]
[ SET var=val , ... ]