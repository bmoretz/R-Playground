USE [Playground]

GO

SELECT
	[tsymbol],
	[ret]
FROM
	dbo.[msf]
WHERE
	[date] BETWEEN '2005-01-01' AND '2013-12-31'
	AND
	[tsymbol] IN ( 'AAPL', 'SPY' )
;