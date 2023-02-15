# sql-queries-atlassian
In this repository are stored some useful queries to obtain reports

## Data base access
```sh
psql -h <HOST> -U <USER> <DB>
```
## Command to create file with answer
without the semicolon(;) at the end
```sh
\copy (<QUERY>) to '<PATH>/<FILE>.csv' csv header;
```