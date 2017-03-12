CREATE TABLE [dbo].[IndexConstituents]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY,
	[Index] NVARCHAR( 25 ) NOT NULL,
	[Name] NVARCHAR( 150 ) NOT NULL,
	[Ticker] NVARCHAR( 25 ),
	[Sector] NVARCHAR( 50 ),
	[Industry] NVARCHAR( 50 ),
	[LastUpdated] DATETIME DEFAULT( GETUTCDATE() )
)