
IF NOT EXISTS (SELECT * FROM [dbo].[AppUsers])
BEGIN
	SET IDENTITY_INSERT [dbo].[AppUsers] ON

	INSERT INTO [dbo].[AppUsers] ([AppUserId], [Name]) VALUES (1, N'Katerine Aultman')
	INSERT INTO [dbo].[AppUsers] ([AppUserId], [Name]) VALUES (2, N'Fred Robin')
	INSERT INTO [dbo].[AppUsers] ([AppUserId], [Name]) VALUES (3, N'Elfreda Aday')
	INSERT INTO [dbo].[AppUsers] ([AppUserId], [Name]) VALUES (4, N'Alicia Delee')
	INSERT INTO [dbo].[AppUsers] ([AppUserId], [Name]) VALUES (5, N'Gregg Ashmore')
	INSERT INTO [dbo].[AppUsers] ([AppUserId], [Name]) VALUES (6, N'Vicente Garth')
	INSERT INTO [dbo].[AppUsers] ([AppUserId], [Name]) VALUES (7, N'Particia Conner')
	INSERT INTO [dbo].[AppUsers] ([AppUserId], [Name]) VALUES (8, N'Micha Bunt')
	INSERT INTO [dbo].[AppUsers] ([AppUserId], [Name]) VALUES (9, N'Angeles Burrier')
	INSERT INTO [dbo].[AppUsers] ([AppUserId], [Name]) VALUES (10, N'Mimi Westervelt')
	INSERT INTO [dbo].[AppUsers] ([AppUserId], [Name]) VALUES (11, N'Emily Hockman')
	INSERT INTO [dbo].[AppUsers] ([AppUserId], [Name]) VALUES (12, N'Mason Kersten')
	INSERT INTO [dbo].[AppUsers] ([AppUserId], [Name]) VALUES (13, N'Millie Byrnes')
	INSERT INTO [dbo].[AppUsers] ([AppUserId], [Name]) VALUES (14, N'Hermine Kissane')
	INSERT INTO [dbo].[AppUsers] ([AppUserId], [Name]) VALUES (15, N'Lavinia Quincy')
	INSERT INTO [dbo].[AppUsers] ([AppUserId], [Name]) VALUES (16, N'Alba Langsam')
	INSERT INTO [dbo].[AppUsers] ([AppUserId], [Name]) VALUES (17, N'Nieves Guida')
	INSERT INTO [dbo].[AppUsers] ([AppUserId], [Name]) VALUES (18, N'Loren Hackler')
	INSERT INTO [dbo].[AppUsers] ([AppUserId], [Name]) VALUES (19, N'Lonnie Ploof')
	INSERT INTO [dbo].[AppUsers] ([AppUserId], [Name]) VALUES (20, N'Sang Etheridge')

	SET IDENTITY_INSERT [dbo].[AppUsers] OFF
END 
