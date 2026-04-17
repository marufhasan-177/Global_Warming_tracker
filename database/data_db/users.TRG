TYPE=TRIGGERS
triggers='CREATE DEFINER=`root`@`localhost` TRIGGER before_create_account\nBEFORE INSERT ON users\nFOR EACH ROW\nBEGIN\n	DECLARE u_count INT;\n    \n    SELECT COUNT(*) INTO u_count\n    FROM users WHERE lower(u_name)=LOWER(new.u_name);\n    \n    if u_count > 0 THEN\n    SIGNAL SQLSTATE \'45000\'\n    SET MESSAGE_TEXT =\'User name already exist...!\';\n    END if;\nEND'
sql_modes=1098907648
definers='root@localhost'
client_cs_names='utf8mb4'
connection_cl_names='utf8mb4_unicode_ci'
db_cl_names='utf8mb4_general_ci'
created=1776363291672040
