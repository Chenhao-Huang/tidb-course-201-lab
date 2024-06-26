#!/bin/bash

# Fast forward E1
./ff1.sh
source .bash_profile
source ./hosts-env.sh

mysql -h${HOST_DB1_PRIVATE_IP} -P4000 -uroot << EOF
USE test;
CREATE TABLE t1 (a INT PRIMARY KEY AUTO_INCREMENT);
SHOW SESSION VARIABLES LIKE 'auto_increment_increment';
INSERT INTO t1 VALUES ();
INSERT INTO t1 VALUES ();
SELECT * FROM t1;
SET auto_increment_increment = 10;
INSERT INTO t1 VALUES ();
INSERT INTO t1 VALUES ();
SELECT * FROM t1;
EOF

mysql -h${HOST_DB1_PRIVATE_IP} -P4000 -uroot << EOF
USE test;
SHOW VARIABLES LIKE 'auto_increment_increment';
USE test;
INSERT INTO t1 VALUES ();
INSERT INTO t1 VALUES ();
SELECT * FROM t1;
EOF

mysql -h${HOST_DB1_PRIVATE_IP} -P4000 -uroot << EOF
USE test;
SHOW SESSION VARIABLES LIKE 'auto_increment_increment';
INSERT INTO t1 VALUES ();
INSERT INTO t1 VALUES ();
SELECT * FROM t1;
SET GLOBAL auto_increment_increment=10;
SHOW SESSION VARIABLES LIKE 'auto_increment_increment';
EOF

mysql -h${HOST_DB1_PRIVATE_IP} -P4000 -uroot << EOF
USE test;
SHOW VARIABLES LIKE 'auto_increment_increment';
INSERT INTO t1 VALUES ();
INSERT INTO t1 VALUES ();
SELECT * FROM t1;
EOF

mysql -h${HOST_DB1_PRIVATE_IP} -P4000 -uroot << EOF
SHOW VARIABLES LIKE 'auto_increment_increment';
EOF

tiup cluster stop tidb-test --yes
tiup cluster start tidb-test

mysql -h${HOST_DB1_PRIVATE_IP} -P4000 -uroot << EOF
SHOW VARIABLES LIKE 'auto_increment_increment';
EOF

