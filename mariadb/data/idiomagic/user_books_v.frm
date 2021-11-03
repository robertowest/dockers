TYPE=VIEW
query=select `u`.`id` AS `user_id`,`u`.`username` AS `user`,`u`.`role` AS `role`,`b`.`id` AS `book_id`,`b`.`name` AS `book` from ((`idiomagic`.`users` `u` join `idiomagic`.`book_keys` `bk` on(`bk`.`user_id` = `u`.`id`)) join `idiomagic`.`books` `b` on(`b`.`id` = `bk`.`book_id`)) where `b`.`active` = 1
md5=d8ec8f76aa2be8473ba74deeb56c467b
updatable=1
algorithm=0
definer_user=root
definer_host=%
suid=2
with_check_option=0
timestamp=2018-11-05 18:14:49
create-version=2
source=select `u`.`id` AS `user_id`,`u`.`username` AS `user`,`u`.`role` AS `role`,`b`.`id` AS `book_id`,`b`.`name` AS `book` from ((`users` `u` join `book_keys` `bk` on(`bk`.`user_id` = `u`.`id`)) join `books` `b` on(`b`.`id` = `bk`.`book_id`)) where `b`.`active` = 1
client_cs_name=utf8mb4
connection_cl_name=latin1_spanish_ci
view_body_utf8=select `u`.`id` AS `user_id`,`u`.`username` AS `user`,`u`.`role` AS `role`,`b`.`id` AS `book_id`,`b`.`name` AS `book` from ((`idiomagic`.`users` `u` join `idiomagic`.`book_keys` `bk` on(`bk`.`user_id` = `u`.`id`)) join `idiomagic`.`books` `b` on(`b`.`id` = `bk`.`book_id`)) where `b`.`active` = 1
mariadb-version=100310
