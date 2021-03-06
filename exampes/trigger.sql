DELIMITER //

create or alter trigger TRIGGERA_NAME for TABLE_NAME
	active after insert position 0
AS
BEGIN
 UPDATE TABLE_NAME SET CLIENT_NR  = 
	((select MAX(CAST(CLIENT_NR AS INTEGER)) from TABLE_NAME  WHERE CLIENT_NR != '') + 1) 
 WHERE OSO_AD_ID = 
	(SELECT GEN_ID( SEQUENCE_FOR_TABLE, 0) FROM RDB$DATABASE);
END

