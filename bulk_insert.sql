-- remember to change the access level of azure blob or otherwise the 
-- actions would be blocked

CREATE DATABASE SCOPED CREDENTIAL azure_blob
WITH IDENTITY = 'SHARED ACCESS SIGNATURE',
SECRET =
'some kind of secret from azure blob';

CREATE MASTER KEY
ENCRYPTION BY PASSWORD='some kind of password';

CREATE EXTERNAL DATA SOURCE your_external_data_source
WITH
(
    TYPE = BLOB_STORAGE,
    LOCATION = 'the blob url specific to container name',
    CREDENTIAL = your_scoped_credential_saved_to_sql_server
);


BULK INSERT medication
    FROM 'filename'
    WITH (FIRSTROW =2, DATA_SOURCE = 'your_external_data_source', FORMAT = 'CSV',FIRE_TRIGGERS);