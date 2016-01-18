CREATE TABLE [dbo].[AppUsersRoles]
(
	[AppUsersRoleId] INT NOT NULL PRIMARY KEY IDENTITY,

	[AppUserId] INT NOT NULL,
    [RoleId] INT NOT NULL, 
    CONSTRAINT [FK_Roles_AppUsers] FOREIGN KEY (RoleId) REFERENCES [AppUsers]([AppUserId])

)
