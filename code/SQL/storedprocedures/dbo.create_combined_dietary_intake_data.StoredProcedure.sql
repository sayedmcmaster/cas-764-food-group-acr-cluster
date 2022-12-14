USE [cas_764_data_management_project]
GO
/****** Object:  StoredProcedure [dbo].[create_combined_dietary_intake_data]    Script Date: 2022-12-11 8:41:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[create_combined_dietary_intake_data]
AS
BEGIN

	truncate table [combinedDietaryIntakeData];

	-- insert into [combinedDietaryIntakeData]
	-- select * from [transferred-2015-2016-multi-day-dietary-interview-individual-foods-DR1IFF_I];

	insert into [combinedDietaryIntakeData]
	-- select * from [varchar-2015-2016-multi-day-dietary-interview-individual-foods-DR1IFF_I]
	-- union
	select '2017-2018', diet.* from [old_2017_2018_1_Dietary Interview - Individual Foods, First Day_DR1IFF_J.XPT] diet
	union
	select '2017-2018', diet2.* from [2017_2018_2_Dietary Interview - Individual Foods, Second Day_DR2IFF_J.XPT] diet2
	union
	select * from [varchar-2015-2016-multi-day-dietary-interview-individual-foods-DR1IFF_I]
	union
	select * from [2013_2014_1_Dietary Interview - Individual Foods, First Day-DR1IFF_H.XPT]
	union
	select * from [2013_2014_2_Dietary Interview - Individual Foods, Second Day-DR2IFF_H.XPT]
	union
	select *  from [new_2011_2012_1_Dietary Interview - Individual Foods, First Day-DR1IFF_G.XPT]
	union
	select * from [new_2011_2012_2_Dietary Interview - Individual Foods, Second Day-DR2IFF_G.XPT]




	-- 2017 - 2018
	-- select  *
	-- from CombinedDemographicsData demo
	-- inner join [2017_2018dietaryinterview individual foodsseconddaydr2iffj] diet 
	-- on diet.[SEQN - Respondent sequence number]= demo.[SEQN_Respondent_sequence_number];


END
GO
