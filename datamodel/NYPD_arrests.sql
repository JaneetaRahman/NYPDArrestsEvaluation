CREATE SCHEMA INSTANCE;

CREATE TABLE dim_date ( 
	date_id              INT  NOT NULL  ,
	arrest_date          DATE    ,
	CONSTRAINT pk_dim_date PRIMARY KEY ( date_id )
 );

CREATE TABLE dim_location ( 
	location_id          INT  NOT NULL  ,
	arrest_boro          TEXT    ,
	arrest_precinct      INT    ,
	x_coord_cd           INT    ,
	y_coord_cd           INT    ,
	latitude             INT    ,
	longitude            INT    ,
	CONSTRAINT pk_dim_location PRIMARY KEY ( location_id )
 );

CREATE TABLE dim_offensetype ( 
	offenseType_id       VARCHAR(50)  NOT NULL  ,
	jurisdiction_code    INT    ,
	law_code             TEXT    ,
	levelofoffense       TEXT    ,
	CONSTRAINT pk_dim_offensetype PRIMARY KEY ( offenseType_id )
 );

CREATE TABLE dim_perp ( 
	arrest_id            INT  NOT NULL  ,
	age_group            TEXT    ,
	perp_sex             TEXT    ,
	perp_race            TEXT    ,
	CONSTRAINT pk_dim_perp PRIMARY KEY ( arrest_id )
 );

CREATE TABLE facts_arrests ( 
	facts_id             BIGINT  NOT NULL  ,
	number_arrests       INT    ,
	arrest_id            INT  NOT NULL  ,
	precinctLocationID   INT  NOT NULL  ,
	arrestcountLocationID INT  NOT NULL  ,
	offensetype_id       INT  NOT NULL  ,
	perps_sex_avg        INT    ,
	perps_race_avg       INT    ,
	count                INT  NOT NULL  ,
	CONSTRAINT pk_facts_Arrests PRIMARY KEY ( facts_id )
 );
