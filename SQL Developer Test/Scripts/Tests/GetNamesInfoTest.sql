PRINT N'-- Test GetNamesInfo procedure'

DECLARE	@return_value int

EXEC	@return_value = [dbo].[GetNamesInfo]
		@AppUserId = 1,
		@SortDesc = 0,
		@IsIndividual = 1,
		@Filters = N'City=Liverpool;State=NSW;Name=adr;',
		@PageSize = 50,
		@PageNumber = 1

SELECT	'Return Value' = @return_value

GO