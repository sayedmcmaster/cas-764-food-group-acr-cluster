USE [cas_764_data_management_project]
GO
/****** Object:  StoredProcedure [dbo].[create_Combined_Urine_Albumin_Creatinine_Ratio]    Script Date: 2022-12-11 8:41:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[create_Combined_Urine_Albumin_Creatinine_Ratio]
AS
BEGIN

truncate table CombinedUrineAlbuminCreatinineRatio;


-- 2011 - 2012
insert into CombinedUrineAlbuminCreatinineRatio
(
	   [DataYear]
	   ,[SEQN_Respondent_sequence_number]
      ,[URXUMA_Albumin_urine_ug_mL]
      ,[URXUMS_Albumin_urine_mg_L]
      ,[URXUCR_Creatinine_urine_mg_dL]
      ,[URXCRS_Creatinine_urine_umol_L]
      ,[URDACT_Albumin_creatinine_ratio_mg_g]

) SELECT '2011-2012', [SEQN_Respondent_sequence_number]
      ,[URXUMA_Albumin_urine_ug_mL]
      ,[URXUMS_Albumin_urine_mg_L]
      ,[URXUCR_Creatinine_urine_mg_dL]
      ,[URXCRS_Creatinine_urine_umol_L]
      ,[URDACT_Albumin_creatinine_ratio_mg_g]
  FROM [cas_764_data_management_project].[dbo].[2011_2012_Albumin & Creatinine - Urine-ALB_CR_G.XPT]


-- 2013 - 2014

insert into CombinedUrineAlbuminCreatinineRatio
(
	   [DataYear]
	   , [SEQN_Respondent_sequence_number]
	   ,[URXUMA_Albumin_urine_ug_mL]
      ,[URXUMS_Albumin_urine_mg_L]
      ,[URXUCR_Creatinine_urine_mg_dL]
      ,[URXCRS_Creatinine_urine_umol_L]
      ,[URDACT_Albumin_creatinine_ratio_mg_g]

) SELECT '2013-2014'
	  ,[SEQN_Respondent_sequence_number]
	  ,[URXUMA_Albumin_urine_ug_mL]
      ,[URXUMS_Albumin_urine_mg_L]
      ,[URXUCR_Creatinine_urine_mg_dL]
      ,[URXCRS_Creatinine_urine_umol_L]
      ,[URDACT_Albumin_creatinine_ratio_mg_g]
  FROM [cas_764_data_management_project].[dbo].[2013_2014_Albumin & Creatinine - Urine_ALB_CR_H.XPT];

-- 2015 - 2016
insert into CombinedUrineAlbuminCreatinineRatio
(
	   [DataYear]
	   ,[SEQN_Respondent_sequence_number]
      ,[URXUMA_Albumin_urine_ug_mL]
      ,[URDUMALC_Albumin_urine_comment_code]
      ,[URXUMS_Albumin_urine_mg_L]
      ,[URXUCR_Creatinine_urine_mg_dL]
      ,[URDUCRLC_Creatinine_urine_comment_code]
      ,[URXCRS_Creatinine_urine_umol_L]
      ,[URDACT_Albumin_creatinine_ratio_mg_g]

) SELECT '2015-2016', 
	  [SEQN_Respondent_sequence_number]
      ,[URXUMA_Albumin_urine_ug_mL]
      ,[URDUMALC_Albumin_urine_comment_code]
      ,[URXUMS_Albumin_urine_mg_L]
      ,[URXUCR_Creatinine_urine_mg_dL]
      ,[URDUCRLC_Creatinine_urine_comment_code]
      ,[URXCRS_Creatinine_urine_umol_L]
      ,[URDACT_Albumin_creatinine_ratio_mg_g]
  FROM [cas_764_data_management_project].[dbo].[2015_2016_Albumin & Creatinine - Urine-ALB_CR_I.XPT];

  -- 2017 - 2018
  insert into CombinedUrineAlbuminCreatinineRatio
(
	   [DataYear]
	   ,[SEQN_Respondent_sequence_number]
      ,[URXUMA_Albumin_urine_ug_mL]
      ,[URXUMS_Albumin_urine_mg_L]
      ,[URDUMALC_Albumin_urine_comment_code]
      ,[URXUCR_Creatinine_urine_mg_dL]
      ,[URXCRS_Creatinine_urine_umol_L]
      ,[URDUCRLC_Creatinine_urine_comment_code]
      ,[URDACT_Albumin_creatinine_ratio_mg_g]

) SELECT '2017-2018', 
	  [SEQN_Respondent_sequence_number]
      ,[URXUMA_Albumin_urine_ug_mL]
      ,[URDUMALC_Albumin_urine_comment_code]
      ,[URXUMS_Albumin_urine_mg_L]
      ,[URXUCR_Creatinine_urine_mg_dL]
      ,[URDUCRLC_Creatinine_urine_comment_code]
      ,[URXCRS_Creatinine_urine_umol_L]
      ,[URDACT_Albumin_creatinine_ratio_mg_g]
  FROM [cas_764_data_management_project].[dbo].[2017_2018_Albumin & Creatinine - Urine-ALB_CR_J.XPT]



END
GO
