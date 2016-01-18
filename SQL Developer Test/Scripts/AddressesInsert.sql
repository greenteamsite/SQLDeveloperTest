IF NOT EXISTS (SELECT * FROM [dbo].[Addresses])
BEGIN
	DECLARE @countAddresses INT
	SET @countAddresses = 1

	WHILE @countAddresses < $(numberRows)
	BEGIN
		DECLARE @countRoleAddresses INT
		SET @countRoleAddresses = 1
		DECLARE @lengthRoleAddresses INT
		SET @lengthRoleAddresses = CAST(RAND() * 2 + 1 as INT)
		
		DECLARE @randNum int
		DECLARE @state NVARCHAR(25)
		DECLARE @city NVARCHAR(25)

		SET @randNum = CAST(RAND() * 5 + 1 as INT)

		SET @state = CASE @randNum
			WHEN 1 THEN 'NSW'
			WHEN 2 THEN 'NSW'
			WHEN 3 THEN 'Victoria'
			WHEN 4 THEN 'Queensland'
			ELSE 'Western Australia'
        END

		SET @city = CASE @randNum
			WHEN 1 THEN 'Sydney'
			WHEN 2 THEN 'Liverpool'
			WHEN 3 THEN 'Melbourne'
			WHEN 4 THEN 'Brisbane'
			ELSE 'Perth'
        END

		WHILE @countRoleAddresses <= @lengthRoleAddresses
		BEGIN
			
			INSERT INTO [dbo].[Addresses] ([Street], [City], [State], [PostalCode], [NameId]) 
				VALUES (
					'12 Some ' + CHAR((ABS(CHECKSUM(NEWID())) % 26) + 97) + CHAR((ABS(CHECKSUM(NEWID())) % 26) + 97) +' St.',
					@city,
					@state,
					'1234'
					, @countAddresses)

			SET @countRoleAddresses = @countRoleAddresses + 1
		END

		SET @countAddresses = @countAddresses +1
	END
END   