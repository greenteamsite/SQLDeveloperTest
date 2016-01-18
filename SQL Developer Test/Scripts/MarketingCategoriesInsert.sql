
IF NOT EXISTS (SELECT * FROM [dbo].[MarketingCategories])
BEGIN
	SET IDENTITY_INSERT [dbo].[MarketingCategories] ON

	INSERT INTO [dbo].[MarketingCategories] (MarketingCategoryId, [Name]) VALUES (1, N'Article marketing')
	INSERT INTO [dbo].[MarketingCategories] (MarketingCategoryId, [Name]) VALUES (2, N'Global marketing')
	INSERT INTO [dbo].[MarketingCategories] (MarketingCategoryId, [Name]) VALUES (3, N'Personalization')

	SET IDENTITY_INSERT [dbo].[MarketingCategories] OFF
END    
    
