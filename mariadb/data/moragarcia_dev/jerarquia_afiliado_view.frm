TYPE=VIEW
query=with recursive cte(`id`,`afiliado_id`,`depth`) as (select `moragarcia_dev`.`afiliados`.`id` AS `id`,`moragarcia_dev`.`afiliados`.`afiliado_id` AS `afiliado_id`,1 AS `depth` from `moragarcia_dev`.`afiliados` where `moragarcia_dev`.`afiliados`.`id` = `f1`() union all select `P`.`id` AS `id`,`P`.`afiliado_id` AS `afiliado_id`,`cte`.`depth` + 1 AS ```depth`` + 1` from (`moragarcia_dev`.`afiliados` `P` join `cte` on(`P`.`afiliado_id` = `cte`.`id`)))select `cte`.`id` AS `id`,`cte`.`afiliado_id` AS `afiliado_id`,`cte`.`depth` AS `depth` from `cte`
md5=5b99304ce326866526d5a92e3acf61df
updatable=0
algorithm=0
definer_user=root
definer_host=%
suid=2
with_check_option=0
timestamp=2021-09-14 19:59:56
create-version=2
source=-- ejecutamos la vista de la siguiente manera:\n-- select mv.* from (select @f1:=1 p) param, jerarquia_afiliado_view mv;\nwith recursive cte(`id`,\n`afiliado_id`,\n`depth`) as (\nselect\n    `moragarcia_dev`.`afiliados`.`id` AS `id`,\n    `moragarcia_dev`.`afiliados`.`afiliado_id` AS `afiliado_id`,\n    1 AS `depth`\nfrom\n    `moragarcia_dev`.`afiliados`\nwhere\n    `moragarcia_dev`.`afiliados`.`id` = `f1`()\nunion all\nselect\n    `P`.`id` AS `id`,\n    `P`.`afiliado_id` AS `afiliado_id`,\n    `cte`.`depth` + 1 AS ```depth`` + 1`\nfrom\n    (`moragarcia_dev`.`afiliados` `P`\njoin `cte` on\n    (`P`.`afiliado_id` = `cte`.`id`))\n)select\n    `cte`.`id` AS `id`,\n    `cte`.`afiliado_id` AS `afiliado_id`,\n    `cte`.`depth` AS `depth`\nfrom\n    `cte`
client_cs_name=utf8mb4
connection_cl_name=utf8mb4_general_ci
view_body_utf8=with recursive cte(`id`,`afiliado_id`,`depth`) as (select `moragarcia_dev`.`afiliados`.`id` AS `id`,`moragarcia_dev`.`afiliados`.`afiliado_id` AS `afiliado_id`,1 AS `depth` from `moragarcia_dev`.`afiliados` where `moragarcia_dev`.`afiliados`.`id` = `f1`() union all select `P`.`id` AS `id`,`P`.`afiliado_id` AS `afiliado_id`,`cte`.`depth` + 1 AS ```depth`` + 1` from (`moragarcia_dev`.`afiliados` `P` join `cte` on(`P`.`afiliado_id` = `cte`.`id`)))select `cte`.`id` AS `id`,`cte`.`afiliado_id` AS `afiliado_id`,`cte`.`depth` AS `depth` from `cte`
mariadb-version=100511
