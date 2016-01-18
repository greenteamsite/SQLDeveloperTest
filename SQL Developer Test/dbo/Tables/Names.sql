CREATE TABLE [dbo].[Names]
(
	[NameId] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Name] NVARCHAR(150) NOT NULL, 
    [ACN] NVARCHAR(9) NULL, 
    [ABN] NVARCHAR(11) NULL, 
    [IsIndividual] BIT NOT NULL, 
    [MarketingCategoryId] INT NOT NULL, 
    CONSTRAINT [FK_Names_MarketingCategories] FOREIGN KEY (MarketingCategoryId) REFERENCES MarketingCategories(MarketingCategoryId)
)
