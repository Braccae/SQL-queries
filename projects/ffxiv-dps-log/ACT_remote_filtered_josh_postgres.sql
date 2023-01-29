SELECT
	encounter_table.encid, encounter_table.zone, encounter_table.starttime,
    encounter_table.duration, combatant_table.name, job_role_key.job_name,
    job_role_key.role, job_role_key.role_short, combatant_table.encdps,
    combatant_table.enchps, combatant_table.kills, combatant_table.deaths
FROM
	combatant_table
LEFT JOIN encounter_table
	ON combatant_table.encid = encounter_table.encid
LEFT JOIN job_role_key
	ON combatant_table.job = job_role_key.job
WHERE
	combatant_table.name <> 'LMT'
	AND combatant_table.job IS NOT NULL
	AND combatant_table.job <> ''
	AND combatant_table.duration > 0
	AND combatant_table.encid IS NOT NULL 
--	AND encounter_table.encid <> ''
	AND encounter_table.encid IS NOT NULL;
