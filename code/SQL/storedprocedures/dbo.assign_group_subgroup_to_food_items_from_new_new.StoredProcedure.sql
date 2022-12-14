USE [cas_764_data_management_project]
GO
/****** Object:  StoredProcedure [dbo].[assign_group_subgroup_to_food_items_from_new_new]    Script Date: 2022-12-11 8:41:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[assign_group_subgroup_to_food_items_from_new_new]
AS
BEGIN
    --- This is no longer used
	truncate table map_food_to_groups_sub_groups

	insert into map_food_to_groups_sub_groups (usda_food_code, food_name)
	SELECT cast([DRXFDCD] as int), cast([DRXFCSD] as varchar)
	from [2015-2016-support-food-codes-DRXFCD_I]

	select * 
	from map_food_to_groups_sub_groups

	--Assign primary food group id
	--match code with usda code using usda_food_groups
	--insert id from food_groups_shift_recommendation

	---test to find the correct id
	select map.food_name, map.usda_food_code, substring(map.usda_food_code,1,1) as first_digit_usda_food_code, recom.usda_group_id as recom_usda_group_id
	,  recom.id, recom.id_to_use --, recom.usda_group_id_to_use
	, recom.food_group_name as recom_food_group_name, 
	 recom.id
	, map.*
	from map_food_to_groups_sub_groups map
	left join food_groups_shift_recommendation recom on substring(map.usda_food_code,1,1) = recom.usda_group_id   and (recom.is_in_usda = 1)
	--left join food_groups_shift_recommendation recom on substring(map.usda_food_code,1,1) = recom.usda_group_id_to_use   and (recom.is_in_usda = 1)
	--where substring(map.usda_food_code,1,1)  = 3
	--where  recom.food_group_name = 'Egg'
	--order by recom.food_group_name
	order by recom.usda_group_id

	--left join food_groups_shift_recommendation recom on case
	--	when  substring(map.usda_food_code,1,1) in (4) and recom.usda_group_id_to_use = substring(map.usda_food_code,1,1) /*and (recom.is_in_usda = 1)*/  then 1
	--	when  substring(map.usda_food_code,1,1) not in (4) and recom.usda_group_id = substring(map.usda_food_code,1,1) and (recom.is_in_usda = 1) then 1
	--	ELSE 0
 --       END = 1


	update map_food_to_groups_sub_groups 
	set group_id = (	
		select  recom.id
		from map_food_to_groups_sub_groups map2
		inner join food_groups_shift_recommendation recom on recom.usda_group_id = substring(map2.usda_food_code,1,1) and (recom.is_in_usda = 1)
		where map2.id = map_food_to_groups_sub_groups.id
	)

	select * 
	from map_food_to_groups_sub_groups

	select * 
	from map_food_to_groups_sub_groups



	update map_food_to_groups_sub_groups 
	set map_food_to_groups_sub_groups.group_name = (	
		select  recom.food_group_name
		from map_food_to_groups_sub_groups map2
		inner join food_groups_shift_recommendation recom on recom.usda_group_id = substring(map2.usda_food_code,1,1) and (recom.is_in_usda = 1)
		where map2.id = map_food_to_groups_sub_groups.id
	)

	select * 
	from map_food_to_groups_sub_groups

	update map_food_to_groups_sub_groups
	set group_name = (select top(1) recom.food_group_name
	from map_food_to_groups_sub_groups map
	left join food_groups_shift_recommendation recom on recom.usda_group_id = substring(map.usda_food_code,1,1) and recom.is_parent = 1)

	select * 
	from map_food_to_groups_sub_groups




	



END
GO
