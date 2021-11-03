TYPE=VIEW
query=select `a`.`id` AS `afi`,NULL AS `adh`,`p`.`apellido` AS `apellido`,`p`.`nombre` AS `nombre` from (`moragarcia_dev`.`afiliados` `a` join `moragarcia_dev`.`personas` `p` on(`p`.`id` = `a`.`persona_id`)) where `a`.`id` = 1 union all select `a`.`afiliado_id` AS `afi`,`a`.`id` AS `adh`,`p`.`apellido` AS `apellido`,`p`.`nombre` AS `nombre` from (`moragarcia_dev`.`afiliados` `a` join `moragarcia_dev`.`personas` `p` on(`p`.`id` = `a`.`persona_id`))
md5=b17273fee9588fb68683b3bc6100c8cf
updatable=0
algorithm=0
definer_user=root
definer_host=%
suid=2
with_check_option=0
timestamp=2021-09-14 18:16:38
create-version=2
source=SELECT a.id as afi, null as adh, p.apellido, p.nombre\nFROM afiliados a\ninNER join personas p on p.id = a.persona_id \nWHERE a.id = 1\nunion all\nSELECT a.afiliado_id as afi, a.id as adh, p.apellido, p.nombre\nFROM afiliados a\ninNER join personas p on p.id = a.persona_id
client_cs_name=utf8mb4
connection_cl_name=utf8mb4_general_ci
view_body_utf8=select `a`.`id` AS `afi`,NULL AS `adh`,`p`.`apellido` AS `apellido`,`p`.`nombre` AS `nombre` from (`moragarcia_dev`.`afiliados` `a` join `moragarcia_dev`.`personas` `p` on(`p`.`id` = `a`.`persona_id`)) where `a`.`id` = 1 union all select `a`.`afiliado_id` AS `afi`,`a`.`id` AS `adh`,`p`.`apellido` AS `apellido`,`p`.`nombre` AS `nombre` from (`moragarcia_dev`.`afiliados` `a` join `moragarcia_dev`.`personas` `p` on(`p`.`id` = `a`.`persona_id`))
mariadb-version=100511
