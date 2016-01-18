/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

-- Setting row counts in tables
:setvar numberRows 1000000

:r ..\RolesInsert.sql
:r ..\AppUsersInsert.sql
:r ..\AppUsersRolesInsert.sql
:r ..\MarketingCategoriesInsert.sql
:r ..\NamesInsert.sql
:r ..\AddressesInsert.sql
:r ..\EmailsInsert.sql
:r ..\PhonesInsert.sql
:r ..\RoleSecureNamesInsert.sql

-- Run Test Scripts

:r ..\Tests\GetFilterByNameTest.sql
:r ..\Tests\GetNameIdsByAppUserId.sql
:r ..\Tests\SplitStringTest.sql
:r ..\Tests\GetNamesInfoTest.sql