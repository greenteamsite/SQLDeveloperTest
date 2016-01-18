CREATE PROCEDURE [dbo].[GetNamesInfo]
	@AppUserId int,
	@SortDesc bit = 0,
	@IsIndividual bit = NULL,
	@Filters nvarchar(250) = '',
	@PageSize int = 2147483647,
	@PageNumber int = 1
AS
BEGIN
	SELECT n.NameId, n.Name, 
	STUFF
	(
		(
			SELECT ', ' + e.EmailAddress
			FROM dbo.Emails e
			WHERE e.NameId = n.NameId
			ORDER BY e.EmailId
			FOR XML PATH (''),TYPE
		).value('.','nvarchar(max)')
		,1,2,''
	) AS Emails,
	STUFF
	(
		(
			SELECT ', ' + p.Number
			FROM dbo.Phones p
			WHERE p.NameId = n.NameId
			ORDER BY p.PhoneId
			FOR XML PATH (''),TYPE
		).value('.','nvarchar(max)')
		,1,2,''
	) AS Phones,
	STUFF
	(
		(
			SELECT ', ' + a.City + ' (' + a.[State] +')'
			FROM dbo.Addresses a
			WHERE a.NameId = n.NameId
			ORDER BY a.AddressId
			FOR XML PATH (''),TYPE
		).value('.','nvarchar(max)')
		,1,2,''
	) AS Addresses,

	COUNT(*) OVER() AS TotalNumber
	 
	FROM dbo.Names n

	-- For secured access 
	INNER JOIN dbo.GetNameIdsByAppUserId(@AppUserId) scr
	ON scr.NameId = n.NameId

	-- a substring in the Name
	INNER JOIN (SELECT Item FROM dbo.SplitString(dbo.GetFilterByName(@Filters, 'Name'), ',')) filterNames 
	ON dbo.GetFilterByName(@Filters, 'Name') = '' OR (n.Name LIKE '%' + filterNames.Item + '%')
	
	WHERE n.IsIndividual = @IsIndividual OR @IsIndividual is NULL

	-- marketing categories assigned to the names
	And (dbo.GetFilterByName(@Filters, 'MarketingCategoryId') = ''
		OR	n.MarketingCategoryId IN (SELECT CAST(Item AS INTEGER)
            FROM dbo.SplitString(dbo.GetFilterByName(@Filters, 'MarketingCategoryId'), ','))
    )

	-- suburb(city) in an address against the name
	And (dbo.GetFilterByName(@Filters, 'City') = ''
		OR	EXISTS
				(SELECT City FROM (SELECT addr.City FROM dbo.Addresses addr WHERE addr.NameId = n.NameId) addrIn
				INNER JOIN 
				(SELECT Item FROM dbo.SplitString(dbo.GetFilterByName(@Filters, 'City'), ',')) cities
				ON addrIn.City = cities.Item)
	)
	
	-- state in an address against the name
	And (dbo.GetFilterByName(@Filters, 'State') = '' 
		OR	EXISTS
				(SELECT [State] FROM (SELECT addr.[State] FROM dbo.Addresses addr WHERE addr.NameId = n.NameId) addrIn
				INNER JOIN 
				(SELECT Item FROM dbo.SplitString(dbo.GetFilterByName(@Filters, 'State'), ',')) states
				ON addrIn.[State] = states.Item)
	 )

	ORDER BY 
		CASE WHEN @SortDesc = 1 THEN n.Name END DESC ,
        CASE WHEN ISNULL(@SortDesc, 0) <> 1 THEN n.Name END ASC	
	
		OFFSET @PageSize * (@PageNumber - 1) ROWS
		FETCH NEXT @PageSize ROWS ONLY
END