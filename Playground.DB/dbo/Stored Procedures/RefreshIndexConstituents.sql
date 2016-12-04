CREATE PROCEDURE [dbo].[RefreshIndexConstituents]
(
	@BbgServer NVARCHAR( 15 ),
	@ReqIndex NVARCHAR( 25 )
)
AS
BEGIN

	DECLARE @CompanyData TABLE
	(
		[Index] NVARCHAR( 25 ),
		[Name] NVARCHAR( 150 ),
		[Ticker] NVARCHAR( 25 ),
		[Sector] NVARCHAR( 50 ),
		[Industry] NVARCHAR( 50 )
	);

	INSERT INTO
		@CompanyData
	(
		[Index],
		[Ticker],
		[Name],
		[Sector],
		[Industry]
	)
	EXECUTE
		sp_execute_external_script    
		@language = N'R',
		@script=N'
			library(data.table)
			library(Rblpapi)
			
			bbgConnection <- blpConnect(host = getOption("blpHost", bbgHost),
				port = getOption("blpPort", 8194L), default = TRUE)

			metaFields <- data.table(
				"Mnemonic" = c("NAME", "GICS_SECTOR_NAME", "GICS_INDUSTRY_NAME"),
				"Name" = c("Name", "Sector", "Industry")
			)

			companies <- bds(paste(index,"Index"), "INDX_Members")

			colnames(companies) <- c("TickerCode")
			companies <- as.data.table(paste(companies$TickerCode, "Equity"))
			colnames(companies) <- c("Ticker")

			companyTags <- as.data.table(bdp(companies$Ticker, metaFields$Mnemonic), keep.rownames = TRUE)

			colnames(companyTags)[colnames(companyTags) == "rn"] <- "Ticker"
			names(companyTags) <- metaFields[match(names(companyTags), metaFields$Mnemonic)]$Name
			companyTags <- cbind(companyTags, Index = index)
			setcolorder(companyTags,c("Index","Ticker",metaFields$Name))

			OutputDataSet <- companyTags;',
		@params = N'@bbgHost NVARCHAR( 15 ), @index NVARCHAR( 25 )',
		@bbgHost = @BbgServer,
		@index = @ReqIndex
	;

	WITH [Target]
	AS
	(
		SELECT
			*
		FROM
			dbo.[IndexConstituents]
		WHERE
			[Index] = @ReqIndex
	)
	MERGE
		[Target] T
	USING
		@CompanyData S
	ON
		T.[Ticker] = S.[Ticker]
	WHEN NOT MATCHED BY SOURCE THEN
		DELETE
	WHEN NOT MATCHED BY TARGET THEN
		 INSERT( [Index], [Name], [Ticker], [Sector], [Industry] ) VALUES( S.[Index], S.[Name], S.[Ticker], S.[Sector], S.[Industry] )
	WHEN MATCHED THEN UPDATE 
		SET
			T.[Sector] = S.[Sector],
			T.[Industry] = S.[Industry],
			T.[LastUpdated] = GETUTCDATE()
	OUTPUT $action, 
		Inserted.[Ticker], Inserted.[Name], Inserted.[Sector], Inserted.[Industry],  
		Deleted.[Ticker], Deleted.[Name], Deleted.[Sector], Deleted.[Industry]
	;

END