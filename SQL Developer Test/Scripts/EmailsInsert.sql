IF NOT EXISTS (SELECT * FROM [dbo].[Emails])
BEGIN
	DECLARE @countEmails INT
	SET @countEmails = 1

	WHILE @countEmails < $(numberRows)
	BEGIN
		DECLARE @countRoleEmails INT
		SET @countRoleEmails = 1
		DECLARE @lengthRoleEmails INT
		SET @lengthRoleEmails = CAST(RAND() * 2 + 1 as INT)
		
		WHILE @countRoleEmails <= @lengthRoleEmails
		BEGIN
			INSERT INTO [dbo].[Emails] (EmailAddress, [NameId]) 
				VALUES (
					CHAR((ABS(CHECKSUM(NEWID())) % 26) + 97) + CHAR((ABS(CHECKSUM(NEWID())) % 26) + 97) + CHAR((ABS(CHECKSUM(NEWID())) % 26) + 97) + '.rep123@gmail.com'
					, @countEmails)

			SET @countRoleEmails = @countRoleEmails + 1
		END

		SET @countEmails = @countEmails +1
	END
END   