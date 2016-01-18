PRINT N'-- Test GetNameIdsByAppUserId'
PRINT N'-- Admin role - all names, another role - not all'

DECLARE @admin int
DECLARE @user int

SELECT TOP 1 @admin = ar.AppUserId FROM AppUsersRoles ar WHERE ar.RoleId = 1
SELECT TOP 1 @user = ar.AppUserId FROM AppUsersRoles ar WHERE ar.RoleId = 2

SELECT TOP 20 NameId FROM [dbo].[GetNameIdsByAppUserId] (@admin)
ORDER BY NameId

SELECT TOP 20 NameId FROM [dbo].[GetNameIdsByAppUserId] (@user)
ORDER BY NameId
