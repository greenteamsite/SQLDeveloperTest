
IF NOT EXISTS (SELECT * FROM [dbo].[Roles])
BEGIN
	SET IDENTITY_INSERT [dbo].[Roles] ON

	INSERT INTO [dbo].[Roles] ([RoleId], [Name]) VALUES (1, N'Administrator')
	INSERT INTO [dbo].[Roles] ([RoleId], [Name]) VALUES (2, N'Client')
	INSERT INTO [dbo].[Roles] ([RoleId], [Name]) VALUES (3, N'Manager Responsible')
	INSERT INTO [dbo].[Roles] ([RoleId], [Name]) VALUES (4, N'Acting Manager')
	INSERT INTO [dbo].[Roles] ([RoleId], [Name]) VALUES (5, N'Secretary')

	SET IDENTITY_INSERT [dbo].[Roles] OFF
END    
    
