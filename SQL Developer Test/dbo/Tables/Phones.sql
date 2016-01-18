CREATE TABLE [dbo].[Phones]
(
	[PhoneId] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Number] NVARCHAR(15) NULL,
	[NameId] INT NOT NULL, 
    CONSTRAINT [FK_Phones_Names] FOREIGN KEY ([NameId]) REFERENCES [Names]([NameId])
)
