TYPE=VIEW
query=select `b`.`id` AS `book_id`,`b`.`name` AS `book`,`bu`.`id` AS `unit_id`,`bu`.`name` AS `unit`,`bs`.`id` AS `section_id`,`bs`.`name` AS `section`,`bs`.`role` AS `role`,`bm`.`id` AS `material_id`,`bm`.`name` AS `material`,`bm`.`path` AS `path`,`bm`.`filename` AS `filename`,`bm`.`downloadable` AS `downloadable` from (((`idiomagic`.`book_materials` `bm` join `idiomagic`.`book_units` `bu` on(`bu`.`id` = `bm`.`book_unit_id`)) join `idiomagic`.`book_sections` `bs` on(`bs`.`id` = `bm`.`book_section_id`)) join `idiomagic`.`books` `b` on(`b`.`id` = `bm`.`book_id`)) where `bm`.`active` = 1 order by `bu`.`id`,`bs`.`ordering`
md5=5949c727d8f26b3152a570f4f9aaf5aa
updatable=1
algorithm=0
definer_user=root
definer_host=%
suid=2
with_check_option=0
timestamp=2018-11-05 18:14:01
create-version=2
source=select `b`.`id` AS `book_id`,`b`.`name` AS `book`,`bu`.`id` AS `unit_id`,`bu`.`name` AS `unit`,`bs`.`id` AS `section_id`,`bs`.`name` AS `section`,`bs`.`role` AS `role`,`bm`.`id` AS `material_id`,`bm`.`name` AS `material`,`bm`.`path` AS `path`,`bm`.`filename` AS `filename`,`bm`.`downloadable` AS `downloadable` from (((`book_materials` `bm` join `book_units` `bu` on(`bu`.`id` = `bm`.`book_unit_id`)) join `book_sections` `bs` on(`bs`.`id` = `bm`.`book_section_id`)) join `books` `b` on(`b`.`id` = `bm`.`book_id`)) where `bm`.`active` = 1 order by `bu`.`id`,`bs`.`ordering`
client_cs_name=utf8mb4
connection_cl_name=latin1_spanish_ci
view_body_utf8=select `b`.`id` AS `book_id`,`b`.`name` AS `book`,`bu`.`id` AS `unit_id`,`bu`.`name` AS `unit`,`bs`.`id` AS `section_id`,`bs`.`name` AS `section`,`bs`.`role` AS `role`,`bm`.`id` AS `material_id`,`bm`.`name` AS `material`,`bm`.`path` AS `path`,`bm`.`filename` AS `filename`,`bm`.`downloadable` AS `downloadable` from (((`idiomagic`.`book_materials` `bm` join `idiomagic`.`book_units` `bu` on(`bu`.`id` = `bm`.`book_unit_id`)) join `idiomagic`.`book_sections` `bs` on(`bs`.`id` = `bm`.`book_section_id`)) join `idiomagic`.`books` `b` on(`b`.`id` = `bm`.`book_id`)) where `bm`.`active` = 1 order by `bu`.`id`,`bs`.`ordering`
mariadb-version=100310
