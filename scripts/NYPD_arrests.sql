CREATE SCHEMA INSTANCE;

CREATE TABLE NYPDarrests_lgl.INSTANCE.dim_date ( 
	date_id int64 NOT NULL  
 );

ALTER TABLE NYPDarrests_lgl.INSTANCE.dim_date ADD PRIMARY KEY ( date_id )  NOT ENFORCED;

CREATE TABLE NYPDarrests_lgl.INSTANCE.dim_location ( 
	location_id int64 NOT NULL  ,
	arrest_boro TEXT  ,
	arrest_precinct int64  ,
	x_coord_cd int64  ,
	y_coord_cd int64  ,
	latitude int64  ,
	longitude int64  
 );

ALTER TABLE NYPDarrests_lgl.INSTANCE.dim_location ADD PRIMARY KEY ( location_id )  NOT ENFORCED;

CREATE TABLE NYPDarrests_lgl.INSTANCE.dim_offensetype ( 
	offenseType_id VARCHAR(50) NOT NULL  ,
	jurisdiction_code int64  ,
	law_code TEXT  
 );

ALTER TABLE NYPDarrests_lgl.INSTANCE.dim_offensetype ADD PRIMARY KEY ( offenseType_id )  NOT ENFORCED;

CREATE TABLE NYPDarrests_lgl.INSTANCE.dim_perp ( 
	arrest_id int64 NOT NULL  ,
	age_group TEXT  ,
	perp_sex TEXT  ,
	perp_race TEXT  
 );

ALTER TABLE NYPDarrests_lgl.INSTANCE.dim_perp ADD PRIMARY KEY ( arrest_id )  NOT ENFORCED;

CREATE TABLE NYPDarrests_lgl.INSTANCE.facts_arrests ( 
	facts_id BIGINT NOT NULL  ,
	number_arrests int64  ,
	arrest_id int64 NOT NULL  ,
	arrest_precinct int64 NOT NULL  ,
	offensetype_id int64 NOT NULL  ,
	mode_perpsex VARCHAR  ,
	mode_perprace VARCHAR  ,
	location_id int64 NOT NULL  ,
	date_id date NOT NULL  
 );

ALTER TABLE NYPDarrests_lgl.INSTANCE.facts_arrests ADD PRIMARY KEY ( facts_id, arrest_id, offensetype_id, location_id, date_id )  NOT ENFORCED;

ALTER TABLE NYPDarrests_lgl.INSTANCE.facts_arrests ADD CONSTRAINT fk_facts_arrests_dim_perp FOREIGN KEY ( arrest_id ) REFERENCES NYPDarrests_lgl.INSTANCE.dim_perp( arrest_id ) NOT ENFORCED;

ALTER TABLE NYPDarrests_lgl.INSTANCE.facts_arrests ADD CONSTRAINT fk_facts_arrests_dim_offensetype FOREIGN KEY ( offensetype_id ) REFERENCES NYPDarrests_lgl.INSTANCE.dim_offensetype( offenseType_id ) NOT ENFORCED;

ALTER TABLE NYPDarrests_lgl.INSTANCE.facts_arrests ADD CONSTRAINT fk_facts_arrests_dim_location FOREIGN KEY ( location_id ) REFERENCES NYPDarrests_lgl.INSTANCE.dim_location( location_id ) NOT ENFORCED;

ALTER TABLE NYPDarrests_lgl.INSTANCE.facts_arrests ADD CONSTRAINT fk_facts_arrests_dim_date FOREIGN KEY ( date_id ) REFERENCES NYPDarrests_lgl.INSTANCE.dim_date( date_id ) NOT ENFORCED;
