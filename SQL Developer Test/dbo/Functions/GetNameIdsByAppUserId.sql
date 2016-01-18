-- Filtered by the role(s) of the user

CREATE FUNCTION [dbo].[GetNameIdsByAppUserId]
(	
	@AppUserId int
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT sn.NameId
	FROM dbo.AppUsersRoles ur
	INNER JOIN dbo.RoleSecureNames sn ON sn.RoleId = ur.RoleId OR ur.RoleId = 1
	WHERE ur.AppUserId = @AppUserId
	Group By sn.NameId
)