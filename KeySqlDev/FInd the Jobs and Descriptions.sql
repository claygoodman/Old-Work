SELECT V.name
,CASE V.enabled WHEN 1 THEN 'Enabled' ELSE 'Disabled' END AS JobStatus
,S.name AS CatName
,V.description 
FROM sysjobs_view V INNER JOIN syscategories S ON V.category_id = S.category_id
