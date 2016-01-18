IF NOT EXISTS (SELECT * FROM [dbo].[RoleSecureNames])
BEGIN
	DECLARE @countRoleSecureNames INT
	SET @countRoleSecureNames = 1

	WHILE @countRoleSecureNames < $(numberRows)
	BEGIN
		DECLARE @countRoleRoleSecureNames INT
		SET @countRoleRoleSecureNames = 1
		DECLARE @lengthRoleRoleSecureNames INT
		SET @lengthRoleRoleSecureNames = CAST(RAND() * 3 + 1 as INT)
		
		WHILE @countRoleRoleSecureNames <= @lengthRoleRoleSecureNames
		BEGIN
			INSERT INTO [dbo].[RoleSecureNames] ([RoleId], [NameId]) 
				VALUES (CAST(RAND() * 5 + 1 as INT), @countRoleSecureNames)

			SET @countRoleRoleSecureNames = @countRoleRoleSecureNames + 1
		END

		SET @countRoleSecureNames = @countRoleSecureNames +1
	END
END    