TYPE=VIEW
query=select `c`.`c_name` AS `country`,`t`.`year` AS `year`,`t`.`temp_rate` AS `temperature`,`s`.`s_level` AS `sea_level`,`ca`.`c_rate` AS `carbon` from (((`data_db`.`country` `c` join `data_db`.`temperature` `t` on(`c`.`c_id` = `t`.`c_id`)) join `data_db`.`sea_level` `s` on(`c`.`c_id` = `s`.`c_id` and `t`.`year` = `s`.`year`)) join `data_db`.`carbon` `ca` on(`c`.`c_id` = `ca`.`c_id` and `t`.`year` = `ca`.`year`))
md5=c423e6575ee9f4f26ef91cb550dccf53
updatable=1
algorithm=0
definer_user=root
definer_host=localhost
suid=2
with_check_option=0
timestamp=0001776452047123891
create-version=2
source=SELECT \n    c.c_name AS country,\n    t.year,\n    t.temp_rate AS temperature,\n    s.s_level AS sea_level,\n    ca.c_rate AS carbon\nFROM country c\nJOIN temperature t ON c.c_id = t.c_id\nJOIN sea_level s ON c.c_id = s.c_id AND t.year = s.year\nJOIN carbon ca ON c.c_id = ca.c_id AND t.year = ca.year
client_cs_name=utf8mb4
connection_cl_name=utf8mb4_unicode_ci
view_body_utf8=select `c`.`c_name` AS `country`,`t`.`year` AS `year`,`t`.`temp_rate` AS `temperature`,`s`.`s_level` AS `sea_level`,`ca`.`c_rate` AS `carbon` from (((`data_db`.`country` `c` join `data_db`.`temperature` `t` on(`c`.`c_id` = `t`.`c_id`)) join `data_db`.`sea_level` `s` on(`c`.`c_id` = `s`.`c_id` and `t`.`year` = `s`.`year`)) join `data_db`.`carbon` `ca` on(`c`.`c_id` = `ca`.`c_id` and `t`.`year` = `ca`.`year`))
mariadb-version=100432
