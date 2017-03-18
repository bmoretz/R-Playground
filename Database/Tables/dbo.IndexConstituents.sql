CREATE TABLE [dbo].[IndexConstituents]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[Index] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Name] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Ticker] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Sector] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Industry] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastUpdated] [datetime] NULL CONSTRAINT [DF__IndexCons__LastU__239E4DCF] DEFAULT (getutcdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[IndexConstituents] ADD CONSTRAINT [PK__IndexCon__3214EC072B710D78] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
