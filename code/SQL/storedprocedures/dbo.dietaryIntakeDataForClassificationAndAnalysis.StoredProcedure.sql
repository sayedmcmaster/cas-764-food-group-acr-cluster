USE [cas_764_data_management_project]
GO
/****** Object:  StoredProcedure [dbo].[dietaryIntakeDataForClassificationAndAnalysis]    Script Date: 2022-12-11 8:41:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[dietaryIntakeDataForClassificationAndAnalysis]
AS
BEGIN

	truncate table [dietaryIntakeDataForClassificationAndAnalysisData];

	insert into [dietaryIntakeDataForClassificationAndAnalysisData]
	select demo.[RIDAGEYR_Age_in_years_at_screening]
	,demo.[URDACT_Albumin_creatinine_ratio_mg_g]
	, intake.*
	from [DemographicsWithACR_Data] demo
	left join [combinedDietaryIntakeData] intake on intake.[SEQN - Respondent sequence number] = demo.[SEQN_Respondent_sequence_number];

	-- with all demographics columns

	truncate table [dietaryIntakeDataForClassificationAndAnalysisData];

	insert into [dietaryIntakeDataForClassificationAndAnalysisData]
	select demo.[RIDAGEYR_Age_in_years_at_screening]
	,demo.[URDACT_Albumin_creatinine_ratio_mg_g]
	, intake.*
	from [DemographicsWithACR_Data] demo
	left join [combinedDietaryIntakeData] intake on intake.[SEQN - Respondent sequence number] = demo.[SEQN_Respondent_sequence_number];



--drop table [dietaryIntakeDataForClassificationAndAnalysisData];

--CREATE TABLE [dbo].[dietaryIntakeDataForClassificationAndAnalysisData](
--		[RIDAGEYR_Age_in_years_at_screening] [int] NOT NULL,
--		[URDACT_Albumin_creatinine_ratio_mg_g] [float] NOT NULL
--		,[DataYear] [varchar](50) NULL,
--		[SEQN - Respondent sequence number] [varchar](255) NULL,		
--		[WTDRD1 - Dietary day one sample weight] [varchar](255) NULL,
--		[WTDR2D - Dietary two-day sample weight] [varchar](255) NULL,
--		[DR1ILINE - Food/Individual component number] [varchar](255) NULL,
--		[DR1DRSTZ - Dietary recall status] [varchar](255) NULL,
--		[DR1EXMER - Interviewer ID code] [varchar](255) NULL,
--		[DRABF - Breast-fed infant (either day)] [varchar](255) NULL,
--		[DRDINT - Number of days of intake] [varchar](255) NULL,
--		[DR1DBIH - # of days b/w intake and HH interview] [varchar](255) NULL,
--		[DR1DAY - Intake day of the week] [varchar](255) NULL,
--		[DR1LANG - Language respondent used mostly] [varchar](255) NULL,
--		[DR1CCMNM - Combination food number] [varchar](255) NULL,
--		[DR1CCMTX - Combination food type] [varchar](255) NULL,
--		[DR1_020 - Time of eating occasion (HH:MM)] [varchar](255) NULL,
--		[DR1_030Z - Name of eating occasion] [varchar](255) NULL,
--		[DR1FS - Source of food] [varchar](255) NULL,
--		[DR1_040Z - Did you eat this meal at home?] [varchar](255) NULL,
--		[DR1IFDCD - USDA food code] [varchar](255) NULL,
--		[DR1IGRMS - Grams] [varchar](255) NULL,
--		[DR1IKCAL - Energy (kcal)] [varchar](255) NULL,
--		[DR1IPROT - Protein (gm)] [varchar](255) NULL,
--		[DR1ICARB - Carbohydrate (gm)] [varchar](255) NULL,
--		[DR1ISUGR - Total sugars (gm)] [varchar](255) NULL,
--		[DR1IFIBE - Dietary fiber (gm)] [varchar](255) NULL,
--		[DR1ITFAT - Total fat (gm)] [varchar](255) NULL,
--		[DR1ISFAT - Total saturated fatty acids (gm)] [varchar](255) NULL,
--		[DR1IMFAT - Total monounsaturated fatty acids (gm)] [varchar](255) NULL,
--		[DR1IPFAT - Total polyunsaturated fatty acids (gm)] [varchar](255) NULL,
--		[DR1ICHOL - Cholesterol (mg)] [varchar](255) NULL,
--		[DR1IATOC - Vitamin E as alpha-tocopherol (mg)] [varchar](255) NULL,
--		[DR1IATOA - Added alpha-tocopherol (Vitamin E) (mg)] [varchar](255) NULL,
--		[DR1IRET - Retinol (mcg)] [varchar](255) NULL,
--		[DR1IVARA - Vitamin A, RAE (mcg)] [varchar](255) NULL,
--		[DR1IACAR - Alpha-carotene (mcg)] [varchar](255) NULL,
--		[DR1IBCAR - Beta-carotene (mcg)] [varchar](255) NULL,
--		[DR1ICRYP - Beta-cryptoxanthin (mcg)] [varchar](255) NULL,
--		[DR1ILYCO - Lycopene (mcg)] [varchar](255) NULL,
--		[DR1ILZ - Lutein + zeaxanthin (mcg)] [varchar](255) NULL,
--		[DR1IVB1 - Thiamin (Vitamin B1) (mg)] [varchar](255) NULL,
--		[DR1IVB2 - Riboflavin (Vitamin B2) (mg)] [varchar](255) NULL,
--		[DR1INIAC - Niacin (mg)] [varchar](255) NULL,
--		[DR1IVB6 - Vitamin B6 (mg)] [varchar](255) NULL,
--		[DR1IFOLA - Total folate (mcg)] [varchar](255) NULL,
--		[DR1IFA - Folic acid (mcg)] [varchar](255) NULL,
--		[DR1IFF - Food folate (mcg)] [varchar](255) NULL,
--		[DR1IFDFE - Folate, DFE (mcg)] [varchar](255) NULL,
--		[DR1ICHL - Total choline (mg)] [varchar](255) NULL,
--		[DR1IVB12 - Vitamin B12 (mcg)] [varchar](255) NULL,
--		[DR1IB12A - Added vitamin B12 (mcg)] [varchar](255) NULL,
--		[DR1IVC - Vitamin C (mg)] [varchar](255) NULL,
--		[DR1IVD - Vitamin D (D2 + D3) (mcg)] [varchar](255) NULL,
--		[DR1IVK - Vitamin K (mcg)] [varchar](255) NULL,
--		[DR1ICALC - Calcium (mg)] [varchar](255) NULL,
--		[DR1IPHOS - Phosphorus (mg)] [varchar](255) NULL,
--		[DR1IMAGN - Magnesium (mg)] [varchar](255) NULL,
--		[DR1IIRON - Iron (mg)] [varchar](255) NULL,
--		[DR1IZINC - Zinc (mg)] [varchar](255) NULL,
--		[DR1ICOPP - Copper (mg)] [varchar](255) NULL,
--		[DR1ISODI - Sodium (mg)] [varchar](255) NULL,
--		[DR1IPOTA - Potassium (mg)] [varchar](255) NULL,
--		[DR1ISELE - Selenium (mcg)] [varchar](255) NULL,
--		[DR1ICAFF - Caffeine (mg)] [varchar](255) NULL,
--		[DR1ITHEO - Theobromine (mg)] [varchar](255) NULL,
--		[DR1IALCO - Alcohol (gm)] [varchar](255) NULL,
--		[DR1IMOIS - Moisture (gm)] [varchar](255) NULL,
--		[DR1IS040 - SFA 4:0 (Butanoic) (gm)] [varchar](255) NULL,
--		[DR1IS060 - SFA 6:0 (Hexanoic) (gm)] [varchar](255) NULL,
--		[DR1IS080 - SFA 8:0 (Octanoic) (gm)] [varchar](255) NULL,
--		[DR1IS100 - SFA 10:0 (Decanoic) (gm)] [varchar](255) NULL,
--		[DR1IS120 - SFA 12:0 (Dodecanoic) (gm)] [varchar](255) NULL,
--		[DR1IS140 - SFA 14:0 (Tetradecanoic) (gm)] [varchar](255) NULL,
--		[DR1IS160 - SFA 16:0 (Hexadecanoic) (gm)] [varchar](255) NULL,
--		[DR1IS180 - SFA 18:0 (Octadecanoic) (gm)] [varchar](255) NULL,
--		[DR1IM161 - MFA 16:1 (Hexadecenoic) (gm)] [varchar](255) NULL,
--		[DR1IM181 - MFA 18:1 (Octadecenoic) (gm)] [varchar](255) NULL,
--		[DR1IM201 - MFA 20:1 (Eicosenoic) (gm)] [varchar](255) NULL,
--		[DR1IM221 - MFA 22:1 (Docosenoic) (gm)] [varchar](255) NULL,
--		[DR1IP182 - PFA 18:2 (Octadecadienoic) (gm)] [varchar](255) NULL,
--		[DR1IP183 - PFA 18:3 (Octadecatrienoic) (gm)] [varchar](255) NULL,
--		[DR1IP184 - PFA 18:4 (Octadecatetraenoic) (gm)] [varchar](255) NULL,
--		[DR1IP204 - PFA 20:4 (Eicosatetraenoic) (gm)] [varchar](255) NULL,
--		[DR1IP205 - PFA 20:5 (Eicosapentaenoic) (gm)] [varchar](255) NULL,
--		[DR1IP225 - PFA 22:5 (Docosapentaenoic) (gm)] [varchar](255) NULL,
--		[DR1IP226 - PFA 22:6 (Docosahexaenoic) (gm)] [varchar](255) NULL
--) ON [PRIMARY]




	

END
GO
