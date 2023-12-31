-- Create external tables from TSV files
CREATE EXTERNAL TABLE IF NOT EXISTS name_basics_external (
    nconst STRING,
    primaryName STRING,
    birthYear INT,
    deathYear INT,
    primaryProfession STRING,
    knownForTitles STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
LOCATION '/mnt/irisgpfs/users/hkorki/hive_tables/names_external';

LOAD DATA LOCAL INPATH '/mnt/irisgpfs/users/hkorki/names.tsv' INTO TABLE name_basics_external;

CREATE EXTERNAL TABLE IF NOT EXISTS title_principals_external (
    tconst STRING,
    ordering INT,
    nconst STRING,
    category STRING,
    job STRING,
    characters STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
LOCATION '/mnt/irisgpfs/users/hkorki/hive_tables/principals_external';

LOAD DATA LOCAL INPATH '/mnt/irisgpfs/users/hkorki/principals.tsv' INTO TABLE title_principals_external;

-- Create clustered tables
CREATE TABLE IF NOT EXISTS name_basics_clustered (
    nconst STRING,
    primaryName STRING,
    birthYear INT,
    deathYear INT,
    primaryProfession STRING,
    knownForTitles STRING
)
CLUSTERED BY (nconst) SORTED BY (nconst ASC) INTO 8 BUCKETS
LOCATION '/mnt/irisgpfs/users/hkorki/hive_tables/names_clustered';


CREATE TABLE IF NOT EXISTS title_principals_clustered (
    tconst STRING,
    ordering INT,
    nconst STRING,
    category STRING,
    job STRING,
    characters STRING
)
CLUSTERED BY (nconst) SORTED BY (nconst ASC) INTO 8 BUCKETS
LOCATION '/mnt/irisgpfs/users/hkorki/hive_tables/principals_clustered';

-- Insert data into clustered tables
INSERT OVERWRITE TABLE name_basics_clustered
SELECT * FROM name_basics_external;

INSERT OVERWRITE TABLE title_principals_clustered
SELECT * FROM title_principals_external;

-- Describe the clustered tables
DESCRIBE EXTENDED name_basics_clustered;
DESCRIBE EXTENDED title_principals_clustered;
