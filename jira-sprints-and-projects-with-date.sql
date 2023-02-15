select cfv.issue, cfv.stringvalue as SprintNumber, ao."NAME" as SprintName, ao."START_DATE", ao."END_DATE" , cf.cfname, p.pkey || '-' || issue.IssueNum as IssueKey , p.pkey
from CustomFieldValue cfv 
join CustomField CF on CF.Id = CFV.CustomField
join jiraissue issue on issue.id = cfv.issue
join Project P on issue.Project = P.Id
join "AO_60DB71_SPRINT" ao on ao."ID" = Cast(cfv.stringvalue AS bigint) 
where cf.cfname='Sprint';