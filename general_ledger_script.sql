USE [RTCC_GL2014]
GO
/****** Object:  Table [dbo].[GL_ACCOUNT_CLASS]    Script Date: 5/24/2019 11:49:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GL_ACCOUNT_CLASS](
	[acct_class] [smallint] NOT NULL,
	[acct_class_desc] [varchar](50) NULL,
	[acct_no_prefix] [varchar](2) NULL,
 CONSTRAINT [PK_GL_ACCOUNT_CLASS] PRIMARY KEY CLUSTERED 
(
	[acct_class] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GL_ACCOUNT_TYPE]    Script Date: 5/24/2019 11:49:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GL_ACCOUNT_TYPE](
	[acct_type] [char](1) NOT NULL,
	[acct_type_desc] [varchar](50) NULL,
 CONSTRAINT [PK_GL_ACCOUNT_TYPE] PRIMARY KEY CLUSTERED 
(
	[acct_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GL_ACCOUNTING_PERIOD]    Script Date: 5/24/2019 11:49:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GL_ACCOUNTING_PERIOD](
	[fin_yr] [smallint] NOT NULL,
	[acct_month] [smallint] NOT NULL,
	[close_flag] [char](1) NOT NULL,
	[active_flag] [char](1) NOT NULL,
	[updated_by] [varchar](20) NULL,
	[updated_on] [datetime] NULL,
 CONSTRAINT [PK_GL_ACCOUNTING_PERIOD] PRIMARY KEY CLUSTERED 
(
	[fin_yr] ASC,
	[acct_month] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GL_CASH_JRNL]    Script Date: 5/24/2019 11:49:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GL_CASH_JRNL](
	[fin_yr] [smallint] NOT NULL,
	[jrnl_id] [int] NOT NULL,
	[ledger_month] [smallint] NOT NULL,
	[total_dr_amt] [money] NOT NULL,
	[total_cr_amt] [money] NOT NULL,
	[txn_type] [varchar](20) NULL,
	[txn_no] [varchar](10) NULL,
	[txn_date] [datetime] NULL,
	[jrnl_remarks] [varchar](100) NULL,
	[close_flag] [char](1) NULL,
	[updated_by] [varchar](20) NULL,
	[updated_on] [datetime] NULL,
	[old_fin_yr] [smallint] NULL,
	[old_jrnl_id] [int] NULL,
	[old_txn_date] [datetime] NULL,
 CONSTRAINT [PK_GL_CASH_JRNL] PRIMARY KEY CLUSTERED 
(
	[fin_yr] ASC,
	[jrnl_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GL_CASH_JRNL_DTL]    Script Date: 5/24/2019 11:49:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GL_CASH_JRNL_DTL](
	[fin_yr] [smallint] NOT NULL,
	[jrnl_id] [int] NOT NULL,
	[jrnl_dtl_id] [smallint] NOT NULL,
	[dr_acct_no] [varchar](10) NULL,
	[dr_amt] [money] NULL,
	[cr_acct_no] [varchar](10) NULL,
	[cr_amt] [money] NULL,
	[old_fin_yr] [smallint] NULL,
	[old_jrnl_id] [int] NULL,
 CONSTRAINT [PK_GL_CASH_JRNL_DTL] PRIMARY KEY CLUSTERED 
(
	[fin_yr] ASC,
	[jrnl_id] ASC,
	[jrnl_dtl_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GL_CHART_OF_ACCOUNT]    Script Date: 5/24/2019 11:49:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GL_CHART_OF_ACCOUNT](
	[fin_yr] [smallint] NOT NULL,
	[acct_no] [varchar](10) NOT NULL,
	[acct_nm] [varchar](100) NOT NULL,
	[acct_class] [smallint] NOT NULL,
	[acct_type] [char](1) NOT NULL,
	[header_acct_no] [varchar](10) NULL,
	[acct_lvl] [smallint] NULL,
	[dr_amt] [money] NULL,
	[cr_amt] [money] NULL,
	[updated_by] [varchar](20) NULL,
	[updated_on] [datetime] NULL,
 CONSTRAINT [PK_GL_CHART_OF_ACCOUNT] PRIMARY KEY CLUSTERED 
(
	[fin_yr] ASC,
	[acct_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GL_CHART_OF_ACCOUNT2]    Script Date: 5/24/2019 11:49:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GL_CHART_OF_ACCOUNT2](
	[fin_yr] [smallint] NOT NULL,
	[acct_no] [varchar](10) NOT NULL,
	[acct_nm] [varchar](100) NOT NULL,
	[acct_class] [smallint] NOT NULL,
	[acct_type] [char](1) NOT NULL,
	[header_acct_no] [varchar](10) NULL,
	[acct_lvl] [smallint] NULL,
	[dr_amt] [money] NULL,
	[cr_amt] [money] NULL,
	[updated_by] [varchar](20) NULL,
	[updated_on] [datetime] NULL,
 CONSTRAINT [PK_GL_CHART_OF_ACCOUNT2] PRIMARY KEY CLUSTERED 
(
	[fin_yr] ASC,
	[acct_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GL_DEFAULT_ACCOUNT]    Script Date: 5/24/2019 11:49:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GL_DEFAULT_ACCOUNT](
	[default_id] [int] NOT NULL,
	[default_desc] [varchar](300) NOT NULL,
	[acct_no] [varchar](10) NOT NULL,
	[updated_by] [varchar](20) NULL,
	[updated_on] [datetime] NULL,
 CONSTRAINT [PK_GL_DEFAULT_ACCOUNT] PRIMARY KEY CLUSTERED 
(
	[default_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GL_FINANCIAL_YEAR]    Script Date: 5/24/2019 11:49:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GL_FINANCIAL_YEAR](
	[fin_yr] [smallint] NOT NULL,
	[close_flag] [char](1) NOT NULL,
	[active_flag] [char](1) NOT NULL,
	[updated_by] [varchar](20) NULL,
	[updated_on] [datetime] NULL,
 CONSTRAINT [PK_GL_FINANCIAL_YEAR] PRIMARY KEY CLUSTERED 
(
	[fin_yr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GL_GENERAL_JRNL]    Script Date: 5/24/2019 11:49:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GL_GENERAL_JRNL](
	[fin_yr] [smallint] NOT NULL,
	[jrnl_id] [int] NOT NULL,
	[ledger_month] [smallint] NOT NULL,
	[total_dr_amt] [money] NOT NULL,
	[total_cr_amt] [money] NOT NULL,
	[txn_type] [varchar](20) NULL,
	[txn_no] [varchar](10) NULL,
	[txn_date] [datetime] NULL,
	[jrnl_remarks] [varchar](100) NULL,
	[close_flag] [char](1) NULL,
	[updated_by] [varchar](20) NULL,
	[updated_on] [datetime] NULL,
	[old_fin_yr] [smallint] NULL,
	[old_jrnl_id] [int] NULL,
	[old_txn_date] [datetime] NULL,
 CONSTRAINT [PK_GL_GENERAL_JRNL] PRIMARY KEY CLUSTERED 
(
	[fin_yr] ASC,
	[jrnl_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GL_GENERAL_JRNL_DTL]    Script Date: 5/24/2019 11:49:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GL_GENERAL_JRNL_DTL](
	[fin_yr] [smallint] NOT NULL,
	[jrnl_id] [int] NOT NULL,
	[jrnl_dtl_id] [smallint] NOT NULL,
	[dr_acct_no] [varchar](10) NULL,
	[dr_amt] [money] NULL,
	[cr_acct_no] [varchar](10) NULL,
	[cr_amt] [money] NULL,
	[old_fin_yr] [smallint] NULL,
	[old_jrnl_id] [int] NULL,
 CONSTRAINT [PK_GL_GENERAL_JRNL_DTL] PRIMARY KEY CLUSTERED 
(
	[fin_yr] ASC,
	[jrnl_id] ASC,
	[jrnl_dtl_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GL_LEDGER]    Script Date: 5/24/2019 11:49:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GL_LEDGER](
	[fin_yr] [smallint] NOT NULL,
	[ledger_month] [smallint] NOT NULL,
	[acct_no] [varchar](10) NOT NULL,
	[dr_amt] [money] NOT NULL,
	[cr_amt] [money] NOT NULL,
	[total_amt] [money] NOT NULL,
 CONSTRAINT [PK_GL_LEDGER] PRIMARY KEY CLUSTERED 
(
	[fin_yr] ASC,
	[ledger_month] ASC,
	[acct_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GL_PURCHASE_JRNL]    Script Date: 5/24/2019 11:49:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GL_PURCHASE_JRNL](
	[fin_yr] [smallint] NOT NULL,
	[jrnl_id] [int] NOT NULL,
	[ledger_month] [smallint] NOT NULL,
	[total_dr_amt] [money] NOT NULL,
	[total_cr_amt] [money] NOT NULL,
	[txn_type] [varchar](20) NULL,
	[txn_no] [varchar](10) NULL,
	[txn_date] [datetime] NULL,
	[jrnl_remarks] [varchar](100) NULL,
	[close_flag] [char](1) NULL,
	[updated_by] [varchar](20) NULL,
	[updated_on] [datetime] NULL,
	[old_fin_yr] [int] NULL,
	[old_jrnl_id] [int] NULL,
	[old_txn_date] [datetime] NULL,
 CONSTRAINT [PK_GL_PURCHASE_JRNL] PRIMARY KEY CLUSTERED 
(
	[fin_yr] ASC,
	[jrnl_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GL_PURCHASE_JRNL_DTL]    Script Date: 5/24/2019 11:49:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GL_PURCHASE_JRNL_DTL](
	[fin_yr] [smallint] NOT NULL,
	[jrnl_id] [int] NOT NULL,
	[jrnl_dtl_id] [smallint] NOT NULL,
	[dr_acct_no] [varchar](10) NULL,
	[dr_amt] [money] NULL,
	[cr_acct_no] [varchar](10) NULL,
	[cr_amt] [money] NULL,
 CONSTRAINT [PK_GL_PURCHASE_JRNL_DTL] PRIMARY KEY CLUSTERED 
(
	[fin_yr] ASC,
	[jrnl_id] ASC,
	[jrnl_dtl_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GL_SALES_JRNL]    Script Date: 5/24/2019 11:49:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GL_SALES_JRNL](
	[fin_yr] [smallint] NOT NULL,
	[jrnl_id] [int] NOT NULL,
	[ledger_month] [smallint] NOT NULL,
	[total_dr_amt] [money] NOT NULL,
	[total_cr_amt] [money] NOT NULL,
	[txn_type] [varchar](20) NULL,
	[txn_no] [varchar](10) NULL,
	[txn_date] [datetime] NULL,
	[jrnl_remarks] [varchar](100) NULL,
	[close_flag] [char](1) NULL,
	[updated_by] [varchar](20) NULL,
	[updated_on] [datetime] NULL,
	[old_fin_yr] [int] NULL,
	[old_jrnl_id] [int] NULL,
	[old_txn_date] [datetime] NULL,
 CONSTRAINT [PK_GL_SALES_JRNL] PRIMARY KEY CLUSTERED 
(
	[fin_yr] ASC,
	[jrnl_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[gl_sales_jrnl_del]    Script Date: 5/24/2019 11:49:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[gl_sales_jrnl_del](
	[fin_yr] [float] NULL,
	[jrnl_id] [float] NULL,
	[total_dr_amt] [float] NULL,
	[total_cr_amt] [float] NULL,
	[txn_type] [nvarchar](255) NULL,
	[txn_no] [nvarchar](255) NULL,
	[jrnl_remarks] [nvarchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GL_SALES_JRNL_DTL]    Script Date: 5/24/2019 11:49:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GL_SALES_JRNL_DTL](
	[fin_yr] [smallint] NOT NULL,
	[jrnl_id] [int] NOT NULL,
	[jrnl_dtl_id] [smallint] NOT NULL,
	[dr_acct_no] [varchar](10) NULL,
	[dr_amt] [money] NULL,
	[cr_acct_no] [varchar](10) NULL,
	[cr_amt] [money] NULL,
 CONSTRAINT [PK_GL_SALES_JRNL_DTL] PRIMARY KEY CLUSTERED 
(
	[fin_yr] ASC,
	[jrnl_id] ASC,
	[jrnl_dtl_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GL_TRIAL_BAL_REP]    Script Date: 5/24/2019 11:49:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GL_TRIAL_BAL_REP](
	[acct_class] [smallint] NULL,
	[acct_class_desc] [varchar](100) NULL,
	[acct_no] [varchar](10) NULL,
	[acct_nm] [varchar](300) NULL,
	[acct_lvl] [smallint] NULL,
	[acct_type] [char](1) NULL,
	[header_acct_no] [varchar](10) NULL,
	[dr_amt] [money] NULL,
	[cr_amt] [money] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GL_TRIAL_BALANCE]    Script Date: 5/24/2019 11:49:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GL_TRIAL_BALANCE](
	[jrnl_id] [varchar](15) NULL,
	[acct_no] [varchar](10) NULL,
	[acct_type] [char](1) NULL,
	[dr_amt] [money] NULL,
	[cr_amt] [money] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GL_UNBALANCE_JRNL]    Script Date: 5/24/2019 11:49:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GL_UNBALANCE_JRNL](
	[fin_yr] [smallint] NOT NULL,
	[jrnl_id] [int] NOT NULL,
	[ledger_month] [smallint] NOT NULL,
	[total_dr_amt] [money] NOT NULL,
	[total_cr_amt] [money] NOT NULL,
	[txn_type] [varchar](20) NULL,
	[txn_no] [varchar](10) NULL,
	[txn_date] [datetime] NULL,
	[jrnl_remarks] [varchar](100) NULL,
	[close_flag] [char](1) NULL,
	[updated_by] [varchar](20) NULL,
	[updated_on] [datetime] NULL,
	[old_fin_yr] [smallint] NULL,
	[old_jrnl_id] [int] NULL,
	[old_txn_date] [datetime] NULL,
	[jrnl_code] [varchar](20) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SYSTEM_SETTING_GL]    Script Date: 5/24/2019 11:49:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SYSTEM_SETTING_GL](
	[from_flag] [bit] NOT NULL,
	[from_db] [varchar](100) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TEMP_JRNL]    Script Date: 5/24/2019 11:49:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TEMP_JRNL](
	[jrnl_type] [varchar](10) NULL,
	[fin_yr] [smallint] NOT NULL,
	[jrnl_id] [int] NOT NULL,
	[ledger_month] [smallint] NOT NULL,
	[total_dr_amt] [money] NOT NULL,
	[total_cr_amt] [money] NOT NULL,
	[txn_type] [varchar](20) NULL,
	[txn_no] [varchar](10) NULL,
	[txn_date] [datetime] NULL,
	[jrnl_remarks] [varchar](100) NULL,
	[close_flag] [char](1) NULL,
	[updated_by] [varchar](20) NULL,
	[updated_on] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[trial_balance_2018]    Script Date: 5/24/2019 11:49:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trial_balance_2018](
	[F1] [nvarchar](255) NULL,
	[F2] [nvarchar](255) NULL,
	[F3] [float] NULL,
	[F4] [float] NULL
) ON [PRIMARY]

GO
