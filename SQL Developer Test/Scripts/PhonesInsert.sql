IF NOT EXISTS (SELECT * FROM [dbo].[Phones])
BEGIN
	DECLARE @countPhones INT
	SET @countPhones = 1

	WHILE @countPhones < $(numberRows)
	BEGIN
		DECLARE @countRolePhones INT
		SET @countRolePhones = 1
		DECLARE @lengthRolePhones INT
		SET @lengthRolePhones = CAST(RAND() * 2 + 1 as INT)
		
		WHILE @countRolePhones <= @lengthRolePhones
		BEGIN
			INSERT INTO [dbo].[Phones] (Number, [NameId]) 
				VALUES (
					CAST(ROUND(RAND() * 90000000, 0) + 20000000 as INT)
					, @countPhones)

			SET @countRolePhones = @countRolePhones + 1
		END

		SET @countPhones = @countPhones +1
	END
END   