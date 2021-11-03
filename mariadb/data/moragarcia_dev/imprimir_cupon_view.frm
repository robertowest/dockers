TYPE=VIEW
query=select `cup`.`id` AS `cupon_id`,`cup`.`fecha_emision` AS `fecha_emision`,`cup`.`fecha_cobro` AS `fecha_cobro`,`cup`.`valor` AS `valor`,`cup`.`certificado_id` AS `certificado_id`,`cer`.`codigo` AS `codigo`,`cer`.`zona_id` AS `zona_id`,`zon`.`nombre` AS `zona`,`cer`.`plan_id` AS `plan_id`,`pla`.`nombre` AS `plan`,`cer`.`afiliado_id` AS `afiliado_id`,`afi`.`fecha_alta` AS `fecha_alta`,`afi`.`persona_id` AS `persona_id`,`per`.`apellido` AS `apellido`,`per`.`nombre` AS `nombre`,`dom`.`nombre` AS `calle`,`dom`.`numero` AS `numero`,`dom`.`piso` AS `piso`,`dom`.`puerta` AS `puerta`,`dom`.`barrio` AS `barrio` from ((((((`moragarcia_dev`.`cupones` `cup` join `moragarcia_dev`.`certificados` `cer` on(`cer`.`id` = `cup`.`certificado_id`)) join `moragarcia_dev`.`zonas` `zon` on(`zon`.`id` = `cer`.`zona_id`)) join `moragarcia_dev`.`planes` `pla` on(`pla`.`id` = `cer`.`plan_id`)) join `moragarcia_dev`.`afiliados` `afi` on(`afi`.`id` = `cer`.`afiliado_id`)) join `moragarcia_dev`.`personas` `per` on(`per`.`id` = `afi`.`persona_id`)) join `moragarcia_dev`.`domicilios` `dom` on(`dom`.`id` = `afi`.`domicilio_id`))
md5=428915b72a59127ccf13ab9d7393ecd6
updatable=1
algorithm=0
definer_user=root
definer_host=%
suid=2
with_check_option=0
timestamp=2021-10-29 19:35:10
create-version=2
source=Select \n	cup.id cupon_id, cup.fecha_emision, cup.fecha_cobro, cup.valor,\n	cup.certificado_id, cer.codigo, \n	cer.zona_id, zon.nombre zona, \n	cer.plan_id, pla.nombre plan, \n	cer.afiliado_id, afi.fecha_alta,\n	afi.persona_id, per.apellido, per.nombre,\n	dom.nombre calle, dom.numero, dom.piso, dom.puerta, dom.barrio\nFrom cupones cup \nInner Join certificados cer on cer.id = cup.certificado_id \nInner Join zonas zon on zon.id = cer.zona_id\nInner Join planes pla on pla.id = cer.plan_id\nInner Join afiliados afi on afi.id = cer.afiliado_id\nInner Join personas per on per.id = afi.persona_id\nInner Join domicilios dom on dom.id = afi.domicilio_id
client_cs_name=utf8mb4
connection_cl_name=utf8mb4_unicode_ci
view_body_utf8=select `cup`.`id` AS `cupon_id`,`cup`.`fecha_emision` AS `fecha_emision`,`cup`.`fecha_cobro` AS `fecha_cobro`,`cup`.`valor` AS `valor`,`cup`.`certificado_id` AS `certificado_id`,`cer`.`codigo` AS `codigo`,`cer`.`zona_id` AS `zona_id`,`zon`.`nombre` AS `zona`,`cer`.`plan_id` AS `plan_id`,`pla`.`nombre` AS `plan`,`cer`.`afiliado_id` AS `afiliado_id`,`afi`.`fecha_alta` AS `fecha_alta`,`afi`.`persona_id` AS `persona_id`,`per`.`apellido` AS `apellido`,`per`.`nombre` AS `nombre`,`dom`.`nombre` AS `calle`,`dom`.`numero` AS `numero`,`dom`.`piso` AS `piso`,`dom`.`puerta` AS `puerta`,`dom`.`barrio` AS `barrio` from ((((((`moragarcia_dev`.`cupones` `cup` join `moragarcia_dev`.`certificados` `cer` on(`cer`.`id` = `cup`.`certificado_id`)) join `moragarcia_dev`.`zonas` `zon` on(`zon`.`id` = `cer`.`zona_id`)) join `moragarcia_dev`.`planes` `pla` on(`pla`.`id` = `cer`.`plan_id`)) join `moragarcia_dev`.`afiliados` `afi` on(`afi`.`id` = `cer`.`afiliado_id`)) join `moragarcia_dev`.`personas` `per` on(`per`.`id` = `afi`.`persona_id`)) join `moragarcia_dev`.`domicilios` `dom` on(`dom`.`id` = `afi`.`domicilio_id`))
mariadb-version=100604
