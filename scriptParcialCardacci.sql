USE [PARCIALCARDACCI]
GO
/****** Object:  Table [dbo].[PERSONA]    Script Date: 25-Jul-20 18:58:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PERSONA](
	[ID] [int] NOT NULL,
	[NOMBRE] [varchar](50) NOT NULL,
	[APELLIDO] [varchar](50) NOT NULL,
	[FECHA_NACIMIENTO] [date] NOT NULL,
	[ESTADO] [varchar](50) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[PERSONA] ([ID], [NOMBRE], [APELLIDO], [FECHA_NACIMIENTO], [ESTADO]) VALUES (1, N'John', N'Digweed', CAST(N'2020-07-15' AS Date), N'BAJA')
INSERT [dbo].[PERSONA] ([ID], [NOMBRE], [APELLIDO], [FECHA_NACIMIENTO], [ESTADO]) VALUES (2, N'Dani', N'pastisiempre', CAST(N'2020-07-18' AS Date), N'ACTIVO')
/****** Object:  StoredProcedure [dbo].[SP_Alta]    Script Date: 25-Jul-20 18:58:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_Alta]
@NOMBRE VARCHAR(50), @APELLIDO VARCHAR(50), @FECHANAC DATE
AS
BEGIN

declare @nid int
set @nid = (select COUNT(*) from PERSONA)
if @nid > 0
begin
	set @nid = (select MAX(ID) from PERSONA)
end
set @nid +=1

INSERT INTO PERSONA (ID,NOMBRE,APELLIDO,FECHA_NACIMIENTO,ESTADO)
VALUES (@nid,@NOMBRE,@APELLIDO,@FECHANAC,'ACTIVO')

END
GO
/****** Object:  StoredProcedure [dbo].[SP_Baja]    Script Date: 25-Jul-20 18:58:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_Baja]
@ID INT
AS
BEGIN
	UPDATE PERSONA SET ESTADO = 'BAJA'
	WHERE ID = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ListarTodos]    Script Date: 25-Jul-20 18:58:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_ListarTodos]
AS
BEGIN
	SELECT * FROM PERSONA WHERE ESTADO = 'ACTIVO'
END
GO
