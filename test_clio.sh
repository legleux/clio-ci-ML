#!/usr/bin/env bash
pg_ctlcluster 12 main start
su postgres -c"psql -c\"alter user postgres with password 'postgres'\""
su cassandra -c "/opt/cassandra/bin/cassandra -R"
cd ./clio_src/build && ./clio_tests
