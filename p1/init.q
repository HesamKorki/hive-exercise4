CREATE TABLE IF NOT EXISTS names (
    nid STRING,
    primaryName STRING,
    birthYear INT,
    deathYear INT,
    primaryProfession STRING,
    knownForTitles STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
LOCATION '/mnt/irisgpfs/users/hkorki/hive_tables/names';


LOAD DATA LOCAL INPATH '/mnt/irisgpfs/users/hkorki/names.tsv' INTO TABLE names;

CREATE TABLE IF NOT EXISTS titles (
    tid STRING,
    titleType STRING,
    primaryTitle STRING,
    originalTitle STRING,
    isAdult INT,
    startYear INT,
    endYear INT,
    runtimeMinutes INT,
    genres STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
LOCATION '/mnt/irisgpfs/users/hkorki/hive_tables/titles';


LOAD DATA LOCAL INPATH '/mnt/irisgpfs/users/hkorki/titles.tsv' INTO TABLE titles;


CREATE TABLE IF NOT EXISTS ratings (
    tid STRING,
    averageRating DOUBLE,
    numVotes INT
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
LOCATION '/mnt/irisgpfs/users/hkorki/hive_tables/ratings';


LOAD DATA LOCAL INPATH '/mnt/irisgpfs/users/hkorki/ratings.tsv' INTO TABLE ratings;

CREATE TABLE IF NOT EXISTS principals (
    tid STRING,
    ordering INT,
    nid STRING,
    category STRING,
    job STRING,
    characters STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
LOCATION '/mnt/irisgpfs/users/hkorki/hive_tables/principals';


LOAD DATA LOCAL INPATH '/mnt/irisgpfs/users/hkorki/principals.tsv' INTO TABLE principals;