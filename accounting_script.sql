USE [RTCC2014]
GO
/****** Object:  Table [dbo].[ADMIXTURE]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ADMIXTURE](
	[admix_id] [int] NOT NULL,
	[admix_desc] [varchar](50) NULL,
	[updated_by] [varchar](20) NULL,
	[updated_on] [datetime] NULL,
 CONSTRAINT [PK_ADMIXTURE] PRIMARY KEY CLUSTERED 
(
	[admix_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ATC]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ATC](
	[atc_code] [varchar](20) NOT NULL,
	[tax_type] [varchar](20) NULL,
	[description] [varchar](255) NULL,
	[form_type] [varchar](20) NULL,
	[rate] [money] NULL,
	[f1600] [varchar](255) NULL,
	[f1600_rate] [money] NULL,
 CONSTRAINT [PK_BIR_ATC_1] PRIMARY KEY CLUSTERED 
(
	[atc_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BANK]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BANK](
	[bank_id] [smallint] NOT NULL,
	[bank_name] [varchar](100) NOT NULL,
 CONSTRAINT [PK_BANK] PRIMARY KEY CLUSTERED 
(
	[bank_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BANK_ACCOUNT]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BANK_ACCOUNT](
	[bank_acct_id] [smallint] NOT NULL,
	[bank_acct_no] [varchar](50) NOT NULL,
	[bank_acct_name] [varchar](100) NULL,
	[bank_id] [smallint] NOT NULL,
	[branch_name] [varchar](50) NOT NULL,
	[bank_acct_balance] [money] NOT NULL,
	[check_prefix] [varchar](5) NULL,
	[check_no] [int] NOT NULL,
	[check_len] [smallint] NOT NULL,
	[check_file] [varchar](100) NULL,
	[remarks] [varchar](100) NULL,
	[acct_no] [varchar](10) NULL,
	[updated_by] [varchar](20) NULL,
	[updated_on] [datetime] NULL,
 CONSTRAINT [PK_BANK_ACCOUNT] PRIMARY KEY CLUSTERED 
(
	[bank_acct_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BANK_TXN]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BANK_TXN](
	[bank_txn_no] [varchar](10) NOT NULL,
	[bank_acct_id] [smallint] NOT NULL,
	[txn_date] [datetime] NOT NULL,
	[bank_txn_type] [char](1) NOT NULL,
	[pay_mtd_type] [char](1) NOT NULL,
	[txn_amt] [money] NOT NULL,
	[run_balance] [money] NOT NULL,
	[check_no] [varchar](50) NULL,
	[source_type] [varchar](20) NULL,
	[source_no] [varchar](10) NULL,
	[source_name] [varchar](200) NULL,
	[source_date] [datetime] NULL,
	[transfer_type] [char](1) NULL,
	[remarks] [varchar](20) NULL,
	[acct_no] [varchar](10) NULL,
	[begin_flag] [char](1) NULL,
	[updated_by] [varchar](20) NULL,
	[updated_on] [datetime] NULL,
	[fin_yr] [smallint] NULL,
	[jrnl_id] [int] NULL,
	[float_flag] [char](1) NULL,
 CONSTRAINT [PK_BANK_ACCT_TXN] PRIMARY KEY CLUSTERED 
(
	[bank_txn_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BANK_TXN_TYPE]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BANK_TXN_TYPE](
	[bank_txn_type] [char](1) NOT NULL,
	[bank_txn_desc] [varchar](50) NOT NULL,
 CONSTRAINT [PK_BANK_TXN_TYPE] PRIMARY KEY CLUSTERED 
(
	[bank_txn_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CEMENT_TYPE]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CEMENT_TYPE](
	[cement_id] [int] NOT NULL,
	[cement_desc] [varchar](50) NULL,
	[updated_by] [varchar](20) NULL,
	[updated_on] [datetime] NULL,
 CONSTRAINT [PK_CEMENT_TYPE] PRIMARY KEY CLUSTERED 
(
	[cement_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CHECKS_ISSUED]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CHECKS_ISSUED](
	[check_no] [varchar](50) NOT NULL,
	[bank_acct_id] [smallint] NOT NULL,
	[check_date] [datetime] NOT NULL,
	[clear_date] [datetime] NOT NULL,
	[check_status] [char](1) NOT NULL,
	[check_amt] [money] NOT NULL,
	[cust_id] [int] NULL,
	[supp_id] [int] NULL,
	[remarks] [varchar](100) NULL,
 CONSTRAINT [PK_CHECKS_ISSUED] PRIMARY KEY CLUSTERED 
(
	[check_no] ASC,
	[bank_acct_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CHECKS_RECEIVED]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CHECKS_RECEIVED](
	[check_no] [varchar](50) NOT NULL,
	[bank_id] [smallint] NOT NULL,
	[check_date] [datetime] NOT NULL,
	[clear_date] [datetime] NOT NULL,
	[check_status] [char](1) NOT NULL,
	[check_amt] [money] NOT NULL,
	[cust_id] [int] NULL,
	[supp_id] [int] NULL,
	[remarks] [varchar](100) NULL,
 CONSTRAINT [PK_CHECKS_RECEIVED] PRIMARY KEY CLUSTERED 
(
	[check_no] ASC,
	[bank_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CHECKS_STATUS]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CHECKS_STATUS](
	[check_status] [char](1) NOT NULL,
	[check_status_desc] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CHECKS_STATUS] PRIMARY KEY CLUSTERED 
(
	[check_status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[COLLECTION]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[COLLECTION](
	[coll_no] [varchar](10) NOT NULL,
	[cust_id] [int] NOT NULL,
	[coll_date] [datetime] NOT NULL,
	[coll_status] [char](1) NOT NULL,
	[pay_tot_amt] [money] NOT NULL,
	[cm_tot_amt] [money] NOT NULL,
	[disc_tot_amt] [money] NOT NULL,
	[or_no] [varchar](20) NULL,
	[remarks] [varchar](300) NULL,
	[updated_by] [varchar](20) NULL,
	[updated_on] [datetime] NULL,
	[deposit_flag] [bit] NULL,
	[deposit_post_flag] [bit] NULL,
	[coll_type] [char](1) NOT NULL,
	[vat_amt] [money] NULL,
 CONSTRAINT [PK_COLLECTION] PRIMARY KEY CLUSTERED 
(
	[coll_no] ASC,
	[coll_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[COLLECTION_BILL_DTL]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[COLLECTION_BILL_DTL](
	[coll_no] [varchar](10) NOT NULL,
	[txn_type] [varchar](20) NOT NULL,
	[txn_no] [varchar](10) NOT NULL,
	[pay_amt] [money] NOT NULL,
	[cm_amt] [money] NOT NULL,
	[disc_amt] [money] NOT NULL,
	[coll_type] [char](1) NOT NULL,
 CONSTRAINT [PK_COLLECTION_BILL_DTL] PRIMARY KEY CLUSTERED 
(
	[coll_no] ASC,
	[coll_type] ASC,
	[txn_type] ASC,
	[txn_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[COLLECTION_CM_DTL]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[COLLECTION_CM_DTL](
	[coll_no] [varchar](10) NOT NULL,
	[cm_no] [varchar](10) NOT NULL,
	[cm_amt] [money] NOT NULL,
	[fin_yr] [smallint] NULL,
	[jrnl_id] [int] NULL,
	[coll_type] [char](1) NOT NULL,
 CONSTRAINT [PK_COLLECTION_CM_DTL] PRIMARY KEY CLUSTERED 
(
	[coll_no] ASC,
	[coll_type] ASC,
	[cm_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[COLLECTION_PAYMENT_DTL]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[COLLECTION_PAYMENT_DTL](
	[coll_no] [varchar](10) NOT NULL,
	[pay_dtl_id] [smallint] NOT NULL,
	[pay_mtd_type] [char](1) NOT NULL,
	[pay_amt] [money] NOT NULL,
	[bank_acct_id] [smallint] NOT NULL,
	[check_no] [varchar](50) NULL,
	[bank_id] [smallint] NULL,
	[coll_type] [char](1) NOT NULL,
 CONSTRAINT [PK_COLLECTION_PAYMENT_DTL] PRIMARY KEY CLUSTERED 
(
	[coll_no] ASC,
	[coll_type] ASC,
	[pay_dtl_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[COLLECTION_STATUS]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[COLLECTION_STATUS](
	[coll_status] [char](1) NOT NULL,
	[coll_status_desc] [varchar](50) NOT NULL,
 CONSTRAINT [PK_COLLECTION_STATUS] PRIMARY KEY CLUSTERED 
(
	[coll_status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[COLLECTION_TYPE]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[COLLECTION_TYPE](
	[coll_type] [char](1) NOT NULL,
	[coll_type_desc] [varchar](50) NOT NULL,
 CONSTRAINT [PK_COLLECTION_TYPE] PRIMARY KEY CLUSTERED 
(
	[coll_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[COMPANY_INFO]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[COMPANY_INFO](
	[cmpy_code] [varchar](20) NULL,
	[cmpy_name] [varchar](100) NULL,
	[cmpy_addr] [varchar](200) NULL,
	[cmpy_tel_no1] [varchar](50) NULL,
	[cmpy_tel_no2] [varchar](50) NULL,
	[cmpy_tin_no] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CONSTRUCTION]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CONSTRUCTION](
	[cons_id] [int] NOT NULL,
	[cons_code] [varchar](50) NOT NULL,
	[cons_desc] [varchar](100) NULL,
	[cons_loc] [varchar](100) NULL,
	[acct_no] [varchar](10) NULL,
 CONSTRAINT [PK_CONSTRUCTION] PRIMARY KEY CLUSTERED 
(
	[cons_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CREDIT_MEMO]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CREDIT_MEMO](
	[cm_no] [varchar](10) NOT NULL,
	[cust_id] [int] NULL,
	[supp_id] [int] NULL,
	[cm_date] [datetime] NOT NULL,
	[cm_status] [char](1) NOT NULL,
	[cm_amt] [money] NOT NULL,
	[cm_post_amt] [money] NOT NULL,
	[source_type] [varchar](50) NULL,
	[source_no] [varchar](10) NULL,
	[remarks] [varchar](100) NULL,
	[begin_flag] [char](1) NULL,
	[post_flag] [char](1) NULL,
	[updated_by] [varchar](20) NULL,
	[updated_on] [datetime] NULL,
	[fin_yr] [smallint] NULL,
	[jrnl_id] [int] NULL,
	[ewtax_flag] [bit] NULL,
	[ewtax_percent] [money] NULL,
	[ewtax_amount] [money] NULL,
 CONSTRAINT [PK_CREDIT_MEMO] PRIMARY KEY CLUSTERED 
(
	[cm_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CREDIT_MEMO_DTL]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CREDIT_MEMO_DTL](
	[cm_no] [varchar](10) NOT NULL,
	[acct_no] [varchar](10) NOT NULL,
	[dtl_amt] [money] NOT NULL,
 CONSTRAINT [PK_CREDIT_MEMO_DTL] PRIMARY KEY CLUSTERED 
(
	[cm_no] ASC,
	[acct_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CREDIT_MEMO_STATUS]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CREDIT_MEMO_STATUS](
	[cm_status] [char](1) NOT NULL,
	[cm_status_desc] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CREDIT_MEMO_STATUS] PRIMARY KEY CLUSTERED 
(
	[cm_status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CUSTOMER]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CUSTOMER](
	[cust_id] [int] NOT NULL,
	[cust_code] [varchar](30) NOT NULL,
	[cust_name] [varchar](100) NOT NULL,
	[active_flag] [char](1) NOT NULL,
	[cust_grp] [varchar](50) NULL,
	[term_code] [varchar](30) NOT NULL,
	[agent_id] [smallint] NULL,
	[area_id] [smallint] NULL,
	[cust_address] [varchar](200) NULL,
	[cust_tel1] [varchar](50) NULL,
	[cust_tel2] [varchar](50) NULL,
	[head_name] [varchar](100) NULL,
	[head_remarks] [varchar](100) NULL,
	[contact_name] [varchar](100) NULL,
	[contact_remarks] [varchar](100) NULL,
	[acct_no] [varchar](10) NULL,
	[cust_tin] [varchar](50) NULL,
	[updated_by] [varchar](20) NULL,
	[updated_on] [datetime] NULL,
	[vat_type_id] [int] NULL,
	[credit_limit] [money] NULL,
 CONSTRAINT [PK_CUSTOMER] PRIMARY KEY CLUSTERED 
(
	[cust_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CUSTOMER_AGENT]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CUSTOMER_AGENT](
	[agent_id] [smallint] NOT NULL,
	[agent_code] [varchar](30) NOT NULL,
	[agent_name] [varchar](100) NOT NULL,
 CONSTRAINT [PK_CUSTOMER_AGENT] PRIMARY KEY CLUSTERED 
(
	[agent_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CUSTOMER_AREA]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CUSTOMER_AREA](
	[area_id] [smallint] NOT NULL,
	[area_code] [varchar](30) NOT NULL,
	[area_desc] [varchar](100) NOT NULL,
 CONSTRAINT [PK_CUSTOMER_AREA] PRIMARY KEY CLUSTERED 
(
	[area_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CUSTOMER_BALANCE]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CUSTOMER_BALANCE](
	[cust_id] [int] NOT NULL,
	[cust_balance] [money] NOT NULL,
 CONSTRAINT [PK_CUSTOMER_BALANCE] PRIMARY KEY CLUSTERED 
(
	[cust_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CUSTOMER_BALANCE_HISTORY]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CUSTOMER_BALANCE_HISTORY](
	[cust_id] [int] NOT NULL,
	[hist_date] [datetime] NOT NULL,
	[txn_type] [varchar](20) NOT NULL,
	[txn_no] [varchar](10) NOT NULL,
	[txn_date] [datetime] NOT NULL,
	[txn_amt] [money] NOT NULL,
	[run_balance] [money] NOT NULL,
	[remarks] [varchar](100) NULL,
	[ref_1] [varchar](100) NULL,
	[ref_2] [varchar](100) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CUSTOMER_ITEM_HISTORY]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CUSTOMER_ITEM_HISTORY](
	[cust_id] [int] NOT NULL,
	[item_id] [int] NOT NULL,
	[txn_type] [varchar](20) NOT NULL,
	[txn_no] [varchar](10) NOT NULL,
	[txn_dtl_id] [int] NOT NULL,
	[txn_date] [datetime] NULL,
	[txn_qty] [money] NULL,
	[unit_code] [varchar](10) NULL,
	[unit_price] [money] NULL,
	[net_price] [money] NULL,
	[txn_amt] [money] NULL,
	[tax_type] [char](1) NULL,
	[batch_id] [int] NULL,
	[updated_by] [varchar](20) NULL,
	[updated_on] [datetime] NULL,
 CONSTRAINT [PK_CUSTOMER_ITEM_HISTORY] PRIMARY KEY CLUSTERED 
(
	[cust_id] ASC,
	[item_id] ASC,
	[txn_type] ASC,
	[txn_no] ASC,
	[txn_dtl_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CUSTOMER_REPACKED_ITEMS]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CUSTOMER_REPACKED_ITEMS](
	[cust_id] [int] NOT NULL,
	[item_id] [int] NOT NULL,
	[unit_code] [varchar](10) NOT NULL,
	[rpk_price] [money] NOT NULL,
	[labor_cost] [money] NOT NULL,
	[pack_cost] [money] NOT NULL,
 CONSTRAINT [PK_CUSTOMER_REPACKED_ITEMS] PRIMARY KEY CLUSTERED 
(
	[cust_id] ASC,
	[item_id] ASC,
	[unit_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CUSTOMER_VAT_TYPE]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CUSTOMER_VAT_TYPE](
	[vat_type_id] [int] NULL,
	[vat_type_desc] [varchar](30) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DEBIT_MEMO]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DEBIT_MEMO](
	[dm_no] [varchar](10) NOT NULL,
	[cust_id] [int] NULL,
	[supp_id] [int] NULL,
	[dm_date] [datetime] NOT NULL,
	[dm_status] [char](1) NOT NULL,
	[dm_amt] [money] NOT NULL,
	[dm_post_amt] [money] NOT NULL,
	[source_type] [varchar](50) NULL,
	[source_no] [varchar](10) NULL,
	[remarks] [varchar](100) NULL,
	[begin_flag] [char](1) NULL,
	[post_flag] [char](1) NULL,
	[updated_by] [varchar](20) NULL,
	[updated_on] [datetime] NULL,
	[fin_yr] [smallint] NULL,
	[jrnl_id] [int] NULL,
 CONSTRAINT [PK_DEBIT_MEMO] PRIMARY KEY CLUSTERED 
(
	[dm_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DEBIT_MEMO_DTL]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DEBIT_MEMO_DTL](
	[dm_no] [varchar](10) NOT NULL,
	[acct_no] [varchar](10) NOT NULL,
	[dtl_amt] [money] NULL,
 CONSTRAINT [PK_DEBIT_MEMO_DTL] PRIMARY KEY CLUSTERED 
(
	[dm_no] ASC,
	[acct_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DEBIT_MEMO_STATUS]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DEBIT_MEMO_STATUS](
	[dm_status] [char](1) NOT NULL,
	[dm_status_desc] [varchar](50) NOT NULL,
 CONSTRAINT [PK_DEBIT_MEMO_STATUS] PRIMARY KEY CLUSTERED 
(
	[dm_status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DISBURSEMENT]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DISBURSEMENT](
	[disb_type] [char](1) NOT NULL,
	[disb_no] [varchar](10) NOT NULL,
	[supp_id] [int] NOT NULL,
	[disb_date] [datetime] NOT NULL,
	[disb_status] [char](1) NOT NULL,
	[pay_tot_amt] [money] NOT NULL,
	[dm_tot_amt] [money] NOT NULL,
	[disc_tot_amt] [money] NOT NULL,
	[remarks] [varchar](max) NULL,
	[updated_by] [varchar](20) NULL,
	[updated_on] [datetime] NULL,
	[deposit_flag] [bit] NULL,
	[deposit_post_flag] [bit] NULL,
 CONSTRAINT [PK_DISBURSEMENT] PRIMARY KEY CLUSTERED 
(
	[disb_type] ASC,
	[disb_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DISBURSEMENT_BATCH]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DISBURSEMENT_BATCH](
	[disb_batch_no] [varchar](10) NOT NULL,
	[disb_batch_date] [datetime] NOT NULL,
	[remarks] [varchar](max) NULL,
	[updated_by] [varchar](20) NULL,
	[updated_on] [datetime] NULL,
 CONSTRAINT [PK_DISBURSEMENT_BATCH] PRIMARY KEY CLUSTERED 
(
	[disb_batch_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DISBURSEMENT_BATCH_DTL]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DISBURSEMENT_BATCH_DTL](
	[disb_batch_no] [varchar](10) NOT NULL,
	[disb_type] [char](1) NOT NULL,
	[disb_no] [varchar](10) NOT NULL,
 CONSTRAINT [PK_DISBURSEMENT_BATCH_DTL_1] PRIMARY KEY CLUSTERED 
(
	[disb_batch_no] ASC,
	[disb_type] ASC,
	[disb_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DISBURSEMENT_BILL_DTL]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DISBURSEMENT_BILL_DTL](
	[disb_type] [char](1) NOT NULL,
	[disb_no] [varchar](10) NOT NULL,
	[txn_type] [varchar](20) NOT NULL,
	[txn_no] [varchar](10) NOT NULL,
	[pay_amt] [money] NOT NULL,
	[dm_amt] [money] NOT NULL,
	[disc_amt] [money] NOT NULL,
 CONSTRAINT [PK_DISBURSEMENT_BILL_DTL] PRIMARY KEY CLUSTERED 
(
	[disb_type] ASC,
	[disb_no] ASC,
	[txn_type] ASC,
	[txn_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DISBURSEMENT_DM_DTL]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DISBURSEMENT_DM_DTL](
	[disb_type] [char](1) NOT NULL,
	[disb_no] [varchar](10) NOT NULL,
	[dm_no] [varchar](10) NOT NULL,
	[dm_amt] [money] NOT NULL,
	[fin_yr] [smallint] NULL,
	[jrnl_id] [int] NULL,
 CONSTRAINT [PK_DISBURSEMENT_DM_DTL] PRIMARY KEY CLUSTERED 
(
	[disb_type] ASC,
	[disb_no] ASC,
	[dm_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DISBURSEMENT_EXP_DTL]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DISBURSEMENT_EXP_DTL](
	[disb_type] [char](1) NOT NULL,
	[disb_no] [varchar](10) NOT NULL,
	[disb_exp_dtl_id] [smallint] NOT NULL,
	[exp_desc] [varchar](200) NOT NULL,
	[exp_amt] [money] NOT NULL,
	[pay_amt] [money] NOT NULL,
	[dm_amt] [money] NOT NULL,
	[disc_amt] [money] NOT NULL,
	[acct_no] [varchar](10) NULL,
 CONSTRAINT [PK_DISBURSEMENT_EXP_DTL] PRIMARY KEY CLUSTERED 
(
	[disb_type] ASC,
	[disb_no] ASC,
	[disb_exp_dtl_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DISBURSEMENT_LINE_DTL]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DISBURSEMENT_LINE_DTL](
	[disb_type] [char](1) NOT NULL,
	[disb_no] [varchar](10) NOT NULL,
	[line_id] [smallint] NOT NULL,
	[col_a] [varchar](100) NULL,
	[col_b] [varchar](100) NULL,
	[col_c] [money] NULL,
	[col_d] [money] NULL,
	[col_e] [money] NULL,
 CONSTRAINT [PK_DISBURSEMENT_LINE_DTL] PRIMARY KEY CLUSTERED 
(
	[disb_type] ASC,
	[disb_no] ASC,
	[line_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DISBURSEMENT_PAYMENT_DTL]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DISBURSEMENT_PAYMENT_DTL](
	[disb_type] [char](1) NOT NULL,
	[disb_no] [varchar](10) NOT NULL,
	[pay_dtl_id] [smallint] NOT NULL,
	[pay_mtd_type] [char](1) NOT NULL,
	[pay_amt] [money] NOT NULL,
	[bank_acct_id] [smallint] NOT NULL,
	[check_no] [varchar](50) NULL,
 CONSTRAINT [PK_DISBURSEMENT_PAYMENT_DTL] PRIMARY KEY CLUSTERED 
(
	[disb_type] ASC,
	[disb_no] ASC,
	[pay_dtl_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DISBURSEMENT_STATUS]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DISBURSEMENT_STATUS](
	[disb_status] [char](1) NOT NULL,
	[disb_status_desc] [varchar](50) NOT NULL,
 CONSTRAINT [PK_DISBURSEMENT_STATUS] PRIMARY KEY CLUSTERED 
(
	[disb_status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DISBURSEMENT_TYPE]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DISBURSEMENT_TYPE](
	[disb_type] [char](1) NOT NULL,
	[disb_type_desc] [varchar](20) NOT NULL,
 CONSTRAINT [PK_DISBURSEMENT_TYPE] PRIMARY KEY CLUSTERED 
(
	[disb_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DR_ASPHALT]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DR_ASPHALT](
	[iss_no] [varchar](10) NOT NULL,
	[whse_id] [smallint] NOT NULL,
	[dest_type] [char](1) NOT NULL,
	[dest_id] [int] NULL,
	[iss_date] [datetime] NOT NULL,
	[iss_status] [char](1) NOT NULL,
	[iss_tot_amt] [money] NOT NULL,
	[ex_tot_amt] [money] NOT NULL,
	[nv_tot_amt] [money] NOT NULL,
	[v_tot_amt] [money] NOT NULL,
	[remarks] [varchar](50) NULL,
	[updated_by] [varchar](20) NULL,
	[updated_on] [datetime] NULL,
	[fin_yr] [smallint] NULL,
	[jrnl_id] [int] NULL,
	[op_batch_id] [int] NULL,
	[truck_no] [varchar](20) NULL,
	[driver] [varchar](20) NULL,
	[checker] [varchar](20) NULL,
	[hauler] [varchar](20) NULL,
	[dispatcher] [varchar](20) NULL,
	[dispatch_time] [datetime] NULL,
	[temperature] [money] NULL,
	[arrival_jobsite] [datetime] NULL,
	[departure_jobsite] [datetime] NULL,
	[pickup_flag] [bit] NULL,
	[sc_no] [varchar](10) NULL,
	[jobsite_id] [int] NULL,
	[form_no] [varchar](50) NULL,
 CONSTRAINT [PK_DR_ASPHALT] PRIMARY KEY CLUSTERED 
(
	[iss_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DR_ASPHALT_DTL]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DR_ASPHALT_DTL](
	[iss_no] [varchar](10) NOT NULL,
	[iss_dtl_id] [int] NOT NULL,
	[item_id] [int] NOT NULL,
	[batch_id] [int] NOT NULL,
	[iss_qty] [money] NOT NULL,
	[iss_unit] [varchar](10) NOT NULL,
	[served_qty] [money] NOT NULL,
	[iss_cost] [money] NOT NULL,
	[tax_type] [char](1) NOT NULL,
	[iss_amt] [money] NOT NULL,
	[ex_amt] [money] NOT NULL,
	[nv_amt] [money] NOT NULL,
	[v_amt] [money] NOT NULL,
	[c_iss_qty] [money] NOT NULL,
	[c_iss_cost] [money] NOT NULL,
	[dtl_remarks] [varchar](100) NULL,
	[scan_id] [varchar](14) NULL,
	[scan_dtl_id] [smallint] NULL,
	[wt_gross] [money] NULL,
	[wt_tare] [money] NULL,
	[wt_net] [money] NULL,
	[wt_gross_scale_id] [tinyint] NULL,
	[wt_gross_datetime] [datetime] NULL,
	[wt_tare_scale_id] [tinyint] NULL,
	[wt_tare_datetime] [datetime] NULL,
 CONSTRAINT [PK_DR_ASPHALT_DTL] PRIMARY KEY CLUSTERED 
(
	[iss_no] ASC,
	[iss_dtl_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DR_ASPHALT_DTL_SUBITEM]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DR_ASPHALT_DTL_SUBITEM](
	[iss_no] [varchar](10) NOT NULL,
	[iss_dtl_id] [int] NOT NULL,
	[subitem_id] [int] NOT NULL,
	[item_id] [int] NOT NULL,
	[c_iss_cost] [money] NOT NULL,
	[c_iss_qty] [money] NOT NULL,
 CONSTRAINT [PK_DR_ASPHALT_DTL_SUBITEM] PRIMARY KEY CLUSTERED 
(
	[iss_no] ASC,
	[iss_dtl_id] ASC,
	[subitem_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DR_CONCRETE]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DR_CONCRETE](
	[iss_no] [varchar](10) NOT NULL,
	[whse_id] [smallint] NOT NULL,
	[dest_type] [char](1) NOT NULL,
	[dest_id] [int] NULL,
	[iss_date] [datetime] NOT NULL,
	[iss_status] [char](1) NOT NULL,
	[iss_tot_amt] [money] NOT NULL,
	[ex_tot_amt] [money] NOT NULL,
	[nv_tot_amt] [money] NOT NULL,
	[v_tot_amt] [money] NOT NULL,
	[remarks] [varchar](50) NULL,
	[updated_by] [varchar](20) NULL,
	[updated_on] [datetime] NULL,
	[fin_yr] [smallint] NULL,
	[jrnl_id] [int] NULL,
	[op_batch_id] [int] NULL,
	[item_id] [int] NOT NULL,
	[batch_id] [int] NOT NULL,
	[iss_qty] [money] NOT NULL,
	[iss_unit] [varchar](10) NOT NULL,
	[served_qty] [money] NOT NULL,
	[iss_cost] [money] NOT NULL,
	[tax_type] [char](1) NOT NULL,
	[iss_amt] [money] NOT NULL,
	[ex_amt] [money] NOT NULL,
	[nv_amt] [money] NOT NULL,
	[v_amt] [money] NOT NULL,
	[c_iss_qty] [money] NOT NULL,
	[c_iss_cost] [money] NOT NULL,
	[wt_gross] [money] NULL,
	[wt_tare] [money] NULL,
	[wt_net] [money] NULL,
	[dtl_remarks] [varchar](50) NULL,
	[truck_no] [varchar](20) NULL,
	[driver] [varchar](20) NULL,
	[checker] [varchar](20) NULL,
	[dispatcher] [varchar](20) NULL,
	[dispatch_time] [datetime] NULL,
	[arrival_jobsite] [datetime] NULL,
	[unloading_start] [datetime] NULL,
	[unloading_end] [datetime] NULL,
	[design] [char](1) NULL,
	[cum_volume] [money] NULL,
	[cum_total] [money] NULL,
	[max_slump] [money] NULL,
	[admix_id] [int] NULL,
	[cement_factor] [varchar](20) NULL,
	[cement_type] [int] NULL,
	[water_added_ltrs] [money] NULL,
	[water_added_rqst] [varchar](50) NULL,
	[load_no] [int] NULL,
	[pickup_flag] [bit] NULL,
	[sc_no] [varchar](10) NULL,
	[jobsite_id] [int] NULL,
	[design_id] [int] NULL,
	[design_type] [char](1) NULL,
	[wt_gross_scale_id] [tinyint] NULL,
	[wt_gross_datetime] [datetime] NULL,
	[wt_tare_scale_id] [tinyint] NULL,
	[wt_tare_datetime] [datetime] NULL,
	[form_no] [varchar](50) NULL,
 CONSTRAINT [PK_DR_CONCRETE] PRIMARY KEY CLUSTERED 
(
	[iss_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DR_CONCRETE_DESIGN]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DR_CONCRETE_DESIGN](
	[design_id] [int] NOT NULL,
	[design_desc] [varchar](100) NULL,
	[updated_by] [varchar](20) NULL,
	[updated_on] [datetime] NULL,
 CONSTRAINT [PK_DR_CONCRETE_DESIGN] PRIMARY KEY CLUSTERED 
(
	[design_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DR_CONCRETE_DESIGN_TYPE]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DR_CONCRETE_DESIGN_TYPE](
	[design_type] [char](1) NOT NULL,
	[design_type_desc] [varchar](50) NULL,
 CONSTRAINT [PK_DR_CONCRETE_DESIGN_TYPE] PRIMARY KEY CLUSTERED 
(
	[design_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DR_CONCRETE_DTL_SUBITEM]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DR_CONCRETE_DTL_SUBITEM](
	[iss_no] [varchar](10) NOT NULL,
	[iss_dtl_id] [int] NOT NULL,
	[subitem_id] [int] NOT NULL,
	[item_id] [int] NOT NULL,
	[c_iss_cost] [money] NOT NULL,
	[c_iss_qty] [money] NOT NULL,
 CONSTRAINT [PK_DR_CONCRETE_DTL_SUBITEM] PRIMARY KEY CLUSTERED 
(
	[iss_no] ASC,
	[iss_dtl_id] ASC,
	[subitem_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DR_TRUCK_BODY]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DR_TRUCK_BODY](
	[body_no] [nvarchar](255) NULL,
	[truck_no] [nvarchar](255) NULL,
	[driver] [nvarchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DR_TRUCK_NO]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DR_TRUCK_NO](
	[truck_no] [varchar](20) NOT NULL,
	[driver] [varchar](20) NULL,
	[wt_tare] [money] NULL,
	[body_no] [varchar](20) NULL,
 CONSTRAINT [PK_DR_TRUCK_NO] PRIMARY KEY CLUSTERED 
(
	[truck_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EQUIPMENT]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EQUIPMENT](
	[equip_id] [int] NOT NULL,
	[equip_code] [varchar](50) NOT NULL,
	[equip_desc] [varchar](100) NULL,
	[equip_type] [varchar](100) NULL,
	[acct_no] [varchar](10) NULL,
 CONSTRAINT [PK_EQUIPMENT] PRIMARY KEY CLUSTERED 
(
	[equip_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[hauler_measurement]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hauler_measurement](
	[hauler_id] [int] NULL,
	[HAULER] [nvarchar](255) NULL,
	[PLATE NUMBER] [nvarchar](255) NULL,
	[LENGTH] [float] NULL,
	[WIDTH] [float] NULL,
	[HEIGHT] [float] NULL,
	[VOLUME] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ITEM]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ITEM](
	[item_id] [int] NOT NULL,
	[item_type] [char](1) NOT NULL,
	[item_code] [varchar](50) NOT NULL,
	[item_desc] [varchar](200) NOT NULL,
	[category_id] [int] NOT NULL,
	[unit_code] [varchar](10) NOT NULL,
	[whole_unit_code] [varchar](50) NOT NULL,
	[supp_id] [int] NULL,
	[tax_type] [char](1) NOT NULL,
	[custom_field1] [varchar](200) NULL,
	[custom_field2] [varchar](200) NULL,
	[custom_field3] [varchar](200) NULL,
	[active_flag] [char](1) NULL,
	[sales_unit] [varchar](10) NULL,
	[purchase_unit] [varchar](10) NULL,
	[acct_no] [varchar](10) NULL,
	[subitem_flag] [bit] NULL,
	[updated_by] [varchar](20) NULL,
	[updated_on] [datetime] NULL,
 CONSTRAINT [PK_ITEM] PRIMARY KEY CLUSTERED 
(
	[item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ITEM_CATEGORY]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ITEM_CATEGORY](
	[category_id] [int] NOT NULL,
	[parent_cat_id] [int] NOT NULL,
	[category_code] [varchar](50) NOT NULL,
	[category_desc] [varchar](200) NOT NULL,
	[category_lvl] [smallint] NOT NULL,
	[updated_by] [varchar](20) NULL,
	[updated_on] [datetime] NULL,
 CONSTRAINT [PK_ITEM_CATEGORY] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ITEM_MIN_STOCK_LEVEL]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ITEM_MIN_STOCK_LEVEL](
	[item_id] [int] NOT NULL,
	[whse_id] [int] NULL,
	[min_qty] [money] NULL,
	[max_qty] [money] NULL,
	[location] [varchar](100) NULL,
 CONSTRAINT [PK_ITEM_MIN_STOCK_LEVEL] PRIMARY KEY CLUSTERED 
(
	[item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ITEM_PLU]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ITEM_PLU](
	[item_id] [int] NOT NULL,
	[plu_id] [int] NOT NULL,
	[plu_desc] [varchar](200) NOT NULL,
	[plu_unit_code] [varchar](10) NOT NULL,
	[plu_qty] [money] NOT NULL,
	[barcode] [varchar](50) NULL,
	[plu_price] [money] NULL,
	[active_flag] [char](1) NULL,
	[updated_by] [varchar](20) NULL,
	[updated_on] [datetime] NULL,
 CONSTRAINT [PK_ITEM_PLU] PRIMARY KEY CLUSTERED 
(
	[item_id] ASC,
	[plu_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ITEM_PLU_COST]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ITEM_PLU_COST](
	[item_id] [int] NOT NULL,
	[plu_id] [int] NOT NULL,
	[purch_price] [money] NOT NULL,
	[plu_cost] [money] NOT NULL,
	[bo_cost] [money] NOT NULL,
	[weighted_ave] [money] NOT NULL,
 CONSTRAINT [PK_ITEM_PLU_COST] PRIMARY KEY CLUSTERED 
(
	[item_id] ASC,
	[plu_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ITEM_PLU_PRICE]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ITEM_PLU_PRICE](
	[item_id] [int] NOT NULL,
	[plu_id] [int] NOT NULL,
	[price_class] [smallint] NOT NULL,
	[markup_percent] [real] NULL,
	[markup_amt] [money] NULL,
	[computed_price] [money] NOT NULL,
	[active_price] [money] NOT NULL,
	[updated_by] [varchar](20) NULL,
	[updated_on] [datetime] NULL,
 CONSTRAINT [PK_ITEM_PLU_PRICE] PRIMARY KEY CLUSTERED 
(
	[item_id] ASC,
	[plu_id] ASC,
	[price_class] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ITEM_SUBITEM]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ITEM_SUBITEM](
	[item_id] [int] NOT NULL,
	[subitem_id] [int] NOT NULL,
	[unit_code] [varchar](10) NOT NULL,
	[subitem_qty] [money] NOT NULL,
	[whse_id] [smallint] NULL,
 CONSTRAINT [PK_ITEM_SUBITEM] PRIMARY KEY CLUSTERED 
(
	[item_id] ASC,
	[subitem_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ITEM_TYPE]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ITEM_TYPE](
	[item_type] [char](1) NOT NULL,
	[item_type_desc] [varchar](100) NOT NULL,
 CONSTRAINT [PK_ITEM_TYPE] PRIMARY KEY CLUSTERED 
(
	[item_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LMS_MIGRATE]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LMS_MIGRATE](
	[item_code] [nvarchar](255) NULL,
	[item_desc] [nvarchar](255) NULL,
	[category_desc] [nvarchar](255) NULL,
	[unit_code] [nvarchar](255) NULL,
	[tax_type] [nvarchar](255) NULL,
	[acct_no] [nvarchar](255) NULL,
	[txn_qty] [float] NULL,
	[unit_cost] [float] NULL,
	[whse_id] [float] NULL,
	[whse_name] [nvarchar](255) NULL,
	[active_flag] [nvarchar](255) NULL,
	[load_flag] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MODULE]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MODULE](
	[module_id] [smallint] NOT NULL,
	[module_desc] [varchar](50) NOT NULL,
	[role_class_indc] [char](2) NULL,
 CONSTRAINT [PK_MODULES] PRIMARY KEY CLUSTERED 
(
	[module_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OPERATION_BATCH]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OPERATION_BATCH](
	[op_batch_id] [int] NOT NULL,
	[op_batch_code] [varchar](12) NULL,
	[updated_by] [varchar](20) NULL,
	[updated_on] [datetime] NULL,
	[op_suffix] [varchar](2) NULL,
 CONSTRAINT [PK_OPERATION_BATCH] PRIMARY KEY CLUSTERED 
(
	[op_batch_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PAYMENT_METHOD]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PAYMENT_METHOD](
	[pay_mtd_type] [char](1) NOT NULL,
	[pay_mtd_desc] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PAYMENT_METHOD] PRIMARY KEY CLUSTERED 
(
	[pay_mtd_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PLANT]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PLANT](
	[plant_id] [int] NOT NULL,
	[plant_desc] [varchar](100) NULL,
	[plant_loc] [varchar](100) NULL,
	[acct_no] [varchar](10) NULL,
 CONSTRAINT [PK_PLANT] PRIMARY KEY CLUSTERED 
(
	[plant_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PRICE_CLASS]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PRICE_CLASS](
	[price_class] [smallint] NOT NULL,
	[price_class_desc] [varchar](100) NULL,
 CONSTRAINT [PK_PRICE_CLASS] PRIMARY KEY CLUSTERED 
(
	[price_class] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PRICE_HISTORY]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PRICE_HISTORY](
	[txn_no] [varchar](14) NOT NULL,
	[eff_date] [datetime] NOT NULL,
	[txn_type] [char](1) NULL,
	[txn_class] [char](1) NULL,
	[cust_id] [int] NULL,
	[update_type] [char](1) NULL,
	[update_value] [money] NULL,
	[base_type] [char](1) NULL,
	[updated_by] [smallint] NULL,
	[updated_on] [datetime] NULL,
 CONSTRAINT [PK_PRICE_HISTORY] PRIMARY KEY CLUSTERED 
(
	[txn_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PRICE_HISTORY_CLASS]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PRICE_HISTORY_CLASS](
	[txn_class] [char](1) NOT NULL,
	[txn_class_desc] [varchar](50) NULL,
 CONSTRAINT [PK_PRICE_HISTORY_CLASS] PRIMARY KEY CLUSTERED 
(
	[txn_class] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PRICE_HISTORY_DTL]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PRICE_HISTORY_DTL](
	[txn_no] [varchar](14) NOT NULL,
	[txn_dtl_id] [int] NOT NULL,
	[item_id] [int] NOT NULL,
	[plu_id] [int] NOT NULL,
	[eff_date] [datetime] NOT NULL,
	[cust_id] [int] NULL,
	[old_price] [money] NOT NULL,
	[txn_price] [money] NOT NULL,
 CONSTRAINT [PK_PRICE_HISTORY_DTL] PRIMARY KEY CLUSTERED 
(
	[txn_no] ASC,
	[txn_dtl_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PRICE_HISTORY_TYPE]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PRICE_HISTORY_TYPE](
	[txn_type] [char](1) NOT NULL,
	[txn_type_desc] [varchar](50) NULL,
 CONSTRAINT [PK_PRICE_HISTORY_TYPE] PRIMARY KEY CLUSTERED 
(
	[txn_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PROJECT]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PROJECT](
	[proj_id] [int] NOT NULL,
	[proj_code] [varchar](50) NOT NULL,
	[proj_desc] [varchar](100) NULL,
	[proj_job_site] [varchar](100) NULL,
	[acct_no] [varchar](10) NULL,
 CONSTRAINT [PK_PROJECT] PRIMARY KEY CLUSTERED 
(
	[proj_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PROVISIONAL_RECEIPT]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PROVISIONAL_RECEIPT](
	[pr_id] [int] IDENTITY(1,1) NOT NULL,
	[site_id] [int] NULL,
	[cust_id] [int] NOT NULL,
	[pr_no] [varchar](20) NOT NULL,
	[pr_date] [datetime] NOT NULL,
	[pr_status] [char](1) NOT NULL,
	[pay_tot_amt] [money] NOT NULL,
	[remarks] [varchar](300) NULL,
	[updated_by] [varchar](20) NULL,
	[updated_on] [datetime] NULL,
 CONSTRAINT [PK_PROVISIONAL_RECEIPT] PRIMARY KEY CLUSTERED 
(
	[pr_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PROVISIONAL_RECEIPT_DTL]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PROVISIONAL_RECEIPT_DTL](
	[pr_id] [int] NOT NULL,
	[pay_dtl_id] [int] IDENTITY(1,1) NOT NULL,
	[pay_mtd_type] [varchar](10) NOT NULL,
	[pay_amt] [money] NOT NULL,
	[check_no] [varchar](50) NULL,
	[check_date] [date] NULL,
	[bank_id] [smallint] NULL,
	[bank_branch] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PROVISIONAL_RECEIPT_SITE]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PROVISIONAL_RECEIPT_SITE](
	[site_id] [int] NULL,
	[site_name] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PURCHASE_DISCOUNT]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PURCHASE_DISCOUNT](
	[purch_disc_no] [int] NOT NULL,
	[base_type] [char](1) NOT NULL,
	[base_id] [varchar](30) NULL,
	[eff_date] [datetime] NOT NULL,
	[remarks] [varchar](100) NULL,
	[updated_by] [smallint] NULL,
	[updated_on] [datetime] NULL,
 CONSTRAINT [PK_PURCHASE_DISCOUNT] PRIMARY KEY CLUSTERED 
(
	[purch_disc_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PURCHASE_DISCOUNT_DTL]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PURCHASE_DISCOUNT_DTL](
	[purch_disc_no] [int] NOT NULL,
	[seq_no] [smallint] NOT NULL,
	[purch_disc_percent] [money] NULL,
	[purch_disc_amt] [money] NULL,
 CONSTRAINT [PK_PURCHASE_DISCOUNT_DTL] PRIMARY KEY CLUSTERED 
(
	[purch_disc_no] ASC,
	[seq_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PURCHASE_DISCOUNT_ITEM_DTL]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PURCHASE_DISCOUNT_ITEM_DTL](
	[purch_disc_no] [int] NOT NULL,
	[item_id] [int] NOT NULL,
 CONSTRAINT [PK_PURCHASE_DISCOUNT_ITEM_DTL] PRIMARY KEY CLUSTERED 
(
	[purch_disc_no] ASC,
	[item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PURCHASE_DISCOUNT_TYPE]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PURCHASE_DISCOUNT_TYPE](
	[base_type] [char](1) NOT NULL,
	[base_type_desc] [varchar](50) NULL,
 CONSTRAINT [PK_PURCHASE_DISCOUNT_TYPE] PRIMARY KEY CLUSTERED 
(
	[base_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PURCHASE_INVOICE]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PURCHASE_INVOICE](
	[pi_no] [varchar](10) NOT NULL,
	[supp_id] [int] NOT NULL,
	[pi_date] [datetime] NOT NULL,
	[due_date] [datetime] NULL,
	[pi_status] [char](1) NOT NULL,
	[term_code] [varchar](30) NOT NULL,
	[ref_no] [varchar](50) NULL,
	[item_dtl_flag] [bit] NULL,
	[pi_rcpt_tot] [money] NOT NULL,
	[pi_exp_tot] [money] NOT NULL,
	[pi_tot_amt] [money] NOT NULL,
	[ex_tot_amt] [money] NOT NULL,
	[nv_tot_amt] [money] NOT NULL,
	[v_tot_amt] [money] NOT NULL,
	[pi_post_amt] [money] NOT NULL,
	[approved_by] [varchar](50) NULL,
	[remarks] [varchar](50) NULL,
	[updated_by] [varchar](20) NULL,
	[updated_on] [datetime] NULL,
	[fin_yr] [smallint] NULL,
	[jrnl_id] [int] NULL,
	[ewtax_flag] [bit] NULL,
	[ewtax_percent] [money] NULL,
	[ewtax_amount] [money] NULL,
 CONSTRAINT [PK_PURCHASE_INVOICE] PRIMARY KEY CLUSTERED 
(
	[pi_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PURCHASE_INVOICE_DTL]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PURCHASE_INVOICE_DTL](
	[pi_no] [varchar](10) NOT NULL,
	[pi_dtl_id] [int] NOT NULL,
	[item_id] [int] NOT NULL,
	[whse_id] [smallint] NOT NULL,
	[batch_id] [int] NOT NULL,
	[pi_qty] [money] NOT NULL,
	[pi_unit] [varchar](10) NOT NULL,
	[pi_price] [money] NOT NULL,
	[pi_cost] [money] NOT NULL,
	[tax_type] [char](1) NOT NULL,
	[pi_amt] [money] NOT NULL,
	[ex_amt] [money] NOT NULL,
	[nv_amt] [money] NOT NULL,
	[v_amt] [money] NOT NULL,
	[c_pi_qty] [money] NOT NULL,
	[c_pi_cost] [money] NOT NULL,
	[dtl_remarks] [varchar](100) NULL,
	[pi_net_price] [money] NULL,
	[pi_disc] [money] NULL,
	[c_pi_net_price] [money] NULL,
	[c_pi_disc] [money] NULL,
 CONSTRAINT [PK_PURCHASE_INVOICE_DTL] PRIMARY KEY CLUSTERED 
(
	[pi_no] ASC,
	[pi_dtl_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PURCHASE_INVOICE_DTL_SUBITEM]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PURCHASE_INVOICE_DTL_SUBITEM](
	[pi_no] [varchar](10) NOT NULL,
	[pi_dtl_id] [int] NOT NULL,
	[subitem_id] [int] NOT NULL,
	[item_id] [int] NOT NULL,
	[c_pi_cost] [money] NOT NULL,
	[c_pi_qty] [money] NOT NULL,
 CONSTRAINT [PK_PURCHASE_INVOICE_DTL_SUBITEM] PRIMARY KEY CLUSTERED 
(
	[pi_no] ASC,
	[pi_dtl_id] ASC,
	[subitem_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PURCHASE_INVOICE_EXP]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PURCHASE_INVOICE_EXP](
	[pi_no] [varchar](10) NOT NULL,
	[exp_dtl_id] [smallint] NOT NULL,
	[exp_desc] [varchar](200) NOT NULL,
	[exp_amt] [money] NOT NULL,
	[tax_type] [char](1) NOT NULL,
	[net_amt] [money] NOT NULL,
	[ex_amt] [money] NOT NULL,
	[nv_amt] [money] NOT NULL,
	[v_amt] [money] NOT NULL,
	[acct_no] [varchar](10) NULL,
 CONSTRAINT [PK_PURCHASE_INVOICE_EXP] PRIMARY KEY CLUSTERED 
(
	[pi_no] ASC,
	[exp_dtl_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PURCHASE_INVOICE_RCPT]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PURCHASE_INVOICE_RCPT](
	[pi_no] [varchar](10) NOT NULL,
	[rcpt_no] [varchar](10) NOT NULL,
	[rcpt_tot_amt] [money] NOT NULL,
	[ex_tot_amt] [money] NOT NULL,
	[nv_tot_amt] [money] NOT NULL,
	[v_tot_amt] [money] NOT NULL,
 CONSTRAINT [PK_PURCHASE_INVOICE_RCPT] PRIMARY KEY CLUSTERED 
(
	[pi_no] ASC,
	[rcpt_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PURCHASE_INVOICE_STATUS]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PURCHASE_INVOICE_STATUS](
	[pi_status] [char](1) NOT NULL,
	[pi_status_desc] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PURCHASE_INVOICE_STATUS] PRIMARY KEY CLUSTERED 
(
	[pi_status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PURCHASE_ORDER]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PURCHASE_ORDER](
	[po_no] [varchar](10) NOT NULL,
	[supp_id] [int] NOT NULL,
	[whse_id] [smallint] NOT NULL,
	[po_date] [datetime] NOT NULL,
	[dlvry_date] [datetime] NULL,
	[po_status] [char](1) NOT NULL,
	[term_code] [varchar](30) NOT NULL,
	[ref_no] [varchar](50) NULL,
	[po_item_tot] [money] NOT NULL,
	[po_misc_tot] [money] NOT NULL,
	[po_tot_amt] [money] NOT NULL,
	[ex_tot_amt] [money] NOT NULL,
	[nv_tot_amt] [money] NOT NULL,
	[v_tot_amt] [money] NOT NULL,
	[approved_by] [varchar](50) NULL,
	[remarks] [varchar](50) NULL,
	[updated_by] [varchar](20) NULL,
	[updated_on] [datetime] NULL,
	[form_no] [varchar](50) NULL,
 CONSTRAINT [PK_PURCHASE_ORDER] PRIMARY KEY CLUSTERED 
(
	[po_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PURCHASE_ORDER_DTL]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PURCHASE_ORDER_DTL](
	[po_no] [varchar](10) NOT NULL,
	[po_dtl_id] [int] NOT NULL,
	[item_id] [int] NOT NULL,
	[po_qty] [money] NOT NULL,
	[po_unit] [varchar](10) NOT NULL,
	[served_qty] [money] NOT NULL,
	[po_price] [money] NOT NULL,
	[po_cost] [money] NOT NULL,
	[tax_type] [char](1) NOT NULL,
	[po_amt] [money] NOT NULL,
	[ex_amt] [money] NOT NULL,
	[nv_amt] [money] NOT NULL,
	[v_amt] [money] NOT NULL,
	[c_po_qty] [money] NOT NULL,
	[c_po_price] [money] NOT NULL,
	[c_po_cost] [money] NOT NULL,
	[dtl_remarks] [varchar](100) NULL,
	[po_net_price] [money] NULL,
	[po_disc] [money] NULL,
	[c_po_net_price] [money] NULL,
	[c_po_disc] [money] NULL,
 CONSTRAINT [PK_PURCHASE_ORDER_DTL] PRIMARY KEY CLUSTERED 
(
	[po_no] ASC,
	[po_dtl_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PURCHASE_ORDER_MISC]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PURCHASE_ORDER_MISC](
	[po_no] [varchar](10) NOT NULL,
	[po_misc_id] [int] NOT NULL,
	[misc_desc] [varchar](50) NOT NULL,
	[net_gross_flag] [char](1) NOT NULL,
	[misc_percent] [money] NULL,
	[misc_amt] [money] NULL,
 CONSTRAINT [PK_PURCHASE_ORDER_MISC] PRIMARY KEY CLUSTERED 
(
	[po_no] ASC,
	[po_misc_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PURCHASE_ORDER_STATUS]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PURCHASE_ORDER_STATUS](
	[po_status] [char](1) NOT NULL,
	[po_status_desc] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PURCHASE_ORDER_STATUS] PRIMARY KEY CLUSTERED 
(
	[po_status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PURCHASE_PRICE_CLASS]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PURCHASE_PRICE_CLASS](
	[price_class] [smallint] NOT NULL,
	[price_class_desc] [varchar](100) NULL,
 CONSTRAINT [PK_PURCHASE_PRICE_CLASS] PRIMARY KEY CLUSTERED 
(
	[price_class] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PURCHASE_PRICE_HISTORY]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PURCHASE_PRICE_HISTORY](
	[txn_no] [varchar](14) NOT NULL,
	[eff_date] [datetime] NOT NULL,
	[txn_type] [char](1) NULL,
	[txn_class] [char](1) NULL,
	[supp_id] [int] NULL,
	[update_type] [char](1) NULL,
	[update_value] [money] NULL,
	[base_type] [char](1) NULL,
	[updated_by] [smallint] NULL,
	[updated_on] [datetime] NULL,
 CONSTRAINT [PK_PURCHASE_PRICE_HISTORY] PRIMARY KEY CLUSTERED 
(
	[txn_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PURCHASE_PRICE_HISTORY_CLASS]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PURCHASE_PRICE_HISTORY_CLASS](
	[txn_class] [char](1) NOT NULL,
	[txn_class_desc] [varchar](50) NULL,
 CONSTRAINT [PK_PURCHASE_PRICE_HISTORY_CLASS] PRIMARY KEY CLUSTERED 
(
	[txn_class] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PURCHASE_PRICE_HISTORY_DTL]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PURCHASE_PRICE_HISTORY_DTL](
	[txn_no] [varchar](14) NOT NULL,
	[txn_dtl_id] [int] NOT NULL,
	[item_id] [int] NOT NULL,
	[plu_id] [int] NOT NULL,
	[eff_date] [datetime] NOT NULL,
	[supp_id] [int] NULL,
	[old_price] [money] NOT NULL,
	[txn_price] [money] NOT NULL,
 CONSTRAINT [PK_PURCHASE_PRICE_HISTORY_DTL] PRIMARY KEY CLUSTERED 
(
	[txn_no] ASC,
	[txn_dtl_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PURCHASE_PRICE_HISTORY_TYPE]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PURCHASE_PRICE_HISTORY_TYPE](
	[txn_type] [char](1) NOT NULL,
	[txn_type_desc] [varchar](50) NULL,
 CONSTRAINT [PK_PURCHASE_PRICE_HISTORY_TYPE] PRIMARY KEY CLUSTERED 
(
	[txn_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PURCHASE_RETURN]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PURCHASE_RETURN](
	[pr_no] [varchar](10) NOT NULL,
	[supp_id] [int] NOT NULL,
	[pr_date] [datetime] NOT NULL,
	[pr_status] [char](1) NOT NULL,
	[ref_no] [varchar](50) NULL,
	[pr_tot_amt] [money] NOT NULL,
	[ex_tot_amt] [money] NOT NULL,
	[nv_tot_amt] [money] NOT NULL,
	[v_tot_amt] [money] NOT NULL,
	[approved_by] [varchar](50) NULL,
	[remarks] [varchar](50) NULL,
	[dm_no] [varchar](10) NULL,
	[updated_by] [varchar](20) NULL,
	[updated_on] [datetime] NULL,
	[fin_yr] [smallint] NULL,
	[jrnl_id] [int] NULL,
 CONSTRAINT [PK_PURCHASE_RETURN] PRIMARY KEY CLUSTERED 
(
	[pr_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PURCHASE_RETURN_DTL]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PURCHASE_RETURN_DTL](
	[pr_no] [varchar](10) NOT NULL,
	[pr_dtl_id] [int] NOT NULL,
	[item_id] [int] NOT NULL,
	[whse_id] [smallint] NOT NULL,
	[batch_id] [int] NOT NULL,
	[pr_qty] [money] NOT NULL,
	[pr_unit] [varchar](10) NOT NULL,
	[pr_price] [money] NOT NULL,
	[pr_cost] [money] NOT NULL,
	[tax_type] [char](1) NOT NULL,
	[pr_amt] [money] NOT NULL,
	[ex_amt] [money] NOT NULL,
	[nv_amt] [money] NOT NULL,
	[v_amt] [money] NOT NULL,
	[c_pr_qty] [money] NOT NULL,
	[c_pr_price] [money] NOT NULL,
	[c_pr_cost] [money] NOT NULL,
	[dtl_remarks] [varchar](100) NULL,
	[source_no] [varchar](100) NULL,
	[source_dtl_id] [int] NULL,
 CONSTRAINT [PK_PURCHASE_RETURN_DTL] PRIMARY KEY CLUSTERED 
(
	[pr_no] ASC,
	[pr_dtl_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PURCHASE_RETURN_STATUS]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PURCHASE_RETURN_STATUS](
	[pr_status] [char](1) NOT NULL,
	[pr_status_desc] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PURCHASE_RETURN_STATUS] PRIMARY KEY CLUSTERED 
(
	[pr_status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[REMINDER]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[REMINDER](
	[reminder_id] [smallint] NOT NULL,
	[reminder_desc] [varchar](50) NOT NULL,
 CONSTRAINT [PK_REMINDER] PRIMARY KEY CLUSTERED 
(
	[reminder_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[REPACKING]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[REPACKING](
	[rpk_no] [varchar](10) NOT NULL,
	[cust_id] [int] NOT NULL,
	[rpk_date] [datetime] NOT NULL,
	[rpk_status] [char](1) NOT NULL,
	[ref_no] [varchar](50) NULL,
	[rpk_tot_amt] [money] NOT NULL,
	[ex_tot_amt] [money] NOT NULL,
	[nv_tot_amt] [money] NOT NULL,
	[v_tot_amt] [money] NOT NULL,
	[approved_by] [varchar](50) NULL,
	[remarks] [varchar](50) NULL,
	[si_no] [varchar](10) NULL,
	[updated_by] [varchar](20) NULL,
	[updated_on] [datetime] NULL,
	[fin_yr] [smallint] NULL,
	[jrnl_id] [int] NULL,
 CONSTRAINT [PK_REPACKING] PRIMARY KEY CLUSTERED 
(
	[rpk_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[REPACKING_DTL]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[REPACKING_DTL](
	[rpk_no] [varchar](10) NOT NULL,
	[rpk_dtl_id] [int] NOT NULL,
	[item_id] [int] NOT NULL,
	[whse_id] [smallint] NOT NULL,
	[batch_id] [int] NOT NULL,
	[dtl_qty] [money] NOT NULL,
	[dtl_unit] [varchar](10) NOT NULL,
	[rpk_price] [money] NOT NULL,
	[tax_type] [char](1) NOT NULL,
	[rpk_amt] [money] NOT NULL,
	[labor_cost] [money] NOT NULL,
	[labor_amt] [money] NOT NULL,
	[pack_cost] [money] NOT NULL,
	[pack_amt] [money] NOT NULL,
	[net_amt] [money] NULL,
	[ex_amt] [money] NOT NULL,
	[nv_amt] [money] NOT NULL,
	[v_amt] [money] NOT NULL,
	[rpk_item_id] [int] NOT NULL,
	[rpk_batch_id] [int] NULL,
	[rpk_to_qty] [money] NOT NULL,
	[rpk_to_qty_computed] [money] NOT NULL,
	[rpk_unit] [varchar](10) NULL,
	[c_dtl_qty] [money] NOT NULL,
	[c_dtl_cost] [money] NOT NULL,
	[c_rpk_qty] [money] NULL,
	[c_rpk_cost] [money] NULL,
 CONSTRAINT [PK_REPACKING_DTL] PRIMARY KEY CLUSTERED 
(
	[rpk_no] ASC,
	[rpk_dtl_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[REPACKING_STATUS]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[REPACKING_STATUS](
	[rpk_status] [char](1) NOT NULL,
	[rpk_status_desc] [varchar](50) NOT NULL,
 CONSTRAINT [PK_REPACKING_STATUS] PRIMARY KEY CLUSTERED 
(
	[rpk_status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ROLE]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ROLE](
	[role_id] [int] NOT NULL,
	[class_id] [int] NOT NULL,
	[role_desc] [varchar](100) NOT NULL,
 CONSTRAINT [PK_ROLES] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ROLE_CLASS]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ROLE_CLASS](
	[class_id] [int] NOT NULL,
	[parent_class_id] [int] NOT NULL,
	[class_desc] [varchar](100) NOT NULL,
	[has_role_flag] [char](1) NULL,
	[lvl] [smallint] NULL,
	[txn_type] [varchar](20) NULL,
 CONSTRAINT [PK_ROLE_CLASS] PRIMARY KEY CLUSTERED 
(
	[class_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ROLE_LOCK]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ROLE_LOCK](
	[role_id] [varchar](20) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SALES_COMMISSION]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SALES_COMMISSION](
	[sc_no] [varchar](10) NOT NULL,
	[agent_id] [int] NOT NULL,
	[supp_id] [int] NULL,
	[sc_date] [datetime] NOT NULL,
	[sc_status] [char](1) NOT NULL,
	[sc_tot_amt] [money] NOT NULL,
	[approved_by] [varchar](50) NULL,
	[cm_no] [varchar](10) NULL,
	[remarks] [varchar](100) NULL,
	[updated_by] [varchar](20) NULL,
	[updated_on] [datetime] NULL,
 CONSTRAINT [PK_SALES_COMMISSION] PRIMARY KEY CLUSTERED 
(
	[sc_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SALES_COMMISSION_DTL]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SALES_COMMISSION_DTL](
	[sc_no] [varchar](10) NOT NULL,
	[si_no] [varchar](10) NOT NULL,
	[si_date] [datetime] NOT NULL,
	[comm_amt] [money] NOT NULL,
 CONSTRAINT [PK_SALES_COMMISSION_DTL] PRIMARY KEY CLUSTERED 
(
	[sc_no] ASC,
	[si_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SALES_COMMISSION_STATUS]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SALES_COMMISSION_STATUS](
	[sc_status] [char](1) NOT NULL,
	[sc_status_desc] [varchar](50) NOT NULL,
 CONSTRAINT [PK_SALES_COMMISSION_STATUS] PRIMARY KEY CLUSTERED 
(
	[sc_status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SALES_CONTRACT]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SALES_CONTRACT](
	[sc_no] [varchar](10) NOT NULL,
	[sc_ref] [varchar](20) NULL,
	[sc_date] [datetime] NULL,
	[cust_id] [int] NULL,
	[term_code] [varchar](30) NULL,
	[sc_tot_amt] [money] NULL,
	[sc_status] [char](1) NULL,
	[remarks] [varchar](300) NULL,
	[updated_by] [varchar](20) NULL,
	[updated_on] [datetime] NULL,
	[valid_date] [date] NULL,
 CONSTRAINT [PK_SALES_CONTRACT] PRIMARY KEY CLUSTERED 
(
	[sc_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SALES_CONTRACT_ITEM_DTL]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SALES_CONTRACT_ITEM_DTL](
	[sc_no] [varchar](10) NOT NULL,
	[jobsite_id] [int] NOT NULL,
	[item_id] [int] NOT NULL,
	[sc_qty] [money] NULL,
	[served_qty] [money] NULL,
	[sc_unit] [varchar](10) NULL,
	[sc_price] [money] NULL,
	[sc_amt] [money] NULL,
	[job_desc] [varchar](20) NULL,
 CONSTRAINT [PK_SALES_CONTRACT_ITEM] PRIMARY KEY CLUSTERED 
(
	[sc_no] ASC,
	[jobsite_id] ASC,
	[item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SALES_CONTRACT_JOBSITE_DTL]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SALES_CONTRACT_JOBSITE_DTL](
	[sc_no] [varchar](10) NOT NULL,
	[jobsite_id] [int] NOT NULL,
	[jobsite_addr] [varchar](max) NULL,
 CONSTRAINT [PK_SALES_CONTRACT_JOBSITE] PRIMARY KEY CLUSTERED 
(
	[sc_no] ASC,
	[jobsite_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SALES_CONTRACT_STATUS]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[SALES_CONTRACT_STATUS](
	[sc_status] [char](1) NOT NULL,
	[sc_status_desc] [varchar](20) NULL,
 CONSTRAINT [PK_SALES_CONTRACT_STATUS] PRIMARY KEY CLUSTERED 
(
	[sc_status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SALES_INVOICE]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SALES_INVOICE](
	[si_no] [varchar](10) NOT NULL,
	[cust_id] [int] NOT NULL,
	[si_date] [datetime] NOT NULL,
	[due_date] [datetime] NULL,
	[si_status] [char](1) NOT NULL,
	[term_code] [varchar](30) NOT NULL,
	[agent_id] [int] NULL,
	[ref_no] [varchar](50) NULL,
	[inv_no] [varchar](20) NULL,
	[dr_no] [varchar](20) NULL,
	[si_item_tot] [money] NULL,
	[si_misc_tot] [money] NULL,
	[si_tot_amt] [money] NOT NULL,
	[ex_tot_amt] [money] NOT NULL,
	[nv_tot_amt] [money] NOT NULL,
	[v_tot_amt] [money] NOT NULL,
	[si_post_amt] [money] NOT NULL,
	[deliver_to] [varchar](100) NULL,
	[approved_by] [varchar](50) NULL,
	[remarks] [varchar](100) NULL,
	[rpk_no] [varchar](10) NULL,
	[price_date] [datetime] NULL,
	[updated_by] [varchar](20) NULL,
	[updated_on] [datetime] NULL,
	[fin_yr] [smallint] NULL,
	[jrnl_id] [int] NULL,
	[si_type] [char](1) NOT NULL,
	[cash_flag] [bit] NULL,
 CONSTRAINT [PK_SALES_INVOICE] PRIMARY KEY CLUSTERED 
(
	[si_no] ASC,
	[si_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SALES_INVOICE_DEFAULT]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SALES_INVOICE_DEFAULT](
	[default_id] [smallint] NOT NULL,
	[misc_desc] [varchar](50) NOT NULL,
	[net_gross_desc] [varchar](50) NOT NULL,
	[misc_percent] [money] NULL,
	[misc_amt] [money] NULL,
	[acct_no] [varchar](10) NULL,
 CONSTRAINT [PK_SALES_INVOICE_DEFAULT] PRIMARY KEY CLUSTERED 
(
	[default_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SALES_INVOICE_DTL]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SALES_INVOICE_DTL](
	[si_no] [varchar](10) NOT NULL,
	[si_dtl_id] [int] NOT NULL,
	[item_id] [int] NOT NULL,
	[whse_id] [smallint] NULL,
	[batch_id] [int] NULL,
	[si_qty] [money] NOT NULL,
	[si_unit] [varchar](10) NOT NULL,
	[served_qty] [money] NOT NULL,
	[si_price] [money] NOT NULL,
	[si_cost] [money] NOT NULL,
	[tax_type] [char](1) NOT NULL,
	[si_amt] [money] NOT NULL,
	[ex_amt] [money] NOT NULL,
	[nv_amt] [money] NOT NULL,
	[v_amt] [money] NOT NULL,
	[c_si_qty] [money] NOT NULL,
	[c_si_price] [money] NOT NULL,
	[c_si_cost] [money] NOT NULL,
	[dtl_remarks] [varchar](100) NULL,
	[source_no] [varchar](100) NULL,
	[source_dtl_id] [int] NULL,
	[rpk_qty] [money] NULL,
	[rpk_unit] [varchar](50) NULL,
	[rpk_cost] [money] NULL,
	[source_type] [varchar](10) NULL,
	[si_type] [char](1) NOT NULL,
 CONSTRAINT [PK_SALES_INVOICE_DTL] PRIMARY KEY CLUSTERED 
(
	[si_no] ASC,
	[si_type] ASC,
	[si_dtl_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SALES_INVOICE_DTL_SUBITEM]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SALES_INVOICE_DTL_SUBITEM](
	[si_no] [varchar](10) NOT NULL,
	[si_dtl_id] [int] NOT NULL,
	[subitem_id] [int] NOT NULL,
	[item_id] [int] NOT NULL,
	[c_si_cost] [money] NOT NULL,
	[c_si_qty] [money] NOT NULL,
	[si_type] [char](1) NOT NULL,
 CONSTRAINT [PK_SALES_INVOICE_DTL_SUBITEM] PRIMARY KEY CLUSTERED 
(
	[si_no] ASC,
	[si_type] ASC,
	[si_dtl_id] ASC,
	[subitem_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SALES_INVOICE_MISC]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SALES_INVOICE_MISC](
	[si_no] [varchar](10) NOT NULL,
	[si_misc_id] [int] NOT NULL,
	[misc_desc] [varchar](50) NOT NULL,
	[net_gross_flag] [char](1) NOT NULL,
	[misc_percent] [money] NULL,
	[misc_amt] [money] NULL,
	[default_id] [smallint] NULL,
	[si_type] [char](1) NOT NULL,
	[acct_no] [varchar](10) NULL,
 CONSTRAINT [PK_SALES_INVOICE_MISC] PRIMARY KEY CLUSTERED 
(
	[si_no] ASC,
	[si_type] ASC,
	[si_misc_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SALES_INVOICE_PROFIT]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SALES_INVOICE_PROFIT](
	[si_no] [varchar](10) NOT NULL,
	[gross_total] [money] NOT NULL,
	[cost_total_orig] [money] NOT NULL,
	[cost_total] [money] NOT NULL,
	[misc_total] [money] NOT NULL,
	[exp_percent] [money] NOT NULL,
	[exp_amt] [money] NOT NULL,
	[rm_amt] [money] NOT NULL,
	[sop_amt] [money] NOT NULL,
	[timbang_amt] [money] NOT NULL,
	[truck_price] [money] NOT NULL,
	[truck_amt] [money] NOT NULL,
	[others_amt] [money] NOT NULL,
	[exp_tot_amt] [money] NOT NULL,
	[agent_id] [int] NULL,
	[comm_percent] [money] NULL,
	[comm_amt] [money] NULL,
	[atax_percent] [money] NULL,
	[atax_amt] [money] NULL,
	[profit_total] [money] NOT NULL,
	[posted_flag] [char](1) NULL,
	[si_type] [char](1) NOT NULL,
 CONSTRAINT [PK_SALES_INVOICE_PROFIT] PRIMARY KEY CLUSTERED 
(
	[si_no] ASC,
	[si_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SALES_INVOICE_STATUS]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SALES_INVOICE_STATUS](
	[si_status] [char](1) NOT NULL,
	[si_status_desc] [varchar](50) NOT NULL,
 CONSTRAINT [PK_SALES_INVOICE_STATUS] PRIMARY KEY CLUSTERED 
(
	[si_status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SALES_INVOICE_TYPE]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SALES_INVOICE_TYPE](
	[si_type] [char](1) NOT NULL,
	[si_type_desc] [varchar](50) NOT NULL,
 CONSTRAINT [PK_SALES_INVOICE_TYPE] PRIMARY KEY CLUSTERED 
(
	[si_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SALES_ORDER]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SALES_ORDER](
	[so_no] [varchar](10) NOT NULL,
	[cust_id] [int] NOT NULL,
	[so_date] [datetime] NOT NULL,
	[so_status] [char](1) NOT NULL,
	[term_code] [varchar](30) NOT NULL,
	[agent_id] [int] NULL,
	[ref_no] [varchar](50) NULL,
	[so_tot_amt] [money] NOT NULL,
	[ex_tot_amt] [money] NOT NULL,
	[nv_tot_amt] [money] NOT NULL,
	[v_tot_amt] [money] NOT NULL,
	[deliver_to] [varchar](100) NULL,
	[approved_by] [varchar](50) NULL,
	[remarks] [varchar](50) NULL,
	[price_date] [datetime] NULL,
	[updated_by] [varchar](20) NULL,
	[updated_on] [datetime] NULL,
 CONSTRAINT [PK_SALES_ORDER] PRIMARY KEY CLUSTERED 
(
	[so_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SALES_ORDER_DTL]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SALES_ORDER_DTL](
	[so_no] [varchar](10) NOT NULL,
	[so_dtl_id] [int] NOT NULL,
	[item_id] [int] NOT NULL,
	[whse_id] [smallint] NOT NULL,
	[batch_id] [int] NULL,
	[so_qty] [money] NOT NULL,
	[so_unit] [varchar](10) NOT NULL,
	[served_qty] [money] NOT NULL,
	[so_price] [money] NOT NULL,
	[so_cost] [money] NOT NULL,
	[tax_type] [char](1) NOT NULL,
	[so_amt] [money] NOT NULL,
	[ex_amt] [money] NOT NULL,
	[nv_amt] [money] NOT NULL,
	[v_amt] [money] NOT NULL,
	[c_so_qty] [money] NOT NULL,
	[c_so_price] [money] NOT NULL,
	[c_so_cost] [money] NOT NULL,
	[dtl_remarks] [varchar](100) NULL,
 CONSTRAINT [PK_SALES_ORDER_DTL] PRIMARY KEY CLUSTERED 
(
	[so_no] ASC,
	[so_dtl_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SALES_ORDER_MISC]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SALES_ORDER_MISC](
	[so_no] [varchar](10) NOT NULL,
	[so_misc_id] [int] NOT NULL,
	[misc_desc] [varchar](50) NOT NULL,
	[net_gross_flag] [char](1) NOT NULL,
	[misc_percent] [money] NULL,
	[misc_amt] [money] NULL,
 CONSTRAINT [PK_SALES_ORDER_MISC] PRIMARY KEY CLUSTERED 
(
	[so_no] ASC,
	[so_misc_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SALES_ORDER_STATUS]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SALES_ORDER_STATUS](
	[so_status] [char](1) NOT NULL,
	[so_status_desc] [varchar](50) NOT NULL,
 CONSTRAINT [PK_SALES_ORDER_STATUS] PRIMARY KEY CLUSTERED 
(
	[so_status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SALES_RETURN]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SALES_RETURN](
	[sr_no] [varchar](10) NOT NULL,
	[cust_id] [int] NOT NULL,
	[sr_date] [datetime] NOT NULL,
	[sr_status] [char](1) NOT NULL,
	[ref_no] [varchar](50) NULL,
	[sr_tot_amt] [money] NOT NULL,
	[ex_tot_amt] [money] NOT NULL,
	[nv_tot_amt] [money] NOT NULL,
	[v_tot_amt] [money] NOT NULL,
	[approved_by] [varchar](50) NULL,
	[remarks] [varchar](50) NULL,
	[cm_no] [varchar](10) NULL,
	[updated_by] [varchar](20) NULL,
	[updated_on] [datetime] NULL,
	[fin_yr] [smallint] NULL,
	[jrnl_id] [int] NULL,
 CONSTRAINT [PK_SALES_RETURN] PRIMARY KEY CLUSTERED 
(
	[sr_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SALES_RETURN_DTL]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SALES_RETURN_DTL](
	[sr_no] [varchar](10) NOT NULL,
	[sr_dtl_id] [int] NOT NULL,
	[item_id] [int] NOT NULL,
	[whse_id] [smallint] NOT NULL,
	[batch_id] [int] NOT NULL,
	[sr_qty] [money] NOT NULL,
	[sr_unit] [varchar](10) NOT NULL,
	[sr_price] [money] NOT NULL,
	[sr_cost] [money] NOT NULL,
	[tax_type] [char](1) NOT NULL,
	[sr_amt] [money] NOT NULL,
	[ex_amt] [money] NOT NULL,
	[nv_amt] [money] NOT NULL,
	[v_amt] [money] NOT NULL,
	[c_sr_qty] [money] NOT NULL,
	[c_sr_price] [money] NOT NULL,
	[c_sr_cost] [money] NOT NULL,
	[dtl_remarks] [varchar](100) NULL,
	[source_no] [varchar](100) NULL,
	[source_dtl_id] [int] NULL,
 CONSTRAINT [PK_SALES_RETURN_DTL] PRIMARY KEY CLUSTERED 
(
	[sr_no] ASC,
	[sr_dtl_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SALES_RETURN_STATUS]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SALES_RETURN_STATUS](
	[sr_status] [char](1) NOT NULL,
	[sr_status_desc] [varchar](50) NOT NULL,
 CONSTRAINT [PK_SALES_RETURN_STATUS] PRIMARY KEY CLUSTERED 
(
	[sr_status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SCAN_STOCK_ISSUANCE]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SCAN_STOCK_ISSUANCE](
	[scan_id] [varchar](14) NOT NULL,
	[iss_date] [datetime] NOT NULL,
	[whse_id] [smallint] NOT NULL,
	[cust_id] [int] NULL,
	[remarks] [varchar](50) NULL,
	[post_flag] [bit] NULL,
 CONSTRAINT [PK_SCAN_STOCK_ISSUANCE] PRIMARY KEY CLUSTERED 
(
	[scan_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SCAN_STOCK_ISSUANCE_DTL]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SCAN_STOCK_ISSUANCE_DTL](
	[scan_id] [varchar](14) NOT NULL,
	[scan_dtl_id] [smallint] NOT NULL,
	[item_id] [int] NOT NULL,
	[scan_qty] [money] NOT NULL,
	[post_flag] [bit] NULL,
 CONSTRAINT [PK_SCAN_STOCK_ISSUANCE_DTL] PRIMARY KEY CLUSTERED 
(
	[scan_id] ASC,
	[scan_dtl_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SCAN_STOCK_RECEIPT]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SCAN_STOCK_RECEIPT](
	[scan_id] [varchar](14) NOT NULL,
	[po_no] [varchar](10) NOT NULL,
	[rcpt_date] [datetime] NOT NULL,
	[ref_no] [varchar](50) NULL,
	[received_by] [varchar](50) NULL,
	[post_flag] [bit] NULL,
 CONSTRAINT [PK_SCAN_STOCK_RECEIPT] PRIMARY KEY CLUSTERED 
(
	[scan_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SCAN_STOCK_RECEIPT_DTL]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SCAN_STOCK_RECEIPT_DTL](
	[scan_id] [varchar](14) NOT NULL,
	[scan_dtl_id] [smallint] NOT NULL,
	[item_id] [int] NOT NULL,
	[scan_qty] [money] NOT NULL,
	[post_flag] [bit] NULL,
 CONSTRAINT [PK_SCAN_STOCK_RECEIPT_DTL] PRIMARY KEY CLUSTERED 
(
	[scan_id] ASC,
	[scan_dtl_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SOA]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SOA](
	[soa_no] [varchar](10) NOT NULL,
	[soa_type] [char](1) NOT NULL,
	[cust_id] [int] NOT NULL,
	[soa_date] [datetime] NOT NULL,
	[due_date] [datetime] NULL,
	[soa_status] [char](1) NOT NULL,
	[term_code] [varchar](30) NOT NULL,
	[soa_tot_amt] [money] NULL,
	[remarks] [varchar](100) NULL,
	[si_no] [varchar](10) NULL,
	[updated_by] [varchar](20) NULL,
	[updated_on] [datetime] NULL,
	[soa_dr_tot] [money] NULL,
	[soa_misc_tot] [money] NULL,
 CONSTRAINT [PK_SOA] PRIMARY KEY CLUSTERED 
(
	[soa_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SOA_DTL]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SOA_DTL](
	[soa_no] [varchar](50) NOT NULL,
	[iss_no] [varchar](10) NOT NULL,
 CONSTRAINT [PK_SOA_DTL_1] PRIMARY KEY CLUSTERED 
(
	[soa_no] ASC,
	[iss_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SOA_DTL_DR_DTL]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SOA_DTL_DR_DTL](
	[soa_no] [varchar](10) NOT NULL,
	[iss_no] [varchar](10) NOT NULL,
	[iss_dtl_id] [int] NOT NULL,
	[iss_cost] [money] NULL,
	[iss_amt] [money] NULL,
 CONSTRAINT [PK_SOA_DTL_DR_DTL] PRIMARY KEY CLUSTERED 
(
	[soa_no] ASC,
	[iss_no] ASC,
	[iss_dtl_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SOA_MISC]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SOA_MISC](
	[soa_no] [varchar](10) NOT NULL,
	[soa_misc_id] [int] NOT NULL,
	[misc_desc] [varchar](50) NOT NULL,
	[net_gross_flag] [char](1) NOT NULL,
	[misc_percent] [money] NULL,
	[misc_amt] [money] NULL,
	[default_id] [smallint] NULL,
 CONSTRAINT [PK_SOA_MISC] PRIMARY KEY CLUSTERED 
(
	[soa_no] ASC,
	[soa_misc_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SOA_STATUS]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SOA_STATUS](
	[soa_status] [char](1) NOT NULL,
	[soa_status_desc] [varchar](20) NULL,
 CONSTRAINT [PK_SOA_STATUS] PRIMARY KEY CLUSTERED 
(
	[soa_status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SOA_TYPE]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SOA_TYPE](
	[soa_type] [char](1) NOT NULL,
	[soa_type_desc] [varchar](50) NULL,
 CONSTRAINT [PK_SOA_TYPE] PRIMARY KEY CLUSTERED 
(
	[soa_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[STOCK_ADJUSTMENT]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[STOCK_ADJUSTMENT](
	[adj_no] [varchar](10) NOT NULL,
	[whse_id] [smallint] NOT NULL,
	[adj_date] [datetime] NOT NULL,
	[adj_status] [char](1) NOT NULL,
	[adj_tot_amt] [money] NOT NULL,
	[ex_tot_amt] [money] NOT NULL,
	[nv_tot_amt] [money] NOT NULL,
	[v_tot_amt] [money] NOT NULL,
	[remarks] [varchar](50) NULL,
	[begin_flag] [char](1) NULL,
	[updated_by] [varchar](20) NULL,
	[updated_on] [datetime] NULL,
	[fin_yr] [smallint] NULL,
	[jrnl_id] [int] NULL,
 CONSTRAINT [PK_STOCK_ADJUSTMENT] PRIMARY KEY CLUSTERED 
(
	[adj_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[STOCK_ADJUSTMENT_DTL]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[STOCK_ADJUSTMENT_DTL](
	[adj_no] [varchar](10) NOT NULL,
	[adj_dtl_id] [int] NOT NULL,
	[item_id] [int] NOT NULL,
	[batch_id] [int] NOT NULL,
	[adj_qty] [money] NOT NULL,
	[adj_tot_qty] [money] NOT NULL,
	[adj_unit] [varchar](10) NOT NULL,
	[adj_cost] [money] NOT NULL,
	[tax_type] [char](1) NOT NULL,
	[adj_amt] [money] NOT NULL,
	[ex_amt] [money] NOT NULL,
	[nv_amt] [money] NOT NULL,
	[v_amt] [money] NOT NULL,
	[c_adj_qty] [money] NOT NULL,
	[c_adj_tot_qty] [money] NOT NULL,
	[c_adj_cost] [money] NOT NULL,
	[dtl_remarks] [varchar](100) NULL,
 CONSTRAINT [PK_STOCK_ADJUSTMENT_DTL] PRIMARY KEY CLUSTERED 
(
	[adj_no] ASC,
	[adj_dtl_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[STOCK_ADJUSTMENT_DTL_SUBITEM]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[STOCK_ADJUSTMENT_DTL_SUBITEM](
	[adj_no] [varchar](10) NOT NULL,
	[adj_dtl_id] [int] NOT NULL,
	[subitem_id] [int] NOT NULL,
	[item_id] [int] NOT NULL,
	[c_adj_cost] [money] NOT NULL,
	[c_adj_qty] [money] NOT NULL,
 CONSTRAINT [PK_STOCK_ADJUSTMENT_DTL_SUBITEM] PRIMARY KEY CLUSTERED 
(
	[adj_no] ASC,
	[adj_dtl_id] ASC,
	[subitem_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[STOCK_ADJUSTMENT_STATUS]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[STOCK_ADJUSTMENT_STATUS](
	[adj_status] [char](1) NOT NULL,
	[adj_status_desc] [varchar](50) NOT NULL,
 CONSTRAINT [PK_STOCK_ADJUSTMENT_STATUS] PRIMARY KEY CLUSTERED 
(
	[adj_status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[STOCK_ISSUANCE]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[STOCK_ISSUANCE](
	[iss_no] [varchar](10) NOT NULL,
	[whse_id] [smallint] NOT NULL,
	[dest_type] [char](1) NOT NULL,
	[dest_id] [int] NULL,
	[iss_date] [datetime] NOT NULL,
	[iss_status] [char](1) NOT NULL,
	[iss_tot_amt] [money] NOT NULL,
	[ex_tot_amt] [money] NOT NULL,
	[nv_tot_amt] [money] NOT NULL,
	[v_tot_amt] [money] NOT NULL,
	[remarks] [varchar](50) NULL,
	[updated_by] [varchar](20) NULL,
	[updated_on] [datetime] NULL,
	[fin_yr] [smallint] NULL,
	[jrnl_id] [int] NULL,
 CONSTRAINT [PK_STOCK_ISSUANCE] PRIMARY KEY CLUSTERED 
(
	[iss_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[STOCK_ISSUANCE_DESTINATION]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[STOCK_ISSUANCE_DESTINATION](
	[dest_type] [char](1) NOT NULL,
	[dest_type_desc] [varchar](50) NOT NULL,
 CONSTRAINT [PK_STOCK_ISSUANCE_DESTINATION] PRIMARY KEY CLUSTERED 
(
	[dest_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[STOCK_ISSUANCE_DTL]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[STOCK_ISSUANCE_DTL](
	[iss_no] [varchar](10) NOT NULL,
	[iss_dtl_id] [int] NOT NULL,
	[item_id] [int] NOT NULL,
	[batch_id] [int] NOT NULL,
	[iss_qty] [money] NOT NULL,
	[iss_unit] [varchar](10) NOT NULL,
	[served_qty] [money] NOT NULL,
	[iss_cost] [money] NOT NULL,
	[tax_type] [char](1) NOT NULL,
	[iss_amt] [money] NOT NULL,
	[ex_amt] [money] NOT NULL,
	[nv_amt] [money] NOT NULL,
	[v_amt] [money] NOT NULL,
	[c_iss_qty] [money] NOT NULL,
	[c_iss_cost] [money] NOT NULL,
	[dtl_remarks] [varchar](100) NULL,
	[scan_id] [varchar](14) NULL,
	[scan_dtl_id] [smallint] NULL,
 CONSTRAINT [PK_STOCK_ISSUANCE_DTL] PRIMARY KEY CLUSTERED 
(
	[iss_no] ASC,
	[iss_dtl_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[STOCK_ISSUANCE_DTL_RESERVATION]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[STOCK_ISSUANCE_DTL_RESERVATION](
	[iss_no] [varchar](10) NOT NULL,
	[iss_dtl_id] [smallint] NOT NULL,
	[dtl_id] [smallint] NOT NULL,
	[res_no] [varchar](10) NOT NULL,
	[res_dtl_id] [smallint] NOT NULL,
	[res_qty] [money] NOT NULL,
 CONSTRAINT [PK_STOCK_ISSUANCE_DTL_RESERVATION] PRIMARY KEY CLUSTERED 
(
	[iss_no] ASC,
	[iss_dtl_id] ASC,
	[dtl_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[STOCK_ISSUANCE_DTL_SUBITEM]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[STOCK_ISSUANCE_DTL_SUBITEM](
	[iss_no] [varchar](10) NOT NULL,
	[iss_dtl_id] [int] NOT NULL,
	[subitem_id] [int] NOT NULL,
	[item_id] [int] NOT NULL,
	[c_iss_cost] [money] NOT NULL,
	[c_iss_qty] [money] NOT NULL,
 CONSTRAINT [PK_STOCK_ISSUANCE_DTL_SUBITEM] PRIMARY KEY CLUSTERED 
(
	[iss_no] ASC,
	[iss_dtl_id] ASC,
	[subitem_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[STOCK_ISSUANCE_STATUS]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[STOCK_ISSUANCE_STATUS](
	[iss_status] [char](1) NOT NULL,
	[iss_status_desc] [varchar](50) NOT NULL,
 CONSTRAINT [PK_STOCK_ISSUANCE_STATUS] PRIMARY KEY CLUSTERED 
(
	[iss_status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[STOCK_PROCESSING]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[STOCK_PROCESSING](
	[proc_no] [varchar](10) NOT NULL,
	[proc_type] [char](1) NOT NULL,
	[proc_date] [datetime] NOT NULL,
	[proc_status] [char](1) NOT NULL,
	[whse_id] [smallint] NOT NULL,
	[item_id] [int] NOT NULL,
	[batch_id] [int] NOT NULL,
	[proc_qty] [money] NOT NULL,
	[proc_unit] [varchar](10) NOT NULL,
	[proc_cost] [money] NOT NULL,
	[proc_amt] [money] NOT NULL,
	[c_proc_qty] [money] NULL,
	[c_proc_cost] [money] NULL,
	[proc_dtl_amt] [money] NULL,
	[proc_exp_amt] [money] NULL,
	[remarks] [varchar](100) NULL,
	[updated_by] [varchar](20) NULL,
	[updated_on] [datetime] NULL,
	[fin_yr] [smallint] NULL,
	[jrnl_id] [int] NULL,
 CONSTRAINT [PK_STOCK_PROCESSING] PRIMARY KEY CLUSTERED 
(
	[proc_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[STOCK_PROCESSING_DTL]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[STOCK_PROCESSING_DTL](
	[proc_no] [varchar](10) NOT NULL,
	[proc_dtl_id] [int] NOT NULL,
	[whse_id] [smallint] NOT NULL,
	[item_id] [int] NOT NULL,
	[batch_id] [int] NOT NULL,
	[dtl_qty] [money] NOT NULL,
	[dtl_unit] [varchar](10) NOT NULL,
	[dtl_cost] [money] NOT NULL,
	[dtl_amt] [money] NOT NULL,
	[c_dtl_qty] [money] NOT NULL,
	[c_dtl_cost] [money] NOT NULL,
	[dtl_remarks] [varchar](50) NULL,
 CONSTRAINT [PK_STOCK_PROCESSING_DTL] PRIMARY KEY CLUSTERED 
(
	[proc_no] ASC,
	[proc_dtl_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[STOCK_PROCESSING_EXP]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[STOCK_PROCESSING_EXP](
	[proc_no] [varchar](10) NOT NULL,
	[proc_exp_id] [int] NOT NULL,
	[exp_desc] [varchar](100) NOT NULL,
	[acct_no] [varchar](10) NOT NULL,
	[exp_amt] [money] NOT NULL,
 CONSTRAINT [PK_STOCK_PROCESSING_EXP] PRIMARY KEY CLUSTERED 
(
	[proc_no] ASC,
	[proc_exp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[STOCK_PROCESSING_STATUS]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[STOCK_PROCESSING_STATUS](
	[proc_status] [char](1) NOT NULL,
	[proc_status_desc] [varchar](50) NULL,
 CONSTRAINT [PK_STOCK_PROCESSING_STATUS] PRIMARY KEY CLUSTERED 
(
	[proc_status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[STOCK_PROCESSING_TYPE]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[STOCK_PROCESSING_TYPE](
	[proc_type] [char](1) NOT NULL,
	[proc_type_desc] [varchar](50) NULL,
 CONSTRAINT [PK_STOCK_PROCESSING_TYPE] PRIMARY KEY CLUSTERED 
(
	[proc_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[STOCK_RECEIPT]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[STOCK_RECEIPT](
	[rcpt_no] [varchar](10) NOT NULL,
	[whse_id] [smallint] NOT NULL,
	[source_type] [char](1) NOT NULL,
	[source_id] [int] NULL,
	[source_no] [varchar](10) NULL,
	[rcpt_date] [datetime] NOT NULL,
	[rcpt_status] [char](1) NOT NULL,
	[rcpt_tot_amt] [money] NOT NULL,
	[ex_tot_amt] [money] NOT NULL,
	[nv_tot_amt] [money] NOT NULL,
	[v_tot_amt] [money] NOT NULL,
	[ref_no] [varchar](50) NULL,
	[received_by] [varchar](50) NULL,
	[remarks] [varchar](50) NULL,
	[fin_yr] [smallint] NULL,
	[jrnl_id] [int] NULL,
	[updated_by] [varchar](20) NULL,
	[updated_on] [datetime] NULL
) ON [PRIMARY]
SET ANSI_PADDING OFF
ALTER TABLE [dbo].[STOCK_RECEIPT] ADD [rcpt_grp_code] [varchar](50) NULL
ALTER TABLE [dbo].[STOCK_RECEIPT] ADD [hauler_id] [int] NULL
SET ANSI_PADDING ON
ALTER TABLE [dbo].[STOCK_RECEIPT] ADD [hauler_truck_no] [varchar](50) NULL
ALTER TABLE [dbo].[STOCK_RECEIPT] ADD [hauler_dr_no] [varchar](50) NULL
ALTER TABLE [dbo].[STOCK_RECEIPT] ADD [hauler_length] [numeric](18, 4) NULL
ALTER TABLE [dbo].[STOCK_RECEIPT] ADD [hauler_width] [numeric](18, 4) NULL
ALTER TABLE [dbo].[STOCK_RECEIPT] ADD [hauler_height] [numeric](18, 4) NULL
ALTER TABLE [dbo].[STOCK_RECEIPT] ADD [hauler_cbm] [numeric](18, 4) NULL
ALTER TABLE [dbo].[STOCK_RECEIPT] ADD [hauler_gross] [numeric](18, 4) NULL
ALTER TABLE [dbo].[STOCK_RECEIPT] ADD [hauler_tare] [numeric](18, 4) NULL
ALTER TABLE [dbo].[STOCK_RECEIPT] ADD [hauler_net] [numeric](18, 4) NULL
 CONSTRAINT [PK_STOCK_RECEIPT] PRIMARY KEY CLUSTERED 
(
	[rcpt_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[STOCK_RECEIPT_DTL]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[STOCK_RECEIPT_DTL](
	[rcpt_no] [varchar](10) NOT NULL,
	[rcpt_dtl_id] [int] NOT NULL,
	[item_id] [int] NOT NULL,
	[batch_id] [int] NOT NULL,
	[rcpt_qty] [money] NOT NULL,
	[rcpt_unit] [varchar](10) NOT NULL,
	[served_qty] [money] NOT NULL,
	[rcpt_price] [money] NOT NULL,
	[rcpt_cost] [money] NOT NULL,
	[tax_type] [char](1) NOT NULL,
	[rcpt_amt] [money] NOT NULL,
	[ex_amt] [money] NOT NULL,
	[nv_amt] [money] NOT NULL,
	[v_amt] [money] NOT NULL,
	[c_rcpt_qty] [money] NOT NULL,
	[c_rcpt_cost] [money] NOT NULL,
	[dtl_remarks] [varchar](100) NULL,
	[source_dtl_id] [int] NULL,
	[scan_id] [varchar](14) NULL,
	[scan_dtl_id] [smallint] NULL,
	[rcpt_net_price] [money] NULL,
	[rcpt_disc] [money] NULL,
	[c_rcpt_net_price] [money] NULL,
	[c_rcpt_disc] [money] NULL,
 CONSTRAINT [PK_STOCK_RECEIPT_DTL] PRIMARY KEY CLUSTERED 
(
	[rcpt_no] ASC,
	[rcpt_dtl_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[STOCK_RECEIPT_DTL_SUBITEM]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[STOCK_RECEIPT_DTL_SUBITEM](
	[rcpt_no] [varchar](10) NOT NULL,
	[rcpt_dtl_id] [int] NOT NULL,
	[subitem_id] [int] NOT NULL,
	[item_id] [int] NOT NULL,
	[c_rcpt_cost] [money] NOT NULL,
	[c_rcpt_qty] [money] NOT NULL,
 CONSTRAINT [PK_STOCK_RECEIPT_DTL_SUBITEM] PRIMARY KEY CLUSTERED 
(
	[rcpt_no] ASC,
	[rcpt_dtl_id] ASC,
	[subitem_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[STOCK_RECEIPT_GROUP]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[STOCK_RECEIPT_GROUP](
	[rcpt_grp_code] [varchar](50) NOT NULL,
	[rcpt_grp_desc] [varchar](100) NULL,
 CONSTRAINT [PK_STOCK_RECEIPT_GROUP] PRIMARY KEY CLUSTERED 
(
	[rcpt_grp_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[STOCK_RECEIPT_HAULER]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[STOCK_RECEIPT_HAULER](
	[hauler_id] [int] IDENTITY(1,1) NOT NULL,
	[hauler_name] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[STOCK_RECEIPT_HAULER_TRUCK_NO]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[STOCK_RECEIPT_HAULER_TRUCK_NO](
	[hauler_id] [int] NULL,
	[hauler_truck_no] [varchar](50) NULL,
	[hauler_truck_length] [money] NULL,
	[hauler_truck_width] [money] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[STOCK_RECEIPT_MISC]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[STOCK_RECEIPT_MISC](
	[rcpt_no] [varchar](10) NOT NULL,
	[rcpt_misc_id] [int] NOT NULL,
	[misc_desc] [varchar](50) NOT NULL,
	[net_gross_flag] [char](1) NOT NULL,
	[misc_percent] [money] NULL,
	[misc_amt] [money] NULL,
 CONSTRAINT [PK_STOCK_RECEIPT_MISC] PRIMARY KEY CLUSTERED 
(
	[rcpt_no] ASC,
	[rcpt_misc_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[STOCK_RECEIPT_SOURCE]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[STOCK_RECEIPT_SOURCE](
	[source_type] [char](1) NOT NULL,
	[source_type_desc] [varchar](50) NOT NULL,
 CONSTRAINT [PK_STOCK_RECEIPT_SOURCE] PRIMARY KEY CLUSTERED 
(
	[source_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[STOCK_RECEIPT_STATUS]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[STOCK_RECEIPT_STATUS](
	[rcpt_status] [char](1) NOT NULL,
	[rcpt_status_desc] [varchar](50) NOT NULL,
 CONSTRAINT [PK_STOCK_RECEIPT_STATUS] PRIMARY KEY CLUSTERED 
(
	[rcpt_status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[STOCK_RESERVATION]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[STOCK_RESERVATION](
	[res_no] [varchar](10) NOT NULL,
	[cust_id] [int] NOT NULL,
	[res_date] [datetime] NOT NULL,
	[res_status] [char](1) NOT NULL,
	[approved_by] [varchar](50) NULL,
	[remarks] [varchar](50) NULL,
	[updated_by] [varchar](20) NULL,
	[updated_on] [datetime] NULL,
 CONSTRAINT [PK_STOCK_RESERVATION] PRIMARY KEY CLUSTERED 
(
	[res_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[STOCK_RESERVATION_DTL]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[STOCK_RESERVATION_DTL](
	[res_no] [varchar](10) NOT NULL,
	[res_dtl_id] [int] NOT NULL,
	[item_id] [int] NOT NULL,
	[whse_id] [smallint] NOT NULL,
	[batch_id] [int] NOT NULL,
	[res_qty] [money] NOT NULL,
	[res_unit] [varchar](10) NOT NULL,
	[served_qty] [money] NOT NULL,
	[c_res_qty] [money] NOT NULL,
	[dtl_remarks] [varchar](100) NULL,
 CONSTRAINT [PK_STOCK_RESERVATION_DTL] PRIMARY KEY CLUSTERED 
(
	[res_no] ASC,
	[res_dtl_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[STOCK_RESERVATION_STATUS]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[STOCK_RESERVATION_STATUS](
	[res_status] [char](1) NOT NULL,
	[res_status_desc] [varchar](50) NOT NULL,
 CONSTRAINT [PK_STOCK_RESERVATION_STATUS] PRIMARY KEY CLUSTERED 
(
	[res_status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SUPPLIER]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SUPPLIER](
	[supp_id] [int] NOT NULL,
	[supp_code] [varchar](30) NOT NULL,
	[supp_name] [varchar](100) NOT NULL,
	[active_flag] [char](1) NOT NULL,
	[supp_grp] [varchar](50) NULL,
	[term_code] [varchar](30) NOT NULL,
	[supp_address] [varchar](200) NULL,
	[supp_tel1] [varchar](50) NULL,
	[supp_tel2] [varchar](50) NULL,
	[check_pay_to] [varchar](100) NULL,
	[acct_no] [varchar](10) NULL,
	[supp_tin] [varchar](50) NULL,
	[updated_by] [varchar](20) NULL,
	[updated_on] [datetime] NULL,
	[ewtax_percent] [money] NULL,
	[atc_code] [varchar](20) NULL,
 CONSTRAINT [PK_SUPPLIER] PRIMARY KEY CLUSTERED 
(
	[supp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SUPPLIER_BALANCE]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUPPLIER_BALANCE](
	[supp_id] [int] NOT NULL,
	[supp_balance] [money] NOT NULL,
 CONSTRAINT [PK_SUPPLIER_BALANCE] PRIMARY KEY CLUSTERED 
(
	[supp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SUPPLIER_BALANCE_HISTORY]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SUPPLIER_BALANCE_HISTORY](
	[supp_id] [int] NOT NULL,
	[hist_date] [datetime] NOT NULL,
	[txn_type] [varchar](20) NOT NULL,
	[txn_no] [varchar](10) NOT NULL,
	[txn_date] [datetime] NOT NULL,
	[txn_amt] [money] NOT NULL,
	[run_balance] [money] NOT NULL,
	[remarks] [varchar](100) NULL,
	[ref_1] [varchar](100) NULL,
 CONSTRAINT [PK_SUPPLIER_BALANCE_HISTORY] PRIMARY KEY CLUSTERED 
(
	[supp_id] ASC,
	[hist_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SUPPLIER_CONTACT]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SUPPLIER_CONTACT](
	[supp_id] [int] NOT NULL,
	[contact_name] [varchar](100) NOT NULL,
	[contact_address] [varchar](200) NULL,
	[contact_no] [varchar](100) NULL,
 CONSTRAINT [PK_SUPPLIER_CONTACTS] PRIMARY KEY CLUSTERED 
(
	[supp_id] ASC,
	[contact_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SUPPLIER_ITEM_HISTORY]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SUPPLIER_ITEM_HISTORY](
	[supp_id] [int] NOT NULL,
	[item_id] [int] NOT NULL,
	[txn_type] [varchar](20) NOT NULL,
	[txn_no] [varchar](10) NOT NULL,
	[txn_dtl_id] [int] NOT NULL,
	[txn_date] [datetime] NULL,
	[txn_qty] [money] NULL,
	[unit_code] [varchar](10) NULL,
	[unit_price] [money] NULL,
	[net_price] [money] NULL,
	[txn_amt] [money] NULL,
	[tax_type] [char](1) NULL,
	[batch_id] [int] NULL,
	[updated_by] [varchar](20) NULL,
	[updated_on] [datetime] NULL,
 CONSTRAINT [PK_SUPPLIER_ITEM_HISTORY] PRIMARY KEY CLUSTERED 
(
	[supp_id] ASC,
	[item_id] ASC,
	[txn_type] ASC,
	[txn_no] ASC,
	[txn_dtl_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SYSTEM_SETTING]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SYSTEM_SETTING](
	[rpt_path] [varchar](200) NULL,
	[logout_min] [smallint] NULL,
	[vat_percent] [money] NULL,
	[agent_tax_percent] [money] NULL,
	[gl_flag] [bit] NULL,
	[gl_db] [varchar](100) NULL,
	[batch_flag] [bit] NULL,
	[barcode_config_path] [varchar](255) NULL,
	[barcode_prefix] [varchar](50) NULL,
	[barcode_length] [int] NULL,
	[next_no] [int] NULL,
	[auto_update_flag] [bit] NULL,
	[update_path] [varchar](200) NULL,
	[run_as_flag] [bit] NULL,
	[update_run_as] [varchar](50) NULL,
	[update_run_domain] [varchar](50) NULL,
	[update_run_pass] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SYSTEM_SETTING_USER]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SYSTEM_SETTING_USER](
	[user_id] [smallint] NOT NULL,
	[acct_period] [varchar](6) NULL,
	[section_code] [varchar](50) NULL,
	[reminder_flag] [bit] NULL,
	[reminder_refresh_flag] [bit] NULL,
	[reminder_refresh_sec] [smallint] NULL,
 CONSTRAINT [PK_SYSTEM_SETTING_USER] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SYSTEM_SETTING_USER_REMINDER]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SYSTEM_SETTING_USER_REMINDER](
	[user_id] [smallint] NOT NULL,
	[reminder_id] [smallint] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TAX_TYPE]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TAX_TYPE](
	[tax_type] [char](1) NOT NULL,
	[tax_type_desc] [varchar](30) NOT NULL,
 CONSTRAINT [PK_TAX_TYPE] PRIMARY KEY CLUSTERED 
(
	[tax_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TERMS]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TERMS](
	[term_code] [varchar](30) NOT NULL,
	[term_desc] [varchar](100) NOT NULL,
	[term_days] [smallint] NOT NULL,
 CONSTRAINT [PK_TERMS] PRIMARY KEY CLUSTERED 
(
	[term_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TRUCK_SCALE]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRUCK_SCALE](
	[weight_data] [money] NULL,
	[weight_data2] [money] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TXN_TYPE]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TXN_TYPE](
	[txn_type] [varchar](20) NOT NULL,
	[txn_desc] [varchar](50) NULL,
	[txn_prefix] [varchar](4) NULL,
	[txn_no] [int] NOT NULL,
	[updated_by] [varchar](20) NULL,
	[updated_on] [datetime] NULL,
 CONSTRAINT [PK_TXN_TYPE] PRIMARY KEY CLUSTERED 
(
	[txn_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UNIT]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UNIT](
	[unit_code] [varchar](10) NOT NULL,
	[unit_desc] [varchar](50) NULL,
 CONSTRAINT [PK_UNIT] PRIMARY KEY CLUSTERED 
(
	[unit_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[USER]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[USER](
	[user_id] [smallint] NOT NULL,
	[user_logon] [varchar](30) NOT NULL,
	[user_name] [varchar](100) NOT NULL,
	[user_pass] [nvarchar](50) NOT NULL,
	[group_id] [smallint] NULL,
	[active_flag] [char](1) NULL,
	[agent_id] [smallint] NULL,
 CONSTRAINT [PK_USER] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[USER_GROUP]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[USER_GROUP](
	[group_id] [smallint] NOT NULL,
	[group_desc] [varchar](100) NOT NULL,
 CONSTRAINT [PK_USER_GROUP] PRIMARY KEY CLUSTERED 
(
	[group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[USER_GROUP_ROLES]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USER_GROUP_ROLES](
	[group_id] [smallint] NOT NULL,
	[role_id] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[USER_ROLES]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USER_ROLES](
	[user_id] [smallint] NOT NULL,
	[role_id] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[VERSION]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VERSION](
	[ver_id] [smallint] NOT NULL,
	[ver_code] [varchar](50) NOT NULL,
 CONSTRAINT [PK_VERSION] PRIMARY KEY CLUSTERED 
(
	[ver_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[WAREHOUSE]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WAREHOUSE](
	[whse_id] [smallint] NOT NULL,
	[whse_name] [varchar](50) NOT NULL,
	[default_flag] [smallint] NULL,
	[plant_flag] [smallint] NULL,
	[updated_by] [varchar](20) NULL,
	[updated_on] [datetime] NULL,
 CONSTRAINT [PK_WAREHOUSE] PRIMARY KEY CLUSTERED 
(
	[whse_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[WHSE_BO_BALANCE]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WHSE_BO_BALANCE](
	[item_id] [int] NOT NULL,
	[whse_id] [smallint] NOT NULL,
	[txn_type] [varchar](20) NOT NULL,
	[txn_no] [varchar](10) NOT NULL,
	[txn_date] [datetime] NOT NULL,
	[txn_qty] [money] NOT NULL,
	[txn_cost] [money] NOT NULL,
	[batch_code] [varchar](50) NULL,
 CONSTRAINT [PK_WHSE_BO_BALANCE] PRIMARY KEY CLUSTERED 
(
	[item_id] ASC,
	[whse_id] ASC,
	[txn_type] ASC,
	[txn_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[WHSE_ITEM_BALANCE]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WHSE_ITEM_BALANCE](
	[item_id] [int] NOT NULL,
	[whse_id] [smallint] NOT NULL,
	[txn_type] [char](20) NOT NULL,
	[txn_no] [varchar](10) NOT NULL,
	[txn_date] [datetime] NOT NULL,
	[txn_qty] [money] NOT NULL,
	[unit_cost] [money] NOT NULL,
	[batch_id] [int] NOT NULL,
 CONSTRAINT [PK_WHSE_ITEM_BALANCE] PRIMARY KEY CLUSTERED 
(
	[item_id] ASC,
	[whse_id] ASC,
	[txn_type] ASC,
	[txn_no] ASC,
	[batch_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[WHSE_ITEM_BATCH]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WHSE_ITEM_BATCH](
	[batch_id] [int] NOT NULL,
	[batch_code] [varchar](30) NOT NULL,
	[item_id] [int] NOT NULL,
	[supp_id] [int] NULL,
	[mill_date] [datetime] NULL,
	[rcvd_date] [datetime] NULL,
	[harvest_season] [datetime] NULL,
	[whole_ratio] [money] NULL,
	[moisture_content] [money] NULL,
	[remarks] [varchar](100) NULL,
	[custom_field1] [varchar](50) NULL,
	[custom_field2] [varchar](50) NULL,
	[custom_field3] [varchar](50) NULL,
	[active_flag] [char](1) NULL,
	[updated_by] [varchar](20) NULL,
	[updated_on] [datetime] NULL,
	[unit_cost] [money] NULL,
 CONSTRAINT [PK_WHSE_ITEM_BATCH] PRIMARY KEY CLUSTERED 
(
	[batch_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[WHSE_ITEM_RESERVATION]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WHSE_ITEM_RESERVATION](
	[cust_id] [int] NOT NULL,
	[item_id] [int] NOT NULL,
	[whse_id] [smallint] NOT NULL,
	[txn_qty] [money] NOT NULL,
	[batch_id] [int] NOT NULL,
 CONSTRAINT [PK_WHSE_ITEM_RESERVATION] PRIMARY KEY CLUSTERED 
(
	[cust_id] ASC,
	[item_id] ASC,
	[whse_id] ASC,
	[batch_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WHSE_ITEM_STOCKCARD]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WHSE_ITEM_STOCKCARD](
	[item_id] [int] NOT NULL,
	[whse_id] [smallint] NOT NULL,
	[batch_id] [int] NOT NULL,
	[sc_date] [datetime] NOT NULL,
	[inout_flag] [char](1) NOT NULL,
	[txn_type] [varchar](20) NOT NULL,
	[txn_no] [varchar](10) NOT NULL,
	[txn_dest_type] [varchar](5) NULL,
	[txn_dest_id] [int] NULL,
	[txn_date] [datetime] NOT NULL,
	[txn_dtl_id] [int] NOT NULL,
	[txn_qty] [money] NOT NULL,
	[txn_cost] [money] NOT NULL,
	[whse_batch_balance] [money] NOT NULL,
	[batch_run_balance] [money] NOT NULL,
	[whse_run_balance] [money] NOT NULL,
	[sc_remarks] [varchar](100) NULL,
	[from_item_id] [int] NULL,
 CONSTRAINT [PK_WHSE_ITEM_STOCKCARD] PRIMARY KEY CLUSTERED 
(
	[item_id] ASC,
	[whse_id] ASC,
	[batch_id] ASC,
	[sc_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[WORK_SCHEDULE]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WORK_SCHEDULE](
	[int_workscheduleid] [int] IDENTITY(1,1) NOT NULL,
	[dte_workschedule] [date] NULL,
	[int_worktype] [int] NULL,
	[str_scheduledby] [varchar](50) NULL,
	[dec_totalqty] [decimal](18, 4) NULL,
	[str_updatedby] [varchar](50) NULL,
	[dte_updateddatetime] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[WORK_SCHEDULE_DTL]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WORK_SCHEDULE_DTL](
	[int_workscheduleid] [int] NULL,
	[int_workschedule_dtl_id] [int] IDENTITY(1,1) NOT NULL,
	[cust_id] [int] NULL,
	[sc_no] [varchar](10) NULL,
	[sc_ref] [varchar](20) NULL,
	[jobsite_id] [int] NULL,
	[item_id] [int] NULL,
	[item_qty] [decimal](18, 4) NULL,
	[sc_unit] [varchar](10) NULL,
	[job_desc_slump] [varchar](50) NULL,
	[str_distance] [varchar](50) NULL,
	[str_remarks] [varchar](100) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[WORK_SCHEDULE_TYPE]    Script Date: 5/24/2019 11:51:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WORK_SCHEDULE_TYPE](
	[int_worktype] [int] NULL,
	[str_worktypedesc] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[CUSTOMER] ADD  CONSTRAINT [DF_CUSTOMER_vat_type_id]  DEFAULT ((1)) FOR [vat_type_id]
GO
ALTER TABLE [dbo].[CUSTOMER_REPACKED_ITEMS] ADD  CONSTRAINT [DF_CUSTOMER_REPACKED_ITEMS_rpk_price]  DEFAULT (0) FOR [rpk_price]
GO
ALTER TABLE [dbo].[CUSTOMER_REPACKED_ITEMS] ADD  CONSTRAINT [DF_CUSTOMER_REPACKED_ITEMS_labor_cost]  DEFAULT (0) FOR [labor_cost]
GO
ALTER TABLE [dbo].[CUSTOMER_REPACKED_ITEMS] ADD  CONSTRAINT [DF_CUSTOMER_REPACKED_ITEMS_pack_cost]  DEFAULT (0) FOR [pack_cost]
GO
ALTER TABLE [dbo].[COLLECTION_BILL_DTL]  WITH CHECK ADD  CONSTRAINT [FK_COLLECTION_BILL_DTL_COLLECTION] FOREIGN KEY([coll_no], [coll_type])
REFERENCES [dbo].[COLLECTION] ([coll_no], [coll_type])
GO
ALTER TABLE [dbo].[COLLECTION_BILL_DTL] CHECK CONSTRAINT [FK_COLLECTION_BILL_DTL_COLLECTION]
GO
ALTER TABLE [dbo].[COLLECTION_CM_DTL]  WITH CHECK ADD  CONSTRAINT [FK_COLLECTION_CM_DTL_COLLECTION] FOREIGN KEY([coll_no], [coll_type])
REFERENCES [dbo].[COLLECTION] ([coll_no], [coll_type])
GO
ALTER TABLE [dbo].[COLLECTION_CM_DTL] CHECK CONSTRAINT [FK_COLLECTION_CM_DTL_COLLECTION]
GO
ALTER TABLE [dbo].[COLLECTION_PAYMENT_DTL]  WITH CHECK ADD  CONSTRAINT [FK_COLLECTION_PAYMENT_DTL_COLLECTION] FOREIGN KEY([coll_no], [coll_type])
REFERENCES [dbo].[COLLECTION] ([coll_no], [coll_type])
GO
ALTER TABLE [dbo].[COLLECTION_PAYMENT_DTL] CHECK CONSTRAINT [FK_COLLECTION_PAYMENT_DTL_COLLECTION]
GO
ALTER TABLE [dbo].[CREDIT_MEMO_DTL]  WITH NOCHECK ADD  CONSTRAINT [FK_CREDIT_MEMO_DTL_CREDIT_MEMO] FOREIGN KEY([cm_no])
REFERENCES [dbo].[CREDIT_MEMO] ([cm_no])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[CREDIT_MEMO_DTL] CHECK CONSTRAINT [FK_CREDIT_MEMO_DTL_CREDIT_MEMO]
GO
ALTER TABLE [dbo].[CUSTOMER_BALANCE]  WITH NOCHECK ADD  CONSTRAINT [FK_CUSTOMER_BALANCE_CUSTOMER] FOREIGN KEY([cust_id])
REFERENCES [dbo].[CUSTOMER] ([cust_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CUSTOMER_BALANCE] CHECK CONSTRAINT [FK_CUSTOMER_BALANCE_CUSTOMER]
GO
ALTER TABLE [dbo].[CUSTOMER_ITEM_HISTORY]  WITH NOCHECK ADD  CONSTRAINT [FK_CUSTOMER_ITEM_HISTORY_CUSTOMER] FOREIGN KEY([cust_id])
REFERENCES [dbo].[CUSTOMER] ([cust_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CUSTOMER_ITEM_HISTORY] CHECK CONSTRAINT [FK_CUSTOMER_ITEM_HISTORY_CUSTOMER]
GO
ALTER TABLE [dbo].[CUSTOMER_REPACKED_ITEMS]  WITH NOCHECK ADD  CONSTRAINT [FK_CUSTOMER_REPACKED_ITEMS_CUSTOMER] FOREIGN KEY([cust_id])
REFERENCES [dbo].[CUSTOMER] ([cust_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CUSTOMER_REPACKED_ITEMS] CHECK CONSTRAINT [FK_CUSTOMER_REPACKED_ITEMS_CUSTOMER]
GO
ALTER TABLE [dbo].[DISBURSEMENT_BILL_DTL]  WITH CHECK ADD  CONSTRAINT [FK_DISBURSEMENT_BILL_DTL_DISBURSEMENT] FOREIGN KEY([disb_type], [disb_no])
REFERENCES [dbo].[DISBURSEMENT] ([disb_type], [disb_no])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DISBURSEMENT_BILL_DTL] CHECK CONSTRAINT [FK_DISBURSEMENT_BILL_DTL_DISBURSEMENT]
GO
ALTER TABLE [dbo].[DISBURSEMENT_DM_DTL]  WITH CHECK ADD  CONSTRAINT [FK_DISBURSEMENT_DM_DTL_DISBURSEMENT] FOREIGN KEY([disb_type], [disb_no])
REFERENCES [dbo].[DISBURSEMENT] ([disb_type], [disb_no])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DISBURSEMENT_DM_DTL] CHECK CONSTRAINT [FK_DISBURSEMENT_DM_DTL_DISBURSEMENT]
GO
ALTER TABLE [dbo].[DISBURSEMENT_EXP_DTL]  WITH CHECK ADD  CONSTRAINT [FK_DISBURSEMENT_EXP_DTL_DISBURSEMENT] FOREIGN KEY([disb_type], [disb_no])
REFERENCES [dbo].[DISBURSEMENT] ([disb_type], [disb_no])
GO
ALTER TABLE [dbo].[DISBURSEMENT_EXP_DTL] CHECK CONSTRAINT [FK_DISBURSEMENT_EXP_DTL_DISBURSEMENT]
GO
ALTER TABLE [dbo].[DISBURSEMENT_PAYMENT_DTL]  WITH CHECK ADD  CONSTRAINT [FK_DISBURSEMENT_PAYMENT_DTL_DISBURSEMENT] FOREIGN KEY([disb_type], [disb_no])
REFERENCES [dbo].[DISBURSEMENT] ([disb_type], [disb_no])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DISBURSEMENT_PAYMENT_DTL] CHECK CONSTRAINT [FK_DISBURSEMENT_PAYMENT_DTL_DISBURSEMENT]
GO
ALTER TABLE [dbo].[DR_ASPHALT_DTL]  WITH NOCHECK ADD  CONSTRAINT [FK_DR_ASPHALT_DTL_DR_ASPHALT] FOREIGN KEY([iss_no])
REFERENCES [dbo].[DR_ASPHALT] ([iss_no])
GO
ALTER TABLE [dbo].[DR_ASPHALT_DTL] CHECK CONSTRAINT [FK_DR_ASPHALT_DTL_DR_ASPHALT]
GO
ALTER TABLE [dbo].[ITEM]  WITH NOCHECK ADD  CONSTRAINT [FK_ITEM_ITEM_CATEGORY] FOREIGN KEY([category_id])
REFERENCES [dbo].[ITEM_CATEGORY] ([category_id])
GO
ALTER TABLE [dbo].[ITEM] CHECK CONSTRAINT [FK_ITEM_ITEM_CATEGORY]
GO
ALTER TABLE [dbo].[ITEM_MIN_STOCK_LEVEL]  WITH NOCHECK ADD  CONSTRAINT [FK_ITEM_MIN_STOCK_LEVEL_ITEM] FOREIGN KEY([item_id])
REFERENCES [dbo].[ITEM] ([item_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ITEM_MIN_STOCK_LEVEL] CHECK CONSTRAINT [FK_ITEM_MIN_STOCK_LEVEL_ITEM]
GO
ALTER TABLE [dbo].[ITEM_PLU]  WITH NOCHECK ADD  CONSTRAINT [FK_ITEM_PLU_ITEM] FOREIGN KEY([item_id])
REFERENCES [dbo].[ITEM] ([item_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ITEM_PLU] CHECK CONSTRAINT [FK_ITEM_PLU_ITEM]
GO
ALTER TABLE [dbo].[ITEM_PLU_COST]  WITH NOCHECK ADD  CONSTRAINT [FK_ITEM_PLU_COST_ITEM] FOREIGN KEY([item_id])
REFERENCES [dbo].[ITEM] ([item_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ITEM_PLU_COST] CHECK CONSTRAINT [FK_ITEM_PLU_COST_ITEM]
GO
ALTER TABLE [dbo].[ITEM_PLU_PRICE]  WITH NOCHECK ADD  CONSTRAINT [FK_ITEM_PLU_PRICE_ITEM] FOREIGN KEY([item_id])
REFERENCES [dbo].[ITEM] ([item_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ITEM_PLU_PRICE] CHECK CONSTRAINT [FK_ITEM_PLU_PRICE_ITEM]
GO
ALTER TABLE [dbo].[PURCHASE_INVOICE_DTL]  WITH NOCHECK ADD  CONSTRAINT [FK_PURCHASE_INVOICE_DTL_PURCHASE_INVOICE] FOREIGN KEY([pi_no])
REFERENCES [dbo].[PURCHASE_INVOICE] ([pi_no])
GO
ALTER TABLE [dbo].[PURCHASE_INVOICE_DTL] CHECK CONSTRAINT [FK_PURCHASE_INVOICE_DTL_PURCHASE_INVOICE]
GO
ALTER TABLE [dbo].[PURCHASE_INVOICE_EXP]  WITH NOCHECK ADD  CONSTRAINT [FK_PURCHASE_INVOICE_EXP_PURCHASE_INVOICE] FOREIGN KEY([pi_no])
REFERENCES [dbo].[PURCHASE_INVOICE] ([pi_no])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PURCHASE_INVOICE_EXP] CHECK CONSTRAINT [FK_PURCHASE_INVOICE_EXP_PURCHASE_INVOICE]
GO
ALTER TABLE [dbo].[PURCHASE_INVOICE_RCPT]  WITH NOCHECK ADD  CONSTRAINT [FK_PURCHASE_INVOICE_RCPT_PURCHASE_INVOICE] FOREIGN KEY([pi_no])
REFERENCES [dbo].[PURCHASE_INVOICE] ([pi_no])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PURCHASE_INVOICE_RCPT] CHECK CONSTRAINT [FK_PURCHASE_INVOICE_RCPT_PURCHASE_INVOICE]
GO
ALTER TABLE [dbo].[PURCHASE_ORDER_DTL]  WITH NOCHECK ADD  CONSTRAINT [FK_PURCHASE_ORDER_DTL_PURCHASE_ORDER] FOREIGN KEY([po_no])
REFERENCES [dbo].[PURCHASE_ORDER] ([po_no])
GO
ALTER TABLE [dbo].[PURCHASE_ORDER_DTL] CHECK CONSTRAINT [FK_PURCHASE_ORDER_DTL_PURCHASE_ORDER]
GO
ALTER TABLE [dbo].[PURCHASE_ORDER_MISC]  WITH NOCHECK ADD  CONSTRAINT [FK_PURCHASE_ORDER_MISC_PURCHASE_ORDER] FOREIGN KEY([po_no])
REFERENCES [dbo].[PURCHASE_ORDER] ([po_no])
GO
ALTER TABLE [dbo].[PURCHASE_ORDER_MISC] CHECK CONSTRAINT [FK_PURCHASE_ORDER_MISC_PURCHASE_ORDER]
GO
ALTER TABLE [dbo].[PURCHASE_RETURN_DTL]  WITH CHECK ADD  CONSTRAINT [FK_PURCHASE_RETURN_DTL_PURCHASE_RETURN] FOREIGN KEY([pr_no])
REFERENCES [dbo].[PURCHASE_RETURN] ([pr_no])
GO
ALTER TABLE [dbo].[PURCHASE_RETURN_DTL] CHECK CONSTRAINT [FK_PURCHASE_RETURN_DTL_PURCHASE_RETURN]
GO
ALTER TABLE [dbo].[REPACKING_DTL]  WITH NOCHECK ADD  CONSTRAINT [FK_REPACKING_DTL_REPACKING] FOREIGN KEY([rpk_no])
REFERENCES [dbo].[REPACKING] ([rpk_no])
GO
ALTER TABLE [dbo].[REPACKING_DTL] CHECK CONSTRAINT [FK_REPACKING_DTL_REPACKING]
GO
ALTER TABLE [dbo].[ROLE]  WITH NOCHECK ADD  CONSTRAINT [FK_ROLE_ROLE_CLASS] FOREIGN KEY([class_id])
REFERENCES [dbo].[ROLE_CLASS] ([class_id])
ON UPDATE CASCADE
ON DELETE CASCADE
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[ROLE] CHECK CONSTRAINT [FK_ROLE_ROLE_CLASS]
GO
ALTER TABLE [dbo].[SALES_COMMISSION_DTL]  WITH NOCHECK ADD  CONSTRAINT [FK_SALES_COMMISSION_DTL_SALES_COMMISSION] FOREIGN KEY([sc_no])
REFERENCES [dbo].[SALES_COMMISSION] ([sc_no])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SALES_COMMISSION_DTL] CHECK CONSTRAINT [FK_SALES_COMMISSION_DTL_SALES_COMMISSION]
GO
ALTER TABLE [dbo].[SALES_INVOICE_DTL]  WITH NOCHECK ADD  CONSTRAINT [FK_SALES_INVOICE_DTL_SALES_INVOICE] FOREIGN KEY([si_no], [si_type])
REFERENCES [dbo].[SALES_INVOICE] ([si_no], [si_type])
GO
ALTER TABLE [dbo].[SALES_INVOICE_DTL] CHECK CONSTRAINT [FK_SALES_INVOICE_DTL_SALES_INVOICE]
GO
ALTER TABLE [dbo].[SALES_INVOICE_DTL_SUBITEM]  WITH NOCHECK ADD  CONSTRAINT [FK_SALES_INVOICE_DTL_SUBITEM_SALES_INVOICE] FOREIGN KEY([si_no], [si_type])
REFERENCES [dbo].[SALES_INVOICE] ([si_no], [si_type])
GO
ALTER TABLE [dbo].[SALES_INVOICE_DTL_SUBITEM] CHECK CONSTRAINT [FK_SALES_INVOICE_DTL_SUBITEM_SALES_INVOICE]
GO
ALTER TABLE [dbo].[SALES_INVOICE_MISC]  WITH NOCHECK ADD  CONSTRAINT [FK_SALES_INVOICE_MISC_SALES_INVOICE] FOREIGN KEY([si_no], [si_type])
REFERENCES [dbo].[SALES_INVOICE] ([si_no], [si_type])
GO
ALTER TABLE [dbo].[SALES_INVOICE_MISC] CHECK CONSTRAINT [FK_SALES_INVOICE_MISC_SALES_INVOICE]
GO
ALTER TABLE [dbo].[SALES_INVOICE_PROFIT]  WITH NOCHECK ADD  CONSTRAINT [FK_SALES_INVOICE_PROFIT_SALES_INVOICE] FOREIGN KEY([si_no], [si_type])
REFERENCES [dbo].[SALES_INVOICE] ([si_no], [si_type])
GO
ALTER TABLE [dbo].[SALES_INVOICE_PROFIT] CHECK CONSTRAINT [FK_SALES_INVOICE_PROFIT_SALES_INVOICE]
GO
ALTER TABLE [dbo].[SALES_ORDER_DTL]  WITH NOCHECK ADD  CONSTRAINT [FK_SALES_ORDER_DTL_SALES_ORDER] FOREIGN KEY([so_no])
REFERENCES [dbo].[SALES_ORDER] ([so_no])
GO
ALTER TABLE [dbo].[SALES_ORDER_DTL] CHECK CONSTRAINT [FK_SALES_ORDER_DTL_SALES_ORDER]
GO
ALTER TABLE [dbo].[SALES_ORDER_MISC]  WITH NOCHECK ADD  CONSTRAINT [FK_SALES_ORDER_MISC_SALES_ORDER] FOREIGN KEY([so_no])
REFERENCES [dbo].[SALES_ORDER] ([so_no])
GO
ALTER TABLE [dbo].[SALES_ORDER_MISC] CHECK CONSTRAINT [FK_SALES_ORDER_MISC_SALES_ORDER]
GO
ALTER TABLE [dbo].[SALES_RETURN_DTL]  WITH CHECK ADD  CONSTRAINT [FK_SALES_RETURN_DTL_SALES_RETURN] FOREIGN KEY([sr_no])
REFERENCES [dbo].[SALES_RETURN] ([sr_no])
GO
ALTER TABLE [dbo].[SALES_RETURN_DTL] CHECK CONSTRAINT [FK_SALES_RETURN_DTL_SALES_RETURN]
GO
ALTER TABLE [dbo].[SOA_MISC]  WITH NOCHECK ADD  CONSTRAINT [FK_SOA_MISC_SOA] FOREIGN KEY([soa_no])
REFERENCES [dbo].[SOA] ([soa_no])
GO
ALTER TABLE [dbo].[SOA_MISC] CHECK CONSTRAINT [FK_SOA_MISC_SOA]
GO
ALTER TABLE [dbo].[STOCK_ADJUSTMENT_DTL]  WITH NOCHECK ADD  CONSTRAINT [FK_STOCK_ADJUSTMENT_DTL_STOCK_ADJUSTMENT] FOREIGN KEY([adj_no])
REFERENCES [dbo].[STOCK_ADJUSTMENT] ([adj_no])
GO
ALTER TABLE [dbo].[STOCK_ADJUSTMENT_DTL] CHECK CONSTRAINT [FK_STOCK_ADJUSTMENT_DTL_STOCK_ADJUSTMENT]
GO
ALTER TABLE [dbo].[STOCK_ISSUANCE_DTL]  WITH NOCHECK ADD  CONSTRAINT [FK_STOCK_ISSUANCE_DTL_STOCK_ISSUANCE] FOREIGN KEY([iss_no])
REFERENCES [dbo].[STOCK_ISSUANCE] ([iss_no])
GO
ALTER TABLE [dbo].[STOCK_ISSUANCE_DTL] CHECK CONSTRAINT [FK_STOCK_ISSUANCE_DTL_STOCK_ISSUANCE]
GO
ALTER TABLE [dbo].[STOCK_PROCESSING_DTL]  WITH NOCHECK ADD  CONSTRAINT [FK_STOCK_PROCESSING_DTL_STOCK_PROCESSING] FOREIGN KEY([proc_no])
REFERENCES [dbo].[STOCK_PROCESSING] ([proc_no])
GO
ALTER TABLE [dbo].[STOCK_PROCESSING_DTL] CHECK CONSTRAINT [FK_STOCK_PROCESSING_DTL_STOCK_PROCESSING]
GO
ALTER TABLE [dbo].[STOCK_PROCESSING_EXP]  WITH NOCHECK ADD  CONSTRAINT [FK_STOCK_PROCESSING_EXP_STOCK_PROCESSING] FOREIGN KEY([proc_no])
REFERENCES [dbo].[STOCK_PROCESSING] ([proc_no])
GO
ALTER TABLE [dbo].[STOCK_PROCESSING_EXP] CHECK CONSTRAINT [FK_STOCK_PROCESSING_EXP_STOCK_PROCESSING]
GO
ALTER TABLE [dbo].[STOCK_RECEIPT_DTL]  WITH NOCHECK ADD  CONSTRAINT [FK_STOCK_RECEIPT_DTL_STOCK_RECEIPT] FOREIGN KEY([rcpt_no])
REFERENCES [dbo].[STOCK_RECEIPT] ([rcpt_no])
GO
ALTER TABLE [dbo].[STOCK_RECEIPT_DTL] CHECK CONSTRAINT [FK_STOCK_RECEIPT_DTL_STOCK_RECEIPT]
GO
ALTER TABLE [dbo].[STOCK_RECEIPT_MISC]  WITH NOCHECK ADD  CONSTRAINT [FK_STOCK_RECEIPT_MISC_STOCK_RECEIPT] FOREIGN KEY([rcpt_no])
REFERENCES [dbo].[STOCK_RECEIPT] ([rcpt_no])
GO
ALTER TABLE [dbo].[STOCK_RECEIPT_MISC] CHECK CONSTRAINT [FK_STOCK_RECEIPT_MISC_STOCK_RECEIPT]
GO
ALTER TABLE [dbo].[STOCK_RESERVATION_DTL]  WITH NOCHECK ADD  CONSTRAINT [FK_STOCK_RESERVATION_DTL_STOCK_RESERVATION] FOREIGN KEY([res_no])
REFERENCES [dbo].[STOCK_RESERVATION] ([res_no])
GO
ALTER TABLE [dbo].[STOCK_RESERVATION_DTL] CHECK CONSTRAINT [FK_STOCK_RESERVATION_DTL_STOCK_RESERVATION]
GO
ALTER TABLE [dbo].[SUPPLIER_BALANCE]  WITH NOCHECK ADD  CONSTRAINT [FK_SUPPLIER_BALANCE_SUPPLIER] FOREIGN KEY([supp_id])
REFERENCES [dbo].[SUPPLIER] ([supp_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SUPPLIER_BALANCE] CHECK CONSTRAINT [FK_SUPPLIER_BALANCE_SUPPLIER]
GO
ALTER TABLE [dbo].[SUPPLIER_CONTACT]  WITH NOCHECK ADD  CONSTRAINT [FK_SUPPLIER_CONTACT_SUPPLIER] FOREIGN KEY([supp_id])
REFERENCES [dbo].[SUPPLIER] ([supp_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SUPPLIER_CONTACT] CHECK CONSTRAINT [FK_SUPPLIER_CONTACT_SUPPLIER]
GO
ALTER TABLE [dbo].[SUPPLIER_ITEM_HISTORY]  WITH NOCHECK ADD  CONSTRAINT [FK_SUPPLIER_ITEM_HISTORY_SUPPLIER] FOREIGN KEY([supp_id])
REFERENCES [dbo].[SUPPLIER] ([supp_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SUPPLIER_ITEM_HISTORY] CHECK CONSTRAINT [FK_SUPPLIER_ITEM_HISTORY_SUPPLIER]
GO
ALTER TABLE [dbo].[USER_GROUP_ROLES]  WITH NOCHECK ADD  CONSTRAINT [FK_USER_GROUP_ROLES_USER_GROUP] FOREIGN KEY([group_id])
REFERENCES [dbo].[USER_GROUP] ([group_id])
ON DELETE CASCADE
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[USER_GROUP_ROLES] CHECK CONSTRAINT [FK_USER_GROUP_ROLES_USER_GROUP]
GO
ALTER TABLE [dbo].[USER_ROLES]  WITH NOCHECK ADD  CONSTRAINT [FK_USER_ROLES_ROLE] FOREIGN KEY([role_id])
REFERENCES [dbo].[ROLE] ([role_id])
ON UPDATE CASCADE
ON DELETE CASCADE
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[USER_ROLES] CHECK CONSTRAINT [FK_USER_ROLES_ROLE]
GO
ALTER TABLE [dbo].[USER_ROLES]  WITH CHECK ADD  CONSTRAINT [FK_USER_ROLES_USER] FOREIGN KEY([user_id])
REFERENCES [dbo].[USER] ([user_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[USER_ROLES] CHECK CONSTRAINT [FK_USER_ROLES_USER]
GO
