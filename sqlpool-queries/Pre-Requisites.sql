
CREATE MASTER KEY ENCRYPTION BY PASSWORD = '<<STRONG_PASSWORD_HERE>>';

--CREATING A SCOPE
CREATE DATABASE SCOPED CREDENTIAL storage_credential
WITH IDENTITY = 'Managed Identity';

-- Define Data Source
CREATE EXTERNAL DATA SOURCE gold_data_source
WITH (
    TYPE = HADOOP,
    LOCATION = 'abfss://<gold-container>@<storage-account-name>.dfs.core.windows.net/',
    CREDENTIAL = storage_credential
)

-- DEFINE FORMAT
CREATE EXTERNAL FILE FORMAT ParquetFileFormat
WITH (
    FORMAT_TYPE = PARQUET
);



