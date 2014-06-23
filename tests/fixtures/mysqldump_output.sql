-- MySQL dump 10.13  Distrib 5.6.16, for osx10.6 (x86_64)
--
-- Host: localhost    Database: transition_development
-- ------------------------------------------------------
-- Server version	5.6.16
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO,POSTGRESQL' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table "hits"
--

DROP TABLE IF EXISTS "hits";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "hits" (
  "id" int(11) NOT NULL,
  "host_id" int(11) NOT NULL,
  "path" varchar(1024) COLLATE utf8_bin NOT NULL,
  "path_hash" varchar(40) COLLATE utf8_bin NOT NULL,
  "http_status" varchar(3) COLLATE utf8_bin NOT NULL,
  "count" int(11) NOT NULL,
  "hit_on" date NOT NULL,
  "mapping_id" int(11) DEFAULT NULL,
  PRIMARY KEY ("id"),
  UNIQUE KEY "index_hits_on_host_id_and_path_hash_and_hit_on_and_http_status" ("host_id","path_hash","hit_on","http_status"),
  KEY "index_hits_on_host_id" ("host_id"),
  KEY "index_hits_on_host_id_and_hit_on" ("host_id","hit_on"),
  KEY "index_hits_on_host_id_and_http_status" ("host_id","http_status"),
  KEY "index_hits_on_mapping_id" ("mapping_id"),
  KEY "index_hits_on_path_hash" ("path_hash"),
  KEY "index_hits_on_host_id_and_path_hash" ("host_id","path_hash")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "hits"
--

LOCK TABLES "hits" WRITE;
/*!40000 ALTER TABLE "hits" DISABLE KEYS */;
/*!40000 ALTER TABLE "hits" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table "sites"
--

DROP TABLE IF EXISTS "sites";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "sites" (
  "id" int(11) NOT NULL,
  "organisation_id" int(11) NOT NULL,
  "abbr" varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  "query_params" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  "tna_timestamp" datetime NOT NULL,
  "homepage" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  "created_at" datetime NOT NULL,
  "updated_at" datetime NOT NULL,
  "global_http_status" varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  "global_new_url" text COLLATE utf8_unicode_ci,
  "managed_by_transition" tinyint(1) NOT NULL DEFAULT '1',
  "launch_date" date DEFAULT NULL,
  "special_redirect_strategy" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  "global_redirect_append_path" tinyint(1) NOT NULL DEFAULT '0',
  "global_type" varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY ("id"),
  UNIQUE KEY "index_sites_on_site" ("abbr"),
  KEY "index_sites_on_organisation_id" ("organisation_id")
);
/*!40101 SET character_set_client = @saved_cs_client */;
