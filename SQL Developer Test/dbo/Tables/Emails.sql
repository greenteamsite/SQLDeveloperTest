CREATE TABLE [dbo].[Emails]
(
	[EmailId] INT NOT NULL PRIMARY KEY IDENTITY, 
    [EmailAddress] NVARCHAR(150) NULL, 
    [NameId] INT NOT NULL, 
    CONSTRAINT [FK_Emails_Names] FOREIGN KEY ([NameId]) REFERENCES [Names]([NameId])
)
