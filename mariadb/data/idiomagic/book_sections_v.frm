TYPE=VIEW
query=select `bm`.`book_id` AS `book_id`,`bs`.`id` AS `section_id`,`bs`.`name` AS `name`,`bs`.`role` AS `role` from (`idiomagic`.`book_materials` `bm` join `idiomagic`.`book_sections` `bs` on(`bs`.`id` = `bm`.`book_section_id`)) group by `bm`.`book_id`,`bs`.`id`,`bs`.`name`,`bs`.`role` order by `bs`.`ordering`
md5=390ad16af9bc55ca3a5b3dd132237079
updatable=0
algorithm=0
definer_user=root
definer_host=%
suid=2
with_check_option=0
timestamp=2018-11-05 18:14:29
create-version=2
source=select `bm`.`book_id` AS `book_id`,`bs`.`id` AS `section_id`,`bs`.`name` AS `name`,`bs`.`role` AS `role` from (`book_materials` `bm` join `book_sections` `bs` on(`bs`.`id` = `bm`.`book_section_id`)) group by `bm`.`book_id`,`bs`.`id`,`bs`.`name`,`bs`.`role` order by `bs`.`ordering`
client_cs_name=utf8mb4
connection_cl_name=latin1_spanish_ci
view_body_utf8=select `bm`.`book_id` AS `book_id`,`bs`.`id` AS `section_id`,`bs`.`name` AS `name`,`bs`.`role` AS `role` from (`idiomagic`.`book_materials` `bm` join `idiomagic`.`book_sections` `bs` on(`bs`.`id` = `bm`.`book_section_id`)) group by `bm`.`book_id`,`bs`.`id`,`bs`.`name`,`bs`.`role` order by `bs`.`ordering`
mariadb-version=100310
