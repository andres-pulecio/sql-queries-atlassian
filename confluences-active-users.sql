WITH last_login_date AS
(SELECT user_id
        , to_timestamp(CAST(cua.attribute_value AS double precision)/1000) AS last_login
FROM cwd_user_attribute cua
WHERE cua.attribute_name = ‘lastAuthenticated’
        AND to_timestamp(CAST(cua.attribute_value AS double precision)/1000) < (CURRENT_DATE))
SELECT c.lower_user_name
        , l.last_login
        , c.email_address
FROM cwd_user c
INNER JOIN last_login_date l ON (c.id = l.user_id)
INNER JOIN cwd_membership m ON (c.id = m.child_id)
INNER JOIN cwd_group g     ON (m.parent_id = g.id)
WHERE g.group_name = ‘all@confluence.local’ AND c.active = ‘T’
ORDER BY last_login DESC;