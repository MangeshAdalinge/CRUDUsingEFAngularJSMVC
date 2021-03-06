USE [RegistrationDB]
GO
/****** Object:  StoredProcedure [dbo].[spInsertEmployee]    Script Date: 7/28/2017 11:19:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spInsertEmployee]


@FirstName  VARCHAR(50),
@LastName VARCHAR(50),
@DOB VARCHAR(50),
@Email VARCHAR(150),
@TermsStatus int,
@Password VARCHAR(50)

AS
  BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      SET NOCOUNT ON;


      IF EXISTS (SELECT 1   FROM   [dbo].[tblEmployee] WHERE  FirstName = @FirstName and LastName = @LastName)
	   

        UPDATE [dbo].[tblEmployee]
        SET    FirstName = @FirstName, LastName = @LastName, DOB = CONVERT(datetime,@DOB, 120), Email = @Email, TermsStatus = @TermsStatus, [Password] = @Password
		WHERE  FirstName = @FirstName and LastName = @LastName

      ELSE


        INSERT INTO [dbo].[tblEmployee] (FirstName,  LastName, DOB, Email, TermsStatus, [Password])
        VALUES      (@FirstName, @LastName, CONVERT(datetime,@DOB, 120), @Email, @TermsStatus, @Password)
  END
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 7/28/2017 11:19:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[DOB] [datetime] NULL,
	[Email] [varchar](150) NULL,
	[TermsStatus] [int] NULL,
	[Password] [varchar](50) NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
