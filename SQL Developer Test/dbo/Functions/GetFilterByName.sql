-- Get the filter value string by filter name

CREATE FUNCTION [dbo].[GetFilterByName] 
(
	@Filters nvarchar(250),
	@FilterName nvarchar(50)
)
RETURNS nvarchar(250)
AS
BEGIN
	DECLARE @Result nvarchar(250)
	SET @FilterName = @FilterName + '='
	IF CHARINDEX(@FilterName, @Filters, 0) = 0
	BEGIN
		SET @Result = ''
	END
	ELSE
	BEGIN
		SET @Result = SUBSTRING(@Filters, CHARINDEX(@FilterName, @Filters, 0), CHARINDEX(';', @Filters, CHARINDEX(@FilterName, @Filters, 0)))

		SET @Result = REPLACE(SUBSTRING(@Result, CHARINDEX('=', @Result, 0) + 1, CHARINDEX(';', @Result, 0) - CHARINDEX('=', @Result, 0)), ';', '')
	END

	RETURN @Result
END