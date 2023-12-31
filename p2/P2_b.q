SELECT /*+ MAPJOIN(name_basics_external) */ *
FROM name_basics_external JOIN title_principals_external
ON (name_basics_external.nconst = title_principals_external.nconst);

set hive.auto.convert.sortmerge.join=true;
set hive.optimize.bucketmapjoin=true;
set hive.optimize.bucketmapjoin.sortedmerge=true;

SELECT /*+ MAPJOIN(name_basics_clustered) */ *
FROM name_basics_clustered JOIN title_principals_clustered
ON (name_basics_clustered.nconst = title_principals_clustered.nconst);