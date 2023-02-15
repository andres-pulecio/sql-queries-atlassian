SELECT DISTINCT p.pkey,p.LEAD,MAX(i.UPDATED) as "Last Updated"
FROM jiraissue i
INNER JOIN project p
ON p.ID = i.PROJECT
GROUP BY p.pkey,p.LEAD
ORDER BY MAX(i.UPDATED) ASC;