CREATE TABLE [dbo].[RoleSecureNames]
(
	[RoleSecureNameId] INT NOT NULL PRIMARY KEY IDENTITY, 
    [RoleId] INT NOT NULL, 
    [NameId] INT NOT NULL, 
    CONSTRAINT [FK_RoleSecureNames_Roles] FOREIGN KEY ([RoleId]) REFERENCES [Roles]([RoleId]),
    CONSTRAINT [FK_RoleSecureNames_Names] FOREIGN KEY ([NameId]) REFERENCES [Names]([NameId])
)
