    
IF NOT EXISTS (SELECT * FROM [dbo].[AppUsersRoles])
BEGIN
	DECLARE @countAppUsersRoles INT
	SET @countAppUsersRoles = 1

	WHILE @countAppUsersRoles <= 20
	BEGIN
		DECLARE @countRoleAppUsersRoles INT
		SET @countRoleAppUsersRoles = 1
		DECLARE @lengthRoleAppUsersRoles INT
		SET @lengthRoleAppUsersRoles = CAST(RAND() * 2 + 1 as INT)
		
		WHILE @countRoleAppUsersRoles <= @lengthRoleAppUsersRoles
		BEGIN
			INSERT INTO [dbo].[AppUsersRoles] ([AppUserId], [RoleId]) 
				VALUES (
					@countAppUsersRoles,
					CAST(RAND() * 5 + 1 as INT))

			SET @countRoleAppUsersRoles = @countRoleAppUsersRoles + 1
		END

		SET @countAppUsersRoles = @countAppUsersRoles +1
	END
END   
