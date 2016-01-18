
IF NOT EXISTS (SELECT * FROM [dbo].[Names])
BEGIN
	SET IDENTITY_INSERT [dbo].[Names] ON

	DECLARE @count INT
	SET @count = 1

	WHILE @count < $(numberRows)
	BEGIN
		DECLARE @tempName VARCHAR(150)
		SET @tempName = ''
		DECLARE @countName INT
		SET @countName = 1

		DECLARE @lengthName INT
		SET @lengthName = CAST(RAND() * 10 + 5 as INT)

		WHILE @countName < @lengthName
			BEGIN
				SET @tempName = @tempName + CHAR((ABS(CHECKSUM(NEWID())) % 26) + 97) + CHAR((ABS(CHECKSUM(NEWID())) % 26) + 97)
				SET @countName = @countName + 1
			END  

		INSERT INTO dbo.[Names] ([NameId], [Name], [ACN], [ABN], [IsIndividual], [MarketingCategoryId])
			SELECT @count [NameId],
					 @tempName [Name],	
					CAST(ROUND(RAND() * 900000000, 0) + 100000000 as INT) [ACN],
					CAST(ROUND(RAND() * 900000000,0) + 100000000 as INT) [ABN],
					CONVERT(bit, ROUND(1*RAND(),0)) [IsIndividual],
					CAST(RAND() * 3 + 1 as INT)
		
		SET @count = @count + 1
	END

	SET IDENTITY_INSERT [dbo].[Names] OFF
END    
