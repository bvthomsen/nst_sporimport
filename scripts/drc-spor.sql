SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

--
-- Definition for schema gnssdata : 
--

CREATE SCHEMA gnssdata
  AUTHORIZATION [dbo]
GO

--
-- Definition for schema mapinfo : 
--

CREATE SCHEMA mapinfo
  AUTHORIZATION [dbo]
GO

--
-- Definition for schema transit : 
--

CREATE SCHEMA transit
  AUTHORIZATION [dbo]
GO

--
-- Definition for sequence object_number : 
--

CREATE SEQUENCE gnssdata.object_number
  AS int
  START WITH 100244
  INCREMENT BY 1
  MINVALUE -2147483648
  MAXVALUE 2147483647
  NO CYCLE
  CACHE
GO

--
-- Definition for table geometry_columns : 
--

CREATE TABLE dbo.geometry_columns (
  f_table_catalog varchar(128) COLLATE Danish_Norwegian_CI_AS NOT NULL,
  f_table_schema varchar(128) COLLATE Danish_Norwegian_CI_AS NOT NULL,
  f_table_name varchar(256) COLLATE Danish_Norwegian_CI_AS NOT NULL,
  f_geometry_column varchar(256) COLLATE Danish_Norwegian_CI_AS NOT NULL,
  coord_dimension int NOT NULL,
  srid int NOT NULL,
  geometry_type varchar(30) COLLATE Danish_Norwegian_CI_AS NOT NULL,
  CONSTRAINT geometry_columns_pk_geometry_columns PRIMARY KEY CLUSTERED (f_table_catalog, f_table_schema, f_table_name, f_geometry_column)
    WITH (
      PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF,
      ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
ON [PRIMARY]
GO

--
-- Definition for table spatial_ref_sys : 
--

CREATE TABLE dbo.spatial_ref_sys (
  srid int NOT NULL,
  auth_name varchar(256) COLLATE Danish_Norwegian_CI_AS NULL,
  auth_srid int NULL,
  srtext varchar(2048) COLLATE Danish_Norwegian_CI_AS NULL,
  proj4text varchar(2048) COLLATE Danish_Norwegian_CI_AS NULL,
  PRIMARY KEY CLUSTERED (srid)
    WITH (
      PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF,
      ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
ON [PRIMARY]
GO

--
-- Definition for table gnss_flader : 
--

CREATE TABLE gnssdata.gnss_flader (
  mi_prinx int DEFAULT NEXT VALUE FOR [gnssdata].[object_number] NOT NULL,
  typenavn nvarchar(80) COLLATE Danish_Norwegian_CI_AS DEFAULT '-' NOT NULL,
  kategori nvarchar(80) COLLATE Danish_Norwegian_CI_AS DEFAULT '-' NOT NULL,
  registrering nvarchar(80) COLLATE Danish_Norwegian_CI_AS DEFAULT '-' NOT NULL,
  kommentar nvarchar(80) COLLATE Danish_Norwegian_CI_AS NULL,
  gnss_oprettet datetime2(7) NULL,
  gnss_ini nvarchar(20) COLLATE Danish_Norwegian_CI_AS NULL,
  gnss_pdop float NULL,
  gnss_filepath nvarchar(255) COLLATE Danish_Norwegian_CI_AS NULL,
  gnss_unit nvarchar(80) COLLATE Danish_Norwegian_CI_AS NULL,
  db_oprettet datetime2(7) NULL,
  db_ini nvarchar(20) COLLATE Danish_Norwegian_CI_AS NULL,
  mi_style nvarchar(255) COLLATE Danish_Norwegian_CI_AS DEFAULT 'PEN(1,2,0) BRUSH(5,0,-1)' NOT NULL,
  sp_geometry geometry NULL,
  gnss_id int DEFAULT -1 NOT NULL,
  CONSTRAINT gnss_flader_pkey PRIMARY KEY CLUSTERED (mi_prinx)
    WITH (
      PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF,
      ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON),
  CONSTRAINT gnss_flader_chk CHECK ([sp_geometry].[STSrid]=(25832) AND [sp_geometry].[STGeometryType]()='MultiPolygon')
)
ON [PRIMARY]
GO

--
-- Definition for table gnss_flader_duplikater : 
--

CREATE TABLE gnssdata.gnss_flader_duplikater (
  mi_prinx int DEFAULT NEXT VALUE FOR [gnssdata].[object_number] NOT NULL,
  typenavn nvarchar(80) COLLATE Danish_Norwegian_CI_AS DEFAULT '-' NOT NULL,
  kategori nvarchar(80) COLLATE Danish_Norwegian_CI_AS DEFAULT '-' NOT NULL,
  registrering nvarchar(80) COLLATE Danish_Norwegian_CI_AS DEFAULT '-' NOT NULL,
  kommentar nvarchar(80) COLLATE Danish_Norwegian_CI_AS NULL,
  gnss_oprettet datetime2(7) NULL,
  gnss_ini nvarchar(20) COLLATE Danish_Norwegian_CI_AS NULL,
  gnss_pdop float NULL,
  gnss_filepath nvarchar(255) COLLATE Danish_Norwegian_CI_AS NULL,
  gnss_unit nvarchar(80) COLLATE Danish_Norwegian_CI_AS NULL,
  db_oprettet datetime2(7) NULL,
  db_ini nvarchar(20) COLLATE Danish_Norwegian_CI_AS NULL,
  mi_style nvarchar(255) COLLATE Danish_Norwegian_CI_AS DEFAULT 'PEN(1,2,0) BRUSH(5,0,-1)' NOT NULL,
  sp_geometry geometry NULL,
  gnss_id int DEFAULT -1 NOT NULL,
  CONSTRAINT gnss_flader_duplikater_pkey PRIMARY KEY CLUSTERED (mi_prinx)
    WITH (
      PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF,
      ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON),
  CONSTRAINT gnss_flader_duplikater_chk CHECK ([sp_geometry].[STSrid]=(25832) AND [sp_geometry].[STGeometryType]()='MultiPolygon')
)
ON [PRIMARY]
GO

--
-- Definition for table gnss_linjer : 
--

CREATE TABLE gnssdata.gnss_linjer (
  mi_prinx int DEFAULT NEXT VALUE FOR [gnssdata].[object_number] NOT NULL,
  typenavn nvarchar(80) COLLATE Danish_Norwegian_CI_AS DEFAULT '-' NOT NULL,
  kategori nvarchar(80) COLLATE Danish_Norwegian_CI_AS DEFAULT '-' NOT NULL,
  registrering nvarchar(80) COLLATE Danish_Norwegian_CI_AS DEFAULT '-' NOT NULL,
  kommentar nvarchar(80) COLLATE Danish_Norwegian_CI_AS NULL,
  gnss_oprettet datetime2(7) NULL,
  gnss_ini nvarchar(20) COLLATE Danish_Norwegian_CI_AS NULL,
  gnss_pdop float NULL,
  gnss_filepath nvarchar(255) COLLATE Danish_Norwegian_CI_AS NULL,
  gnss_unit nvarchar(80) COLLATE Danish_Norwegian_CI_AS NULL,
  db_oprettet datetime2(7) NULL,
  db_ini nvarchar(20) COLLATE Danish_Norwegian_CI_AS NULL,
  mi_style nvarchar(255) COLLATE Danish_Norwegian_CI_AS DEFAULT 'PEN(1,2,0)' NOT NULL,
  sp_geometry geometry NULL,
  gnss_id int DEFAULT -1 NOT NULL,
  CONSTRAINT gnss_linjer_pkey PRIMARY KEY CLUSTERED (mi_prinx)
    WITH (
      PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF,
      ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON),
  CONSTRAINT gnss_linjer_chk CHECK ([sp_geometry].[STSrid]=(25832) AND [sp_geometry].[STGeometryType]()='MultiLineString')
)
ON [PRIMARY]
GO

--
-- Definition for table gnss_linjer_duplikater : 
--

CREATE TABLE gnssdata.gnss_linjer_duplikater (
  mi_prinx int DEFAULT NEXT VALUE FOR [gnssdata].[object_number] NOT NULL,
  typenavn nvarchar(80) COLLATE Danish_Norwegian_CI_AS DEFAULT '-' NOT NULL,
  kategori nvarchar(80) COLLATE Danish_Norwegian_CI_AS DEFAULT '-' NOT NULL,
  registrering nvarchar(80) COLLATE Danish_Norwegian_CI_AS DEFAULT '-' NOT NULL,
  kommentar nvarchar(80) COLLATE Danish_Norwegian_CI_AS NULL,
  gnss_oprettet datetime2(7) NULL,
  gnss_ini nvarchar(20) COLLATE Danish_Norwegian_CI_AS NULL,
  gnss_pdop float NULL,
  gnss_filepath nvarchar(255) COLLATE Danish_Norwegian_CI_AS NULL,
  gnss_unit nvarchar(80) COLLATE Danish_Norwegian_CI_AS NULL,
  db_oprettet datetime2(7) NULL,
  db_ini nvarchar(20) COLLATE Danish_Norwegian_CI_AS NULL,
  mi_style nvarchar(255) COLLATE Danish_Norwegian_CI_AS DEFAULT 'PEN(1,2,0)' NOT NULL,
  sp_geometry geometry NULL,
  gnss_id int DEFAULT -1 NOT NULL,
  CONSTRAINT gnss_linjer_duplikater_pkey PRIMARY KEY CLUSTERED (mi_prinx)
    WITH (
      PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF,
      ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON),
  CONSTRAINT gnss_linjer_duplikater_chk CHECK ([sp_geometry].[STSrid]=(25832) AND [sp_geometry].[STGeometryType]()='MultiLineString')
)
ON [PRIMARY]
GO

--
-- Definition for table gnss_punkter : 
--

CREATE TABLE gnssdata.gnss_punkter (
  mi_prinx int DEFAULT NEXT VALUE FOR [gnssdata].[object_number] NOT NULL,
  typenavn nvarchar(80) COLLATE Danish_Norwegian_CI_AS DEFAULT '-' NOT NULL,
  kategori nvarchar(80) COLLATE Danish_Norwegian_CI_AS DEFAULT '-' NOT NULL,
  registrering nvarchar(80) COLLATE Danish_Norwegian_CI_AS DEFAULT '-' NOT NULL,
  kommentar nvarchar(80) COLLATE Danish_Norwegian_CI_AS NULL,
  gnss_oprettet datetime2(7) NULL,
  gnss_ini nvarchar(20) COLLATE Danish_Norwegian_CI_AS NULL,
  gnss_pdop float NULL,
  gnss_filepath nvarchar(255) COLLATE Danish_Norwegian_CI_AS NULL,
  gnss_unit nvarchar(80) COLLATE Danish_Norwegian_CI_AS NULL,
  db_oprettet datetime2(7) NULL,
  db_ini nvarchar(20) COLLATE Danish_Norwegian_CI_AS NULL,
  mi_style nvarchar(255) COLLATE Danish_Norwegian_CI_AS DEFAULT 'SYMBOL(40,0,12)' NOT NULL,
  sp_geometry geometry NULL,
  gnss_id int DEFAULT -1 NOT NULL,
  CONSTRAINT gnss_punkter_pkey PRIMARY KEY CLUSTERED (mi_prinx)
    WITH (
      PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF,
      ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON),
  CONSTRAINT gnss_punkter_chk CHECK ([sp_geometry].[STSrid]=(25832) AND [sp_geometry].[STGeometryType]()='Point')
)
ON [PRIMARY]
GO

--
-- Definition for table gnss_punkter_duplikater : 
--

CREATE TABLE gnssdata.gnss_punkter_duplikater (
  mi_prinx int DEFAULT NEXT VALUE FOR [gnssdata].[object_number] NOT NULL,
  typenavn nvarchar(80) COLLATE Danish_Norwegian_CI_AS DEFAULT '-' NOT NULL,
  kategori nvarchar(80) COLLATE Danish_Norwegian_CI_AS DEFAULT '-' NOT NULL,
  registrering nvarchar(80) COLLATE Danish_Norwegian_CI_AS DEFAULT '-' NOT NULL,
  kommentar nvarchar(80) COLLATE Danish_Norwegian_CI_AS NULL,
  gnss_oprettet datetime2(7) NULL,
  gnss_ini nvarchar(20) COLLATE Danish_Norwegian_CI_AS NULL,
  gnss_pdop float NULL,
  gnss_filepath nvarchar(255) COLLATE Danish_Norwegian_CI_AS NULL,
  gnss_unit nvarchar(80) COLLATE Danish_Norwegian_CI_AS NULL,
  db_oprettet datetime2(7) NULL,
  db_ini nvarchar(20) COLLATE Danish_Norwegian_CI_AS NULL,
  mi_style nvarchar(255) COLLATE Danish_Norwegian_CI_AS DEFAULT 'SYMBOL(40,0,12)' NOT NULL,
  sp_geometry geometry NULL,
  gnss_id int DEFAULT -1 NOT NULL,
  CONSTRAINT gnss_punkter_duplikater_pkey PRIMARY KEY CLUSTERED (mi_prinx)
    WITH (
      PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF,
      ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON),
  CONSTRAINT gnss_punkter_duplikater_chk CHECK ([sp_geometry].[STSrid]=(25832) AND [sp_geometry].[STGeometryType]()='Point')
)
ON [PRIMARY]
GO

--
-- Definition for table gnss_styles : 
--

CREATE TABLE gnssdata.gnss_styles (
  typenavn nvarchar(80) COLLATE Danish_Norwegian_CI_AS NOT NULL,
  kategori nvarchar(80) COLLATE Danish_Norwegian_CI_AS NOT NULL,
  registrering nvarchar(80) COLLATE Danish_Norwegian_CI_AS NOT NULL,
  mi_style nvarchar(255) COLLATE Danish_Norwegian_CI_AS NOT NULL,
  CONSTRAINT gnss_styles_pkey PRIMARY KEY CLUSTERED (typenavn, kategori, registrering)
    WITH (
      PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF,
      ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
ON [PRIMARY]
GO

--
-- Definition for table test_flader : 
--

CREATE TABLE gnssdata.test_flader (
  mi_prinx int DEFAULT NEXT VALUE FOR [gnssdata].[object_number] NOT NULL,
  typenavn nvarchar(80) COLLATE Danish_Norwegian_CI_AS DEFAULT '-' NOT NULL,
  kategori nvarchar(80) COLLATE Danish_Norwegian_CI_AS DEFAULT '-' NOT NULL,
  registrering nvarchar(80) COLLATE Danish_Norwegian_CI_AS DEFAULT '-' NOT NULL,
  kommentar nvarchar(80) COLLATE Danish_Norwegian_CI_AS NULL,
  gnss_oprettet datetime2(7) NULL,
  gnss_ini nvarchar(20) COLLATE Danish_Norwegian_CI_AS NULL,
  gnss_pdop float NULL,
  gnss_filepath nvarchar(255) COLLATE Danish_Norwegian_CI_AS NULL,
  gnss_unit nvarchar(80) COLLATE Danish_Norwegian_CI_AS NULL,
  db_oprettet datetime2(7) NULL,
  db_ini nvarchar(20) COLLATE Danish_Norwegian_CI_AS NULL,
  mi_style nvarchar(255) COLLATE Danish_Norwegian_CI_AS DEFAULT 'PEN(1,2,0) BRUSH(5,0,-1)' NOT NULL,
  sp_geometry geometry NULL,
  gnss_id int DEFAULT -1 NOT NULL,
  CONSTRAINT test_flader_pkey PRIMARY KEY CLUSTERED (mi_prinx)
    WITH (
      PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF,
      ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON),
  CONSTRAINT test_flader_chk CHECK ([sp_geometry].[STSrid]=(25832) AND [sp_geometry].[STGeometryType]()='MultiPolygon')
)
ON [PRIMARY]
GO

--
-- Definition for table test_flader_duplikater : 
--

CREATE TABLE gnssdata.test_flader_duplikater (
  mi_prinx int DEFAULT NEXT VALUE FOR [gnssdata].[object_number] NOT NULL,
  typenavn nvarchar(80) COLLATE Danish_Norwegian_CI_AS DEFAULT '-' NOT NULL,
  kategori nvarchar(80) COLLATE Danish_Norwegian_CI_AS DEFAULT '-' NOT NULL,
  registrering nvarchar(80) COLLATE Danish_Norwegian_CI_AS DEFAULT '-' NOT NULL,
  kommentar nvarchar(80) COLLATE Danish_Norwegian_CI_AS NULL,
  gnss_oprettet datetime2(7) NULL,
  gnss_ini nvarchar(20) COLLATE Danish_Norwegian_CI_AS NULL,
  gnss_pdop float NULL,
  gnss_filepath nvarchar(255) COLLATE Danish_Norwegian_CI_AS NULL,
  gnss_unit nvarchar(80) COLLATE Danish_Norwegian_CI_AS NULL,
  db_oprettet datetime2(7) NULL,
  db_ini nvarchar(20) COLLATE Danish_Norwegian_CI_AS NULL,
  mi_style nvarchar(255) COLLATE Danish_Norwegian_CI_AS DEFAULT 'PEN(1,2,0) BRUSH(5,0,-1)' NOT NULL,
  sp_geometry geometry NULL,
  gnss_id int DEFAULT -1 NOT NULL,
  CONSTRAINT test_flader_duplikater_pkey PRIMARY KEY CLUSTERED (mi_prinx)
    WITH (
      PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF,
      ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON),
  CONSTRAINT test_flader_duplikater_chk CHECK ([sp_geometry].[STSrid]=(25832) AND [sp_geometry].[STGeometryType]()='MultiPolygon')
)
ON [PRIMARY]
GO

--
-- Definition for table test_linjer : 
--

CREATE TABLE gnssdata.test_linjer (
  mi_prinx int DEFAULT NEXT VALUE FOR [gnssdata].[object_number] NOT NULL,
  typenavn nvarchar(80) COLLATE Danish_Norwegian_CI_AS DEFAULT '-' NOT NULL,
  kategori nvarchar(80) COLLATE Danish_Norwegian_CI_AS DEFAULT '-' NOT NULL,
  registrering nvarchar(80) COLLATE Danish_Norwegian_CI_AS DEFAULT '-' NOT NULL,
  kommentar nvarchar(80) COLLATE Danish_Norwegian_CI_AS NULL,
  gnss_oprettet datetime2(7) NULL,
  gnss_ini nvarchar(20) COLLATE Danish_Norwegian_CI_AS NULL,
  gnss_pdop float NULL,
  gnss_filepath nvarchar(255) COLLATE Danish_Norwegian_CI_AS NULL,
  gnss_unit nvarchar(80) COLLATE Danish_Norwegian_CI_AS NULL,
  db_oprettet datetime2(7) NULL,
  db_ini nvarchar(20) COLLATE Danish_Norwegian_CI_AS NULL,
  mi_style nvarchar(255) COLLATE Danish_Norwegian_CI_AS DEFAULT 'PEN(1,2,0)' NOT NULL,
  sp_geometry geometry NULL,
  gnss_id int DEFAULT -1 NOT NULL,
  CONSTRAINT test_linjer_pkey PRIMARY KEY CLUSTERED (mi_prinx)
    WITH (
      PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF,
      ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON),
  CONSTRAINT test_linjer_chk CHECK ([sp_geometry].[STSrid]=(25832) AND [sp_geometry].[STGeometryType]()='MultiLineString')
)
ON [PRIMARY]
GO

--
-- Definition for table test_linjer_duplikater : 
--

CREATE TABLE gnssdata.test_linjer_duplikater (
  mi_prinx int DEFAULT NEXT VALUE FOR [gnssdata].[object_number] NOT NULL,
  typenavn nvarchar(80) COLLATE Danish_Norwegian_CI_AS DEFAULT '-' NOT NULL,
  kategori nvarchar(80) COLLATE Danish_Norwegian_CI_AS DEFAULT '-' NOT NULL,
  registrering nvarchar(80) COLLATE Danish_Norwegian_CI_AS DEFAULT '-' NOT NULL,
  kommentar nvarchar(80) COLLATE Danish_Norwegian_CI_AS NULL,
  gnss_oprettet datetime2(7) NULL,
  gnss_ini nvarchar(20) COLLATE Danish_Norwegian_CI_AS NULL,
  gnss_pdop float NULL,
  gnss_filepath nvarchar(255) COLLATE Danish_Norwegian_CI_AS NULL,
  gnss_unit nvarchar(80) COLLATE Danish_Norwegian_CI_AS NULL,
  db_oprettet datetime2(7) NULL,
  db_ini nvarchar(20) COLLATE Danish_Norwegian_CI_AS NULL,
  mi_style nvarchar(255) COLLATE Danish_Norwegian_CI_AS DEFAULT 'PEN(1,2,0)' NOT NULL,
  sp_geometry geometry NULL,
  gnss_id int DEFAULT -1 NOT NULL,
  CONSTRAINT test_linjer_duplikater_pkey PRIMARY KEY CLUSTERED (mi_prinx)
    WITH (
      PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF,
      ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON),
  CONSTRAINT test_linjer_duplikater_chk CHECK ([sp_geometry].[STSrid]=(25832) AND [sp_geometry].[STGeometryType]()='MultiLineString')
)
ON [PRIMARY]
GO

--
-- Definition for table test_punkter : 
--

CREATE TABLE gnssdata.test_punkter (
  mi_prinx int DEFAULT NEXT VALUE FOR [gnssdata].[object_number] NOT NULL,
  typenavn nvarchar(80) COLLATE Danish_Norwegian_CI_AS DEFAULT '-' NOT NULL,
  kategori nvarchar(80) COLLATE Danish_Norwegian_CI_AS DEFAULT '-' NOT NULL,
  registrering nvarchar(80) COLLATE Danish_Norwegian_CI_AS DEFAULT '-' NOT NULL,
  kommentar nvarchar(80) COLLATE Danish_Norwegian_CI_AS NULL,
  gnss_oprettet datetime2(7) NULL,
  gnss_ini nvarchar(20) COLLATE Danish_Norwegian_CI_AS NULL,
  gnss_pdop float NULL,
  gnss_filepath nvarchar(255) COLLATE Danish_Norwegian_CI_AS NULL,
  gnss_unit nvarchar(80) COLLATE Danish_Norwegian_CI_AS NULL,
  db_oprettet datetime2(7) NULL,
  db_ini nvarchar(20) COLLATE Danish_Norwegian_CI_AS NULL,
  mi_style nvarchar(255) COLLATE Danish_Norwegian_CI_AS DEFAULT 'SYMBOL(40,0,12)' NOT NULL,
  sp_geometry geometry NULL,
  gnss_id int DEFAULT -1 NOT NULL,
  CONSTRAINT test_punkter_pkey PRIMARY KEY CLUSTERED (mi_prinx)
    WITH (
      PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF,
      ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON),
  CONSTRAINT test_punkter_chk CHECK ([sp_geometry].[STSrid]=(25832) AND [sp_geometry].[STGeometryType]()='Point')
)
ON [PRIMARY]
GO

--
-- Definition for table test_punkter_duplikater : 
--

CREATE TABLE gnssdata.test_punkter_duplikater (
  mi_prinx int DEFAULT NEXT VALUE FOR [gnssdata].[object_number] NOT NULL,
  typenavn nvarchar(80) COLLATE Danish_Norwegian_CI_AS DEFAULT '-' NOT NULL,
  kategori nvarchar(80) COLLATE Danish_Norwegian_CI_AS DEFAULT '-' NOT NULL,
  registrering nvarchar(80) COLLATE Danish_Norwegian_CI_AS DEFAULT '-' NOT NULL,
  kommentar nvarchar(80) COLLATE Danish_Norwegian_CI_AS NULL,
  gnss_oprettet datetime2(7) NULL,
  gnss_ini nvarchar(20) COLLATE Danish_Norwegian_CI_AS NULL,
  gnss_pdop float NULL,
  gnss_filepath nvarchar(255) COLLATE Danish_Norwegian_CI_AS NULL,
  gnss_unit nvarchar(80) COLLATE Danish_Norwegian_CI_AS NULL,
  db_oprettet datetime2(7) NULL,
  db_ini nvarchar(20) COLLATE Danish_Norwegian_CI_AS NULL,
  mi_style nvarchar(255) COLLATE Danish_Norwegian_CI_AS DEFAULT 'SYMBOL(40,0,12)' NOT NULL,
  sp_geometry geometry NULL,
  gnss_id int DEFAULT -1 NOT NULL,
  CONSTRAINT test_punkter_duplikater_pkey PRIMARY KEY CLUSTERED (mi_prinx)
    WITH (
      PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF,
      ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON),
  CONSTRAINT test_punkter_duplikater_chk CHECK ([sp_geometry].[STSrid]=(25832) AND [sp_geometry].[STGeometryType]()='Point')
)
ON [PRIMARY]
GO

--
-- Definition for table mapinfo_mapcatalog : 
--

CREATE TABLE mapinfo.mapinfo_mapcatalog (
  spatialtype float NULL,
  tablename varchar(32) COLLATE Danish_Norwegian_CI_AS NOT NULL,
  ownername varchar(32) COLLATE Danish_Norwegian_CI_AS NOT NULL,
  spatialcolumn varchar(32) COLLATE Danish_Norwegian_CI_AS NULL,
  db_x_ll float NULL,
  db_y_ll float NULL,
  db_x_ur float NULL,
  db_y_ur float NULL,
  view_x_ll float NULL,
  view_y_ll float NULL,
  view_x_ur float NULL,
  view_y_ur float NULL,
  coordinatesystem varchar(254) COLLATE Danish_Norwegian_CI_AS NULL,
  symbol varchar(254) COLLATE Danish_Norwegian_CI_AS NULL,
  xcolumnname varchar(32) COLLATE Danish_Norwegian_CI_AS NULL,
  ycolumnname varchar(32) COLLATE Danish_Norwegian_CI_AS NULL,
  renditiontype int NULL,
  renditioncolumn varchar(32) COLLATE Danish_Norwegian_CI_AS NULL,
  renditiontable varchar(32) COLLATE Danish_Norwegian_CI_AS NULL,
  number_rows int NULL,
  CONSTRAINT mapinfo_mapcatalog_pk PRIMARY KEY CLUSTERED (tablename, ownername)
    WITH (
      PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF,
      ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
ON [PRIMARY]
GO

--
-- Definition for table gnss_data : 
--

CREATE TABLE transit.gnss_data (
  id varchar(30) COLLATE Danish_Norwegian_CI_AS NULL,
  typenavn nvarchar(80) COLLATE Danish_Norwegian_CI_AS NULL,
  kategori nvarchar(80) COLLATE Danish_Norwegian_CI_AS NULL,
  registrering nvarchar(80) COLLATE Danish_Norwegian_CI_AS NULL,
  kommentar nvarchar(80) COLLATE Danish_Norwegian_CI_AS NULL,
  ini nvarchar(20) COLLATE Danish_Norwegian_CI_AS NULL,
  oprettet nvarchar(30) COLLATE Danish_Norwegian_CI_AS NULL,
  filepath nvarchar(255) COLLATE Danish_Norwegian_CI_AS NULL,
  unit nvarchar(80) COLLATE Danish_Norwegian_CI_AS NULL,
  sp_geometry geometry NULL,
  mi_prinx int NULL,
  pdop float NULL
)
ON [PRIMARY]
GO

--
-- Definition for table test_data : 
--

CREATE TABLE transit.test_data (
  id varchar(30) COLLATE Danish_Norwegian_CI_AS NULL,
  typenavn nvarchar(80) COLLATE Danish_Norwegian_CI_AS NULL,
  kategori nvarchar(80) COLLATE Danish_Norwegian_CI_AS NULL,
  registrering nvarchar(80) COLLATE Danish_Norwegian_CI_AS NULL,
  kommentar nvarchar(80) COLLATE Danish_Norwegian_CI_AS NULL,
  ini nvarchar(20) COLLATE Danish_Norwegian_CI_AS NULL,
  oprettet nvarchar(30) COLLATE Danish_Norwegian_CI_AS NULL,
  filepath nvarchar(255) COLLATE Danish_Norwegian_CI_AS NULL,
  unit nvarchar(80) COLLATE Danish_Norwegian_CI_AS NULL,
  sp_geometry geometry NULL,
  mi_prinx int NULL,
  pdop float NULL
)
ON [PRIMARY]
GO

--
-- Definition for stored procedure ReplaceAccent : 
--

CREATE PROCEDURE [transit].ReplaceAccent @schemaname nvarchar(100), @tablename nvarchar(100) AS

BEGIN

  SET NOCOUNT ON

  DECLARE @object_id INT
  DECLARE @columnName sysname
  DECLARE @sqlCommand nvarchar(999)

  SELECT @object_id =A.OBJECT_ID FROM sys.objects A INNER JOIN sys.schemas B ON A.SCHEMA_ID = B.SCHEMA_ID
	WHERE TYPE = 'U' AND UPPER(B.NAME) = UPPER(@schemaname) AND UPPER(A.NAME) = UPPER(@tablename)

  --PRINT @object_id

  -- Find nvarchars columns
  DECLARE COL_CURSOR CURSOR FOR
    SELECT A.NAME FROM sys.columns A INNER JOIN sys.types B ON A.SYSTEM_TYPE_ID = B.SYSTEM_TYPE_ID
      WHERE  OBJECT_ID = @object_id AND IS_COMPUTED = 0 AND B.NAME IN ('nvarchar','varchar')

  -- iterate the found columns
  OPEN COL_CURSOR FETCH NEXT FROM COL_CURSOR INTO @columnName

  WHILE @@FETCH_STATUS = 0
  BEGIN

    -- replace every occurence of a UTF8 accented character with the LATIN1 based equivalent
    SET @sqlCommand =  'UPDATE [' + @schemaname + '].[' + @tablename + '] SET [' + @columnName + '] = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE([' + @columnName + '],''Ã¦'',''æ''),''Ã¸'',''ø''),''Ã¥'',''å''),''Ã¼'',''ü''),''Ã©'',''é''),''Ã†'',''Æ''),''Ã˜'',''Ø''),''Ã…'',''Å''),''Ãœ'',''Ü''),''Ã‰'',''É'')  WHERE [' + @columnName + '] LIKE ''%Ã%'''
    EXEC(@sqlCommand)
	--PRINT @sqlCommand

    FETCH NEXT FROM COL_CURSOR INTO @columnName

  END

  CLOSE COL_CURSOR
  DEALLOCATE COL_CURSOR

END
GO

--
-- Definition for stored procedure procFindReplace : 
--

CREATE PROCEDURE [transit].procFindReplace
AS

BEGIN
  SET NOCOUNT ON

  DECLARE @schema sysname
  DECLARE @table sysname

  DECLARE TAB_CURSOR CURSOR  FOR

    SELECT B.NAME AS SCHEMANAME, A.NAME AS TABLENAME FROM sys.objects A
      INNER JOIN sys.schemas B ON A.SCHEMA_ID = B.SCHEMA_ID
    WHERE TYPE = 'U' ORDER BY 1

  OPEN TAB_CURSOR

  FETCH NEXT FROM TAB_CURSOR INTO @schema, @table

  WHILE @@FETCH_STATUS = 0
    BEGIN

      EXEC transit.ReplaceAccent @schema, @table;
      FETCH NEXT FROM TAB_CURSOR INTO @schema, @table

    END

  CLOSE TAB_CURSOR
  DEALLOCATE TAB_CURSOR
END
GO

--
-- Definition for indices : 
--

CREATE SPATIAL INDEX gnss_flader_sp_geometry_sidx ON gnssdata.gnss_flader
  (sp_geometry)
USING GEOMETRY_GRID
WITH (
  BOUNDING_BOX = ( XMIN = 400000, YMIN = 6000000, XMAX = 900000, YMAX = 6500000 ),
  GRIDS = ( LEVEL_1 = MEDIUM, LEVEL_2 = MEDIUM, LEVEL_3 = MEDIUM, LEVEL_4 = MEDIUM ),
  CELLS_PER_OBJECT = 16,

  PAD_INDEX = OFF,
  DROP_EXISTING = OFF,
  STATISTICS_NORECOMPUTE = OFF,
  SORT_IN_TEMPDB = OFF,
  ALLOW_ROW_LOCKS = ON,
  ALLOW_PAGE_LOCKS = ON)
ON [PRIMARY]
GO

CREATE SPATIAL INDEX gnss_flader_duplikater_sp_geometry_sidx ON gnssdata.gnss_flader_duplikater
  (sp_geometry)
USING GEOMETRY_GRID
WITH (
  BOUNDING_BOX = ( XMIN = 400000, YMIN = 6000000, XMAX = 900000, YMAX = 6500000 ),
  GRIDS = ( LEVEL_1 = MEDIUM, LEVEL_2 = MEDIUM, LEVEL_3 = MEDIUM, LEVEL_4 = MEDIUM ),
  CELLS_PER_OBJECT = 16,

  PAD_INDEX = OFF,
  DROP_EXISTING = OFF,
  STATISTICS_NORECOMPUTE = OFF,
  SORT_IN_TEMPDB = OFF,
  ALLOW_ROW_LOCKS = ON,
  ALLOW_PAGE_LOCKS = ON)
ON [PRIMARY]
GO

CREATE SPATIAL INDEX gnss_linjer_sp_geometry_sidx ON gnssdata.gnss_linjer
  (sp_geometry)
USING GEOMETRY_GRID
WITH (
  BOUNDING_BOX = ( XMIN = 400000, YMIN = 6000000, XMAX = 900000, YMAX = 6500000 ),
  GRIDS = ( LEVEL_1 = MEDIUM, LEVEL_2 = MEDIUM, LEVEL_3 = MEDIUM, LEVEL_4 = MEDIUM ),
  CELLS_PER_OBJECT = 16,

  PAD_INDEX = OFF,
  DROP_EXISTING = OFF,
  STATISTICS_NORECOMPUTE = OFF,
  SORT_IN_TEMPDB = OFF,
  ALLOW_ROW_LOCKS = ON,
  ALLOW_PAGE_LOCKS = ON)
ON [PRIMARY]
GO

CREATE SPATIAL INDEX gnss_linjer_duplikater_sp_geometry_sidx ON gnssdata.gnss_linjer_duplikater
  (sp_geometry)
USING GEOMETRY_GRID
WITH (
  BOUNDING_BOX = ( XMIN = 400000, YMIN = 6000000, XMAX = 900000, YMAX = 6500000 ),
  GRIDS = ( LEVEL_1 = MEDIUM, LEVEL_2 = MEDIUM, LEVEL_3 = MEDIUM, LEVEL_4 = MEDIUM ),
  CELLS_PER_OBJECT = 16,

  PAD_INDEX = OFF,
  DROP_EXISTING = OFF,
  STATISTICS_NORECOMPUTE = OFF,
  SORT_IN_TEMPDB = OFF,
  ALLOW_ROW_LOCKS = ON,
  ALLOW_PAGE_LOCKS = ON)
ON [PRIMARY]
GO

CREATE SPATIAL INDEX gnss_punkter_sp_geometry_sidx ON gnssdata.gnss_punkter
  (sp_geometry)
USING GEOMETRY_GRID
WITH (
  BOUNDING_BOX = ( XMIN = 400000, YMIN = 6000000, XMAX = 900000, YMAX = 6500000 ),
  GRIDS = ( LEVEL_1 = MEDIUM, LEVEL_2 = MEDIUM, LEVEL_3 = MEDIUM, LEVEL_4 = MEDIUM ),
  CELLS_PER_OBJECT = 16,

  PAD_INDEX = OFF,
  DROP_EXISTING = OFF,
  STATISTICS_NORECOMPUTE = OFF,
  SORT_IN_TEMPDB = OFF,
  ALLOW_ROW_LOCKS = ON,
  ALLOW_PAGE_LOCKS = ON)
ON [PRIMARY]
GO

CREATE SPATIAL INDEX gnss_punkter_duplikater_sp_geometry_sidx ON gnssdata.gnss_punkter_duplikater
  (sp_geometry)
USING GEOMETRY_GRID
WITH (
  BOUNDING_BOX = ( XMIN = 400000, YMIN = 6000000, XMAX = 900000, YMAX = 6500000 ),
  GRIDS = ( LEVEL_1 = MEDIUM, LEVEL_2 = MEDIUM, LEVEL_3 = MEDIUM, LEVEL_4 = MEDIUM ),
  CELLS_PER_OBJECT = 16,

  PAD_INDEX = OFF,
  DROP_EXISTING = OFF,
  STATISTICS_NORECOMPUTE = OFF,
  SORT_IN_TEMPDB = OFF,
  ALLOW_ROW_LOCKS = ON,
  ALLOW_PAGE_LOCKS = ON)
ON [PRIMARY]
GO

CREATE SPATIAL INDEX test_flader_sp_geometry_sidx ON gnssdata.test_flader
  (sp_geometry)
USING GEOMETRY_GRID
WITH (
  BOUNDING_BOX = ( XMIN = 400000, YMIN = 6000000, XMAX = 900000, YMAX = 6500000 ),
  GRIDS = ( LEVEL_1 = MEDIUM, LEVEL_2 = MEDIUM, LEVEL_3 = MEDIUM, LEVEL_4 = MEDIUM ),
  CELLS_PER_OBJECT = 16,

  PAD_INDEX = OFF,
  DROP_EXISTING = OFF,
  STATISTICS_NORECOMPUTE = OFF,
  SORT_IN_TEMPDB = OFF,
  ALLOW_ROW_LOCKS = ON,
  ALLOW_PAGE_LOCKS = ON)
ON [PRIMARY]
GO

CREATE SPATIAL INDEX test_flader_duplikater_sp_geometry_sidx ON gnssdata.test_flader_duplikater
  (sp_geometry)
USING GEOMETRY_GRID
WITH (
  BOUNDING_BOX = ( XMIN = 400000, YMIN = 6000000, XMAX = 900000, YMAX = 6500000 ),
  GRIDS = ( LEVEL_1 = MEDIUM, LEVEL_2 = MEDIUM, LEVEL_3 = MEDIUM, LEVEL_4 = MEDIUM ),
  CELLS_PER_OBJECT = 16,

  PAD_INDEX = OFF,
  DROP_EXISTING = OFF,
  STATISTICS_NORECOMPUTE = OFF,
  SORT_IN_TEMPDB = OFF,
  ALLOW_ROW_LOCKS = ON,
  ALLOW_PAGE_LOCKS = ON)
ON [PRIMARY]
GO

CREATE SPATIAL INDEX test_linjer_sp_geometry_sidx ON gnssdata.test_linjer
  (sp_geometry)
USING GEOMETRY_GRID
WITH (
  BOUNDING_BOX = ( XMIN = 400000, YMIN = 6000000, XMAX = 900000, YMAX = 6500000 ),
  GRIDS = ( LEVEL_1 = MEDIUM, LEVEL_2 = MEDIUM, LEVEL_3 = MEDIUM, LEVEL_4 = MEDIUM ),
  CELLS_PER_OBJECT = 16,

  PAD_INDEX = OFF,
  DROP_EXISTING = OFF,
  STATISTICS_NORECOMPUTE = OFF,
  SORT_IN_TEMPDB = OFF,
  ALLOW_ROW_LOCKS = ON,
  ALLOW_PAGE_LOCKS = ON)
ON [PRIMARY]
GO

CREATE SPATIAL INDEX test_linjer_duplikater_sp_geometry_sidx ON gnssdata.test_linjer_duplikater
  (sp_geometry)
USING GEOMETRY_GRID
WITH (
  BOUNDING_BOX = ( XMIN = 400000, YMIN = 6000000, XMAX = 900000, YMAX = 6500000 ),
  GRIDS = ( LEVEL_1 = MEDIUM, LEVEL_2 = MEDIUM, LEVEL_3 = MEDIUM, LEVEL_4 = MEDIUM ),
  CELLS_PER_OBJECT = 16,

  PAD_INDEX = OFF,
  DROP_EXISTING = OFF,
  STATISTICS_NORECOMPUTE = OFF,
  SORT_IN_TEMPDB = OFF,
  ALLOW_ROW_LOCKS = ON,
  ALLOW_PAGE_LOCKS = ON)
ON [PRIMARY]
GO

CREATE SPATIAL INDEX test_punkter_sp_geometry_sidx ON gnssdata.test_punkter
  (sp_geometry)
USING GEOMETRY_GRID
WITH (
  BOUNDING_BOX = ( XMIN = 400000, YMIN = 6000000, XMAX = 900000, YMAX = 6500000 ),
  GRIDS = ( LEVEL_1 = MEDIUM, LEVEL_2 = MEDIUM, LEVEL_3 = MEDIUM, LEVEL_4 = MEDIUM ),
  CELLS_PER_OBJECT = 16,

  PAD_INDEX = OFF,
  DROP_EXISTING = OFF,
  STATISTICS_NORECOMPUTE = OFF,
  SORT_IN_TEMPDB = OFF,
  ALLOW_ROW_LOCKS = ON,
  ALLOW_PAGE_LOCKS = ON)
ON [PRIMARY]
GO

CREATE SPATIAL INDEX test_punkter_duplikater_sp_geometry_sidx ON gnssdata.test_punkter_duplikater
  (sp_geometry)
USING GEOMETRY_GRID
WITH (
  BOUNDING_BOX = ( XMIN = 400000, YMIN = 6000000, XMAX = 900000, YMAX = 6500000 ),
  GRIDS = ( LEVEL_1 = MEDIUM, LEVEL_2 = MEDIUM, LEVEL_3 = MEDIUM, LEVEL_4 = MEDIUM ),
  CELLS_PER_OBJECT = 16,

  PAD_INDEX = OFF,
  DROP_EXISTING = OFF,
  STATISTICS_NORECOMPUTE = OFF,
  SORT_IN_TEMPDB = OFF,
  ALLOW_ROW_LOCKS = ON,
  ALLOW_PAGE_LOCKS = ON)
ON [PRIMARY]
GO

--
-- Definition for triggers : 
--

CREATE TRIGGER transit.gnss_data_trigger ON transit.gnss_data
WITH EXECUTE AS CALLER
INSTEAD OF INSERT
AS
BEGIN

  -- Insert points from "INSERTED" to table "gnssdata"."gnss_punkter_duplikater"

  INSERT INTO gnssdata.gnss_punkter_duplikater
  (
    typenavn,
    kategori,
    registrering,
    kommentar,
    gnss_oprettet,
    gnss_ini,
    gnss_pdop,
    gnss_filepath,
    gnss_unit,
    db_oprettet,
    db_ini,
    sp_geometry,
    gnss_id,
    mi_style
  )
  SELECT
    COALESCE(i.typenavn,'-'),
    COALESCE(i.kategori,'-'),
    COALESCE(i.registrering,'-'),
    i.kommentar,
    TRY_CONVERT(datetime2,
      IIF(ISNUMERIC(SUBSTRING (i.oprettet,7,4)) = 1,
	    CONCAT(SUBSTRING(i.oprettet,7,4),'-',SUBSTRING(i.oprettet,4,2),'-',SUBSTRING(i.oprettet,1,2),' ',SUBSTRING(i.oprettet,12,2),':',SUBSTRING(i.oprettet,12,2),':',SUBSTRING(i.oprettet,18,2)),
	    CONCAT(SUBSTRING(i.oprettet,1,4),'-',SUBSTRING(i.oprettet,6,2),'-',SUBSTRING(i.oprettet,9,2),' ',SUBSTRING(i.oprettet,12,2),':',SUBSTRING(i.oprettet,12,2),':',SUBSTRING(i.oprettet,18,2))
	    ),
      120) 
    AS oprettet,
    i.ini,
    i.pdop,
    i.filepath,
    i.unit,
    CURRENT_TIMESTAMP AS db_oprettet,
    SYSTEM_USER AS db_ini,
    i.sp_geometry.STGeometryN(1) AS sp_geometry,
    COALESCE(i.id,-1),
    COALESCE(s.mi_style,'SYMBOL(40,0,12)')
  FROM INSERTED i
  INNER JOIN gnssdata.gnss_punkter p ON i.sp_geometry.STGeometryN(1).STEquals(p.sp_geometry) = 1
    AND COALESCE(i.typenavn,'-') = p.typenavn AND COALESCE(i.kategori,'-') = p.kategori AND COALESCE(i.registrering,'-') = p.registrering
  LEFT JOIN gnssdata.gnss_styles s ON i.typenavn = s.typenavn AND i.kategori = s.kategori AND i.registrering = s.registrering
  WHERE
    i.sp_geometry.STGeometryType() = 'MultiPoint'

  -- Insert points from "INSERTED" to table "gnssdata"."gnss_punkter"

  INSERT INTO gnssdata.gnss_punkter
  (
    typenavn,
    kategori,
    registrering,
    kommentar,
    gnss_oprettet,
    gnss_ini,
    gnss_pdop,
    gnss_filepath,
    gnss_unit,
    db_oprettet,
    db_ini,
    sp_geometry,
    gnss_id,
    mi_style
  )
  SELECT
    COALESCE(i.typenavn,'-'),
    COALESCE(i.kategori,'-'),
    COALESCE(i.registrering,'-'),
    i.kommentar,
    TRY_CONVERT(datetime2,
      IIF(ISNUMERIC(SUBSTRING (i.oprettet,7,4)) = 1,
	    CONCAT(SUBSTRING(i.oprettet,7,4),'-',SUBSTRING(i.oprettet,4,2),'-',SUBSTRING(i.oprettet,1,2),' ',SUBSTRING(i.oprettet,12,2),':',SUBSTRING(i.oprettet,12,2),':',SUBSTRING(i.oprettet,18,2)),
	    CONCAT(SUBSTRING(i.oprettet,1,4),'-',SUBSTRING(i.oprettet,6,2),'-',SUBSTRING(i.oprettet,9,2),' ',SUBSTRING(i.oprettet,12,2),':',SUBSTRING(i.oprettet,12,2),':',SUBSTRING(i.oprettet,18,2))
	    ),
      120) 
    AS oprettet,
    i.ini,
    i.pdop,
    i.filepath,
    i.unit,
    CURRENT_TIMESTAMP AS db_oprettet,
    SYSTEM_USER AS db_ini,
    i.sp_geometry.STGeometryN(1) AS sp_geometry,
    COALESCE(i.id,-1),
    COALESCE(s.mi_style,'SYMBOL(40,0,12)')
  FROM INSERTED i
  LEFT JOIN gnssdata.gnss_punkter p ON i.sp_geometry.STGeometryN(1).STEquals(p.sp_geometry) = 1
    AND COALESCE(i.typenavn,'-') = p.typenavn AND COALESCE(i.kategori,'-') = p.kategori AND COALESCE(i.registrering,'-') = p.registrering
  LEFT JOIN gnssdata.gnss_styles s ON i.typenavn = s.typenavn AND i.kategori = s.kategori AND i.registrering = s.registrering
  WHERE
    i.sp_geometry.STGeometryType() = 'MultiPoint' AND p.mi_prinx IS NULL

  -- Insert lines from "INSERTED" to table "gnssdata"."gnss_linjer_duplikater"

  INSERT INTO gnssdata.gnss_linjer_duplikater
  (
    typenavn,
    kategori,
    registrering,
    kommentar,
    gnss_oprettet,
    gnss_ini,
    gnss_pdop,
    gnss_filepath,
    gnss_unit,
    db_oprettet,
    db_ini,
    sp_geometry,
    gnss_id,
    mi_style
  )
  SELECT
    COALESCE(i.typenavn,'-'),
    COALESCE(i.kategori,'-'),
    COALESCE(i.registrering,'-'),
    i.kommentar,
    TRY_CONVERT(datetime2,
      IIF(ISNUMERIC(SUBSTRING (i.oprettet,7,4)) = 1,
	    CONCAT(SUBSTRING(i.oprettet,7,4),'-',SUBSTRING(i.oprettet,4,2),'-',SUBSTRING(i.oprettet,1,2),' ',SUBSTRING(i.oprettet,12,2),':',SUBSTRING(i.oprettet,12,2),':',SUBSTRING(i.oprettet,18,2)),
	    CONCAT(SUBSTRING(i.oprettet,1,4),'-',SUBSTRING(i.oprettet,6,2),'-',SUBSTRING(i.oprettet,9,2),' ',SUBSTRING(i.oprettet,12,2),':',SUBSTRING(i.oprettet,12,2),':',SUBSTRING(i.oprettet,18,2))
	    ),
      120) 
    AS oprettet,
    i.ini,
    i.pdop,
    i.filepath,
    i.unit,
    CURRENT_TIMESTAMP AS db_oprettet,
    SYSTEM_USER AS db_ini,
    i.sp_geometry,
    COALESCE(i.id,-1),
    COALESCE(s.mi_style,'PEN(1,2,0)')
  FROM INSERTED i
  INNER JOIN gnssdata.gnss_linjer p ON i.sp_geometry.STEquals(p.sp_geometry) = 1
    AND COALESCE(i.typenavn,'-') = p.typenavn AND COALESCE(i.kategori,'-') = p.kategori AND COALESCE(i.registrering,'-') = p.registrering
  LEFT JOIN gnssdata.gnss_styles s ON i.typenavn = s.typenavn AND i.kategori = s.kategori AND i.registrering = s.registrering
  WHERE
    i.sp_geometry.STGeometryType() = 'MultiLineString'

  -- Insert lines from "INSERTED" to table "gnssdata"."gnss_linjer"

  INSERT INTO gnssdata.gnss_linjer
  (
    typenavn,
    kategori,
    registrering,
    kommentar,
    gnss_oprettet,
    gnss_ini,
    gnss_pdop,
    gnss_filepath,
    gnss_unit,
    db_oprettet,
    db_ini,
    sp_geometry,
    gnss_id,
    mi_style
  )
  SELECT
    COALESCE(i.typenavn,'-'),
    COALESCE(i.kategori,'-'),
    COALESCE(i.registrering,'-'),
    i.kommentar,
    TRY_CONVERT(datetime2,
      IIF(ISNUMERIC(SUBSTRING (i.oprettet,7,4)) = 1,
	    CONCAT(SUBSTRING(i.oprettet,7,4),'-',SUBSTRING(i.oprettet,4,2),'-',SUBSTRING(i.oprettet,1,2),' ',SUBSTRING(i.oprettet,12,2),':',SUBSTRING(i.oprettet,12,2),':',SUBSTRING(i.oprettet,18,2)),
	    CONCAT(SUBSTRING(i.oprettet,1,4),'-',SUBSTRING(i.oprettet,6,2),'-',SUBSTRING(i.oprettet,9,2),' ',SUBSTRING(i.oprettet,12,2),':',SUBSTRING(i.oprettet,12,2),':',SUBSTRING(i.oprettet,18,2))
	    ),
      120) 
    AS oprettet,
    i.ini,
    i.pdop,
    i.filepath,
    i.unit,
    CURRENT_TIMESTAMP AS db_oprettet,
    SYSTEM_USER AS db_ini,
    i.sp_geometry,
    COALESCE(i.id,-1),
    COALESCE(s.mi_style,'PEN(1,2,0)')
  FROM INSERTED i
  LEFT JOIN gnssdata.gnss_linjer p ON i.sp_geometry.STEquals(p.sp_geometry) = 1
    AND COALESCE(i.typenavn,'-') = p.typenavn AND COALESCE(i.kategori,'-') = p.kategori AND COALESCE(i.registrering,'-') = p.registrering
  LEFT JOIN gnssdata.gnss_styles s ON i.typenavn = s.typenavn AND i.kategori = s.kategori AND i.registrering = s.registrering
  WHERE
    i.sp_geometry.STGeometryType() = 'MultiLineString' AND p.mi_prinx IS NULL

  -- Insert polygons from "INSERTED" to table "gnssdata"."gnss_flader_duplikater"

  INSERT INTO gnssdata.gnss_flader_duplikater
  (
    typenavn,
    kategori,
    registrering,
    kommentar,
    gnss_oprettet,
    gnss_ini,
    gnss_pdop,
    gnss_filepath,
    gnss_unit,
    db_oprettet,
    db_ini,
    sp_geometry,
    gnss_id,
    mi_style
  )
  SELECT
    COALESCE(i.typenavn,'-'),
    COALESCE(i.kategori,'-'),
    COALESCE(i.registrering,'-'),
    i.kommentar,
    TRY_CONVERT(datetime2,
      IIF(ISNUMERIC(SUBSTRING (i.oprettet,7,4)) = 1,
	    CONCAT(SUBSTRING(i.oprettet,7,4),'-',SUBSTRING(i.oprettet,4,2),'-',SUBSTRING(i.oprettet,1,2),' ',SUBSTRING(i.oprettet,12,2),':',SUBSTRING(i.oprettet,12,2),':',SUBSTRING(i.oprettet,18,2)),
	    CONCAT(SUBSTRING(i.oprettet,1,4),'-',SUBSTRING(i.oprettet,6,2),'-',SUBSTRING(i.oprettet,9,2),' ',SUBSTRING(i.oprettet,12,2),':',SUBSTRING(i.oprettet,12,2),':',SUBSTRING(i.oprettet,18,2))
	    ),
      120) 
    AS oprettet,
    i.ini,
    i.pdop,
    i.filepath,
    i.unit,
    CURRENT_TIMESTAMP AS db_oprettet,
    SYSTEM_USER AS db_ini,
    i.sp_geometry,
    COALESCE(i.id,-1),
    COALESCE(s.mi_style,'PEN(1,2,0) BRUSH(5,0,-1)')
  FROM INSERTED i
  INNER JOIN gnssdata.gnss_flader p ON i.sp_geometry.STEquals(p.sp_geometry) = 1
    AND COALESCE(i.typenavn,'-') = p.typenavn AND COALESCE(i.kategori,'-') = p.kategori AND COALESCE(i.registrering,'-') = p.registrering
  LEFT JOIN gnssdata.gnss_styles s ON i.typenavn = s.typenavn AND i.kategori = s.kategori AND i.registrering = s.registrering
  WHERE
    i.sp_geometry.STGeometryType() = 'MultiPolygon'

  -- Insert polygons from "INSERTED" to table "gnssdata"."gnss_flader"

  INSERT INTO gnssdata.gnss_flader
  (
    typenavn,
    kategori,
    registrering,
    kommentar,
    gnss_oprettet,
    gnss_ini,
    gnss_pdop,
    gnss_filepath,
    gnss_unit,
    db_oprettet,
    db_ini,
    sp_geometry,
    gnss_id,
    mi_style
  )
  SELECT
    COALESCE(i.typenavn,'-'),
    COALESCE(i.kategori,'-'),
    COALESCE(i.registrering,'-'),
    i.kommentar,
    TRY_CONVERT(datetime2,
      IIF(ISNUMERIC(SUBSTRING (i.oprettet,7,4)) = 1,
	    CONCAT(SUBSTRING(i.oprettet,7,4),'-',SUBSTRING(i.oprettet,4,2),'-',SUBSTRING(i.oprettet,1,2),' ',SUBSTRING(i.oprettet,12,2),':',SUBSTRING(i.oprettet,12,2),':',SUBSTRING(i.oprettet,18,2)),
	    CONCAT(SUBSTRING(i.oprettet,1,4),'-',SUBSTRING(i.oprettet,6,2),'-',SUBSTRING(i.oprettet,9,2),' ',SUBSTRING(i.oprettet,12,2),':',SUBSTRING(i.oprettet,12,2),':',SUBSTRING(i.oprettet,18,2))
	    ),
      120) 
    AS oprettet,
    i.ini,
    i.pdop,
    i.filepath,
    i.unit,
    CURRENT_TIMESTAMP AS db_oprettet,
    SYSTEM_USER AS db_ini,
    i.sp_geometry,
    COALESCE(i.id,-1),
    COALESCE(s.mi_style,'PEN(1,2,0) BRUSH(5,0,-1)')
  FROM INSERTED i
  LEFT JOIN gnssdata.gnss_flader p ON i.sp_geometry.STEquals(p.sp_geometry) = 1
    AND COALESCE(i.typenavn,'-') = p.typenavn AND COALESCE(i.kategori,'-') = p.kategori AND COALESCE(i.registrering,'-') = p.registrering
  LEFT JOIN gnssdata.gnss_styles s ON i.typenavn = s.typenavn AND i.kategori = s.kategori AND i.registrering = s.registrering
  WHERE
    i.sp_geometry.STGeometryType() = 'MultiPolygon' AND p.mi_prinx IS NULL

END
GO

CREATE TRIGGER transit.test_data_trigger ON transit.test_data
WITH EXECUTE AS CALLER
INSTEAD OF INSERT
AS
BEGIN

  -- Insert points from "INSERTED" to table "gnssdata"."test_punkter_duplikater"

  INSERT INTO gnssdata.test_punkter_duplikater
  (
    typenavn,
    kategori,
    registrering,
    kommentar,
    gnss_oprettet,
    gnss_ini,
    gnss_pdop,
    gnss_filepath,
    gnss_unit,
    db_oprettet,
    db_ini,
    sp_geometry,
    gnss_id,
    mi_style
  )
  SELECT
    COALESCE(i.typenavn,'-'),
    COALESCE(i.kategori,'-'),
    COALESCE(i.registrering,'-'),
    i.kommentar,
    TRY_CONVERT(datetime2,
      IIF(ISNUMERIC(SUBSTRING (i.oprettet,7,4)) = 1,
	    CONCAT(SUBSTRING(i.oprettet,7,4),'-',SUBSTRING(i.oprettet,4,2),'-',SUBSTRING(i.oprettet,1,2),' ',SUBSTRING(i.oprettet,12,2),':',SUBSTRING(i.oprettet,12,2),':',SUBSTRING(i.oprettet,18,2)),
	    CONCAT(SUBSTRING(i.oprettet,1,4),'-',SUBSTRING(i.oprettet,6,2),'-',SUBSTRING(i.oprettet,9,2),' ',SUBSTRING(i.oprettet,12,2),':',SUBSTRING(i.oprettet,12,2),':',SUBSTRING(i.oprettet,18,2))
	    ),
      120) 
    AS oprettet,
    i.ini,
    i.pdop,
    i.filepath,
    i.unit,
    CURRENT_TIMESTAMP AS db_oprettet,
    SYSTEM_USER AS db_ini,
    i.sp_geometry.STGeometryN(1) AS sp_geometry,
    COALESCE(i.id,-1),
    COALESCE(s.mi_style,'SYMBOL(40,0,12)')
  FROM INSERTED i
  INNER JOIN gnssdata.test_punkter p ON i.sp_geometry.STGeometryN(1).STEquals(p.sp_geometry) = 1
    AND COALESCE(i.typenavn,'-') = p.typenavn AND COALESCE(i.kategori,'-') = p.kategori AND COALESCE(i.registrering,'-') = p.registrering
  LEFT JOIN gnssdata.gnss_styles s ON i.typenavn = s.typenavn AND i.kategori = s.kategori AND i.registrering = s.registrering
  WHERE
    i.sp_geometry.STGeometryType() = 'MultiPoint'

  -- Insert points from "INSERTED" to table "gnssdata"."test_punkter"

  INSERT INTO gnssdata.test_punkter
  (
    typenavn,
    kategori,
    registrering,
    kommentar,
    gnss_oprettet,
    gnss_ini,
    gnss_pdop,
    gnss_filepath,
    gnss_unit,
    db_oprettet,
    db_ini,
    sp_geometry,
    gnss_id,
    mi_style
  )
  SELECT
    COALESCE(i.typenavn,'-'),
    COALESCE(i.kategori,'-'),
    COALESCE(i.registrering,'-'),
    i.kommentar,
    TRY_CONVERT(datetime2,
      IIF(ISNUMERIC(SUBSTRING (i.oprettet,7,4)) = 1,
	    CONCAT(SUBSTRING(i.oprettet,7,4),'-',SUBSTRING(i.oprettet,4,2),'-',SUBSTRING(i.oprettet,1,2),' ',SUBSTRING(i.oprettet,12,2),':',SUBSTRING(i.oprettet,12,2),':',SUBSTRING(i.oprettet,18,2)),
	    CONCAT(SUBSTRING(i.oprettet,1,4),'-',SUBSTRING(i.oprettet,6,2),'-',SUBSTRING(i.oprettet,9,2),' ',SUBSTRING(i.oprettet,12,2),':',SUBSTRING(i.oprettet,12,2),':',SUBSTRING(i.oprettet,18,2))
	    ),
      120) 
    AS oprettet,
    i.ini,
    i.pdop,
    i.filepath,
    i.unit,
    CURRENT_TIMESTAMP AS db_oprettet,
    SYSTEM_USER AS db_ini,
    i.sp_geometry.STGeometryN(1) AS sp_geometry,
    COALESCE(i.id,-1),
    COALESCE(s.mi_style,'SYMBOL(40,0,12)')
  FROM INSERTED i
  LEFT JOIN gnssdata.test_punkter p ON i.sp_geometry.STGeometryN(1).STEquals(p.sp_geometry) = 1
    AND COALESCE(i.typenavn,'-') = p.typenavn AND COALESCE(i.kategori,'-') = p.kategori AND COALESCE(i.registrering,'-') = p.registrering
  LEFT JOIN gnssdata.gnss_styles s ON i.typenavn = s.typenavn AND i.kategori = s.kategori AND i.registrering = s.registrering
  WHERE
    i.sp_geometry.STGeometryType() = 'MultiPoint' AND p.mi_prinx IS NULL

  -- Insert lines from "INSERTED" to table "gnssdata"."test_linjer_duplikater"

  INSERT INTO gnssdata.test_linjer_duplikater
  (
    typenavn,
    kategori,
    registrering,
    kommentar,
    gnss_oprettet,
    gnss_ini,
    gnss_pdop,
    gnss_filepath,
    gnss_unit,
    db_oprettet,
    db_ini,
    sp_geometry,
    gnss_id,
    mi_style
  )
  SELECT
    COALESCE(i.typenavn,'-'),
    COALESCE(i.kategori,'-'),
    COALESCE(i.registrering,'-'),
    i.kommentar,
    TRY_CONVERT(datetime2,
      IIF(ISNUMERIC(SUBSTRING (i.oprettet,7,4)) = 1,
	    CONCAT(SUBSTRING(i.oprettet,7,4),'-',SUBSTRING(i.oprettet,4,2),'-',SUBSTRING(i.oprettet,1,2),' ',SUBSTRING(i.oprettet,12,2),':',SUBSTRING(i.oprettet,12,2),':',SUBSTRING(i.oprettet,18,2)),
	    CONCAT(SUBSTRING(i.oprettet,1,4),'-',SUBSTRING(i.oprettet,6,2),'-',SUBSTRING(i.oprettet,9,2),' ',SUBSTRING(i.oprettet,12,2),':',SUBSTRING(i.oprettet,12,2),':',SUBSTRING(i.oprettet,18,2))
	    ),
      120) 
    AS oprettet,
    i.ini,
    i.pdop,
    i.filepath,
    i.unit,
    CURRENT_TIMESTAMP AS db_oprettet,
    SYSTEM_USER AS db_ini,
    i.sp_geometry,
    COALESCE(i.id,-1),
    COALESCE(s.mi_style,'PEN(1,2,0)')
  FROM INSERTED i
  INNER JOIN gnssdata.test_linjer p ON i.sp_geometry.STEquals(p.sp_geometry) = 1
    AND COALESCE(i.typenavn,'-') = p.typenavn AND COALESCE(i.kategori,'-') = p.kategori AND COALESCE(i.registrering,'-') = p.registrering
  LEFT JOIN gnssdata.gnss_styles s ON i.typenavn = s.typenavn AND i.kategori = s.kategori AND i.registrering = s.registrering
  WHERE
    i.sp_geometry.STGeometryType() = 'MultiLineString'

  -- Insert lines from "INSERTED" to table "gnssdata"."test_linjer"

  INSERT INTO gnssdata.test_linjer
  (
    typenavn,
    kategori,
    registrering,
    kommentar,
    gnss_oprettet,
    gnss_ini,
    gnss_pdop,
    gnss_filepath,
    gnss_unit,
    db_oprettet,
    db_ini,
    sp_geometry,
    gnss_id,
    mi_style
  )
  SELECT
    COALESCE(i.typenavn,'-'),
    COALESCE(i.kategori,'-'),
    COALESCE(i.registrering,'-'),
    i.kommentar,
    TRY_CONVERT(datetime2,
      IIF(ISNUMERIC(SUBSTRING (i.oprettet,7,4)) = 1,
	    CONCAT(SUBSTRING(i.oprettet,7,4),'-',SUBSTRING(i.oprettet,4,2),'-',SUBSTRING(i.oprettet,1,2),' ',SUBSTRING(i.oprettet,12,2),':',SUBSTRING(i.oprettet,12,2),':',SUBSTRING(i.oprettet,18,2)),
	    CONCAT(SUBSTRING(i.oprettet,1,4),'-',SUBSTRING(i.oprettet,6,2),'-',SUBSTRING(i.oprettet,9,2),' ',SUBSTRING(i.oprettet,12,2),':',SUBSTRING(i.oprettet,12,2),':',SUBSTRING(i.oprettet,18,2))
	    ),
      120) 
    AS oprettet,
    i.ini,
    i.pdop,
    i.filepath,
    i.unit,
    CURRENT_TIMESTAMP AS db_oprettet,
    SYSTEM_USER AS db_ini,
    i.sp_geometry,
    COALESCE(i.id,-1),
    COALESCE(s.mi_style,'PEN(1,2,0)')
  FROM INSERTED i
  LEFT JOIN gnssdata.test_linjer p ON i.sp_geometry.STEquals(p.sp_geometry) = 1
    AND COALESCE(i.typenavn,'-') = p.typenavn AND COALESCE(i.kategori,'-') = p.kategori AND COALESCE(i.registrering,'-') = p.registrering
  LEFT JOIN gnssdata.gnss_styles s ON i.typenavn = s.typenavn AND i.kategori = s.kategori AND i.registrering = s.registrering
  WHERE
    i.sp_geometry.STGeometryType() = 'MultiLineString' AND p.mi_prinx IS NULL

  -- Insert polygons from "INSERTED" to table "gnssdata"."test_flader_duplikater"

  INSERT INTO gnssdata.test_flader_duplikater
  (
    typenavn,
    kategori,
    registrering,
    kommentar,
    gnss_oprettet,
    gnss_ini,
    gnss_pdop,
    gnss_filepath,
    gnss_unit,
    db_oprettet,
    db_ini,
    sp_geometry,
    gnss_id,
    mi_style
  )
  SELECT
    COALESCE(i.typenavn,'-'),
    COALESCE(i.kategori,'-'),
    COALESCE(i.registrering,'-'),
    i.kommentar,
    TRY_CONVERT(datetime2,
      IIF(ISNUMERIC(SUBSTRING (i.oprettet,7,4)) = 1,
	    CONCAT(SUBSTRING(i.oprettet,7,4),'-',SUBSTRING(i.oprettet,4,2),'-',SUBSTRING(i.oprettet,1,2),' ',SUBSTRING(i.oprettet,12,2),':',SUBSTRING(i.oprettet,12,2),':',SUBSTRING(i.oprettet,18,2)),
	    CONCAT(SUBSTRING(i.oprettet,1,4),'-',SUBSTRING(i.oprettet,6,2),'-',SUBSTRING(i.oprettet,9,2),' ',SUBSTRING(i.oprettet,12,2),':',SUBSTRING(i.oprettet,12,2),':',SUBSTRING(i.oprettet,18,2))
	    ),
      120) 
    AS oprettet,
    i.ini,
    i.pdop,
    i.filepath,
    i.unit,
    CURRENT_TIMESTAMP AS db_oprettet,
    SYSTEM_USER AS db_ini,
    i.sp_geometry,
    COALESCE(i.id,-1),
    COALESCE(s.mi_style,'PEN(1,2,0) BRUSH(5,0,-1)')
  FROM INSERTED i
  INNER JOIN gnssdata.test_flader p ON i.sp_geometry.STEquals(p.sp_geometry) = 1
    AND COALESCE(i.typenavn,'-') = p.typenavn AND COALESCE(i.kategori,'-') = p.kategori AND COALESCE(i.registrering,'-') = p.registrering
  LEFT JOIN gnssdata.gnss_styles s ON i.typenavn = s.typenavn AND i.kategori = s.kategori AND i.registrering = s.registrering
  WHERE
    i.sp_geometry.STGeometryType() = 'MultiPolygon'

  -- Insert polygons from "INSERTED" to table "gnssdata"."test_flader"

  INSERT INTO gnssdata.test_flader
  (
    typenavn,
    kategori,
    registrering,
    kommentar,
    gnss_oprettet,
    gnss_ini,
    gnss_pdop,
    gnss_filepath,
    gnss_unit,
    db_oprettet,
    db_ini,
    sp_geometry,
    gnss_id,
    mi_style
  )
  SELECT
    COALESCE(i.typenavn,'-'),
    COALESCE(i.kategori,'-'),
    COALESCE(i.registrering,'-'),
    i.kommentar,
    TRY_CONVERT(datetime2,
      IIF(ISNUMERIC(SUBSTRING (i.oprettet,7,4)) = 1,
	    CONCAT(SUBSTRING(i.oprettet,7,4),'-',SUBSTRING(i.oprettet,4,2),'-',SUBSTRING(i.oprettet,1,2),' ',SUBSTRING(i.oprettet,12,2),':',SUBSTRING(i.oprettet,12,2),':',SUBSTRING(i.oprettet,18,2)),
	    CONCAT(SUBSTRING(i.oprettet,1,4),'-',SUBSTRING(i.oprettet,6,2),'-',SUBSTRING(i.oprettet,9,2),' ',SUBSTRING(i.oprettet,12,2),':',SUBSTRING(i.oprettet,12,2),':',SUBSTRING(i.oprettet,18,2))
	    ),
      120) 
    AS oprettet,
    i.ini,
    i.pdop,
    i.filepath,
    i.unit,
    CURRENT_TIMESTAMP AS db_oprettet,
    SYSTEM_USER AS db_ini,
    i.sp_geometry,
    COALESCE(i.id,-1),
    COALESCE(s.mi_style,'PEN(1,2,0) BRUSH(5,0,-1)')
  FROM INSERTED i
  LEFT JOIN gnssdata.test_flader p ON i.sp_geometry.STEquals(p.sp_geometry) = 1
    AND COALESCE(i.typenavn,'-') = p.typenavn AND COALESCE(i.kategori,'-') = p.kategori AND COALESCE(i.registrering,'-') = p.registrering
  LEFT JOIN gnssdata.gnss_styles s ON i.typenavn = s.typenavn AND i.kategori = s.kategori AND i.registrering = s.registrering
  WHERE
    i.sp_geometry.STGeometryType() = 'MultiPolygon' AND p.mi_prinx IS NULL

END
GO

