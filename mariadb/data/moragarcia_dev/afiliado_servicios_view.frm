TYPE=VIEW
query=select `a`.`id` AS `afiliado_id`,`serv`.`sepelio` AS `sepelio`,`serv`.`smf` AS `smf`,`serv`.`crema` AS `crema`,`serv`.`ecco` AS `ecco`,`serv`.`sala` AS `sala`,`serv`.`imp` AS `imp`,`serv`.`carencia` AS `carencia` from (`moragarcia_dev`.`afiliados` `a` left join `moragarcia_dev`.`servicios_view` `serv` on(`serv`.`afiliado_id` = `a`.`id`)) where `a`.`active` = 1 and `a`.`afiliado_id` is null
md5=a75c0183779d5007930d8c06ad5444a8
updatable=0
algorithm=0
definer_user=root
definer_host=%
suid=1
with_check_option=0
timestamp=2021-10-29 18:52:06
create-version=2
source=select `a`.`id` AS `afiliado_id`,`serv`.`sepelio` AS `sepelio`,`serv`.`smf` AS `smf`,`serv`.`crema` AS `crema`,`serv`.`ecco` AS `ecco`,`serv`.`sala` AS `sala`,`serv`.`imp` AS `imp`,`serv`.`carencia` AS `carencia` from (`afiliados` `a` left join `servicios_view` `serv` on(`serv`.`afiliado_id` = `a`.`id`)) where `a`.`active` = 1 and `a`.`afiliado_id` is null
client_cs_name=utf8mb4
connection_cl_name=utf8mb4_general_ci
view_body_utf8=select `a`.`id` AS `afiliado_id`,`serv`.`sepelio` AS `sepelio`,`serv`.`smf` AS `smf`,`serv`.`crema` AS `crema`,`serv`.`ecco` AS `ecco`,`serv`.`sala` AS `sala`,`serv`.`imp` AS `imp`,`serv`.`carencia` AS `carencia` from (`moragarcia_dev`.`afiliados` `a` left join `moragarcia_dev`.`servicios_view` `serv` on(`serv`.`afiliado_id` = `a`.`id`)) where `a`.`active` = 1 and `a`.`afiliado_id` is null
mariadb-version=100604
