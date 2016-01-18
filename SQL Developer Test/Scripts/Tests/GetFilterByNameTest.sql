PRINT N'-- Test GetFilterByName, format filters: nameFilter1=ValueFilter1;nameFilter2=ValueFilter2;'

SELECT [dbo].[GetFilterByName] ('City=Liverpool;State=NSW;Name=adr;', 'City') as Liverpool,
			[dbo].[GetFilterByName] ('City=Liverpool;State=NSW;Name=adr;', 'State') as NSW,
				[dbo].[GetFilterByName] ('City=Liverpool;State=NSW;Name=adr;', 'Name') as adr,
					[dbo].[GetFilterByName] ('City=Liverpool;State=NSW,Victoria;Name=adr;', 'State') as NSW_Victoria
