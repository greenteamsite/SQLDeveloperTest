CREATE TABLE [dbo].[Addresses]
(
	[AddressId] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Street] NVARCHAR(50) NULL, 
    [City] NVARCHAR(50) NULL, 
    [State] NVARCHAR(50) NULL, 
    [PostalCode] NVARCHAR(4) NULL,
	[NameId] INT NOT NULL, 
    CONSTRAINT [FK_Addresses_ToNames] FOREIGN KEY ([NameId]) REFERENCES [Names]([NameId])

)
