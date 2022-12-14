USE [cas_764_data_management_project]
GO
/****** Object:  StoredProcedure [dbo].[create_classified_dataset]    Script Date: 2022-12-11 8:41:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[create_classified_dataset]
AS
BEGIN

	SELECT count(*) as totalParticipants
	FROM [cas_764_data_management_project].[dbo].[CombinedDemographicsData];


	SELECT count(*) as acrExamCount
	FROM [cas_764_data_management_project].[dbo].[CombinedUrineAlbuminCreatinineRatio];

	-- create data with matched identity and ACR test outcome
	-- use this to create classified data in Python
	truncate table [DemographicsWithACR_Data];

	--insert into [DemographicsWithACR_Data]
	--select demo.*, acr.*
	--from CombinedDemographicsData demo
	--inner join CombinedUrineAlbuminCreatinineRatio acr on demo.[SEQN_Respondent_sequence_number] = acr.[SEQN_Respondent_sequence_number]
	--and (acr.[URDACT_Albumin_creatinine_ratio_mg_g] != 'nan');

	insert into [DemographicsWithACR_Data]
	select demo.SEQN_Respondent_sequence_number, demo.RIDAGEYR_Age_in_years_at_screening as age, cast(acr.[URDACT_Albumin_creatinine_ratio_mg_g] as float)
	from CombinedDemographicsData demo
	inner join CombinedUrineAlbuminCreatinineRatio acr on demo.[SEQN_Respondent_sequence_number] = acr.[SEQN_Respondent_sequence_number]
	and (acr.[URDACT_Albumin_creatinine_ratio_mg_g] != 'nan');



	-- ******************************************************************************* 
	-- class 1
	-- age below 30
	-- ACR between < 3
	select top 5 demo.SEQN_Respondent_sequence_number, demo.RIDAGEYR_Age_in_years_at_screening as age, acr.[URDACT_Albumin_creatinine_ratio_mg_g]
	from CombinedDemographicsData demo
	inner join CombinedUrineAlbuminCreatinineRatio acr on demo.[SEQN_Respondent_sequence_number] = acr.[SEQN_Respondent_sequence_number]
	and (acr.[URDACT_Albumin_creatinine_ratio_mg_g] != 'nan')
	where (cast(demo.RIDAGEYR_Age_in_years_at_screening as float)  < 30)
	and (cast ( acr.[URDACT_Albumin_creatinine_ratio_mg_g] as float) < 3)
	order by demo.RIDAGEYR_Age_in_years_at_screening,  acr.[URDACT_Albumin_creatinine_ratio_mg_g];


	-- class 2
	-- age below 30
	-- ACR between >= 3  and <= 30
	select top 5 demo.SEQN_Respondent_sequence_number, demo.RIDAGEYR_Age_in_years_at_screening as age, acr.[URDACT_Albumin_creatinine_ratio_mg_g]
	from CombinedDemographicsData demo
	inner join CombinedUrineAlbuminCreatinineRatio acr on demo.[SEQN_Respondent_sequence_number] = acr.[SEQN_Respondent_sequence_number]
	and (acr.[URDACT_Albumin_creatinine_ratio_mg_g] != 'nan')
	where (cast(demo.RIDAGEYR_Age_in_years_at_screening as float)  < 30)
	and (cast ( acr.[URDACT_Albumin_creatinine_ratio_mg_g] as float) >= 3)
	and (cast ( acr.[URDACT_Albumin_creatinine_ratio_mg_g] as float) <= 30)
	order by demo.RIDAGEYR_Age_in_years_at_screening,  acr.[URDACT_Albumin_creatinine_ratio_mg_g];


	-- class 3
	-- age below 30
	-- ACR > 30
	select top 5 demo.SEQN_Respondent_sequence_number, demo.RIDAGEYR_Age_in_years_at_screening as age, acr.[URDACT_Albumin_creatinine_ratio_mg_g]
	from CombinedDemographicsData demo
	inner join CombinedUrineAlbuminCreatinineRatio acr on demo.[SEQN_Respondent_sequence_number] = acr.[SEQN_Respondent_sequence_number]
	and (acr.[URDACT_Albumin_creatinine_ratio_mg_g] != 'nan')
	where (cast(demo.RIDAGEYR_Age_in_years_at_screening as float)  < 30)
	and (cast ( acr.[URDACT_Albumin_creatinine_ratio_mg_g] as float) > 30)	
	order by demo.RIDAGEYR_Age_in_years_at_screening,  acr.[URDACT_Albumin_creatinine_ratio_mg_g];


-- *******************************************************************

	


END
GO
