TYPE=TRIGGERS
triggers='CREATE DEFINER=`root`@`localhost` TRIGGER sea_level_check\nBEFORE INSERT ON sea_level\nFOR EACH ROW\nBEGIN\n    IF NEW.s_level < 0 THEN\n        SIGNAL SQLSTATE \'45000\'\n        SET MESSAGE_TEXT = \'Sea level cannot be negative\';\n    END IF;\nEND' 'CREATE DEFINER=`root`@`localhost` TRIGGER sea_level_check_update\nBEFORE UPDATE ON sea_level\nFOR EACH ROW\nBEGIN\n    IF NEW.s_level < 0 THEN\n        SIGNAL SQLSTATE \'45000\'\n        SET MESSAGE_TEXT = \'Sea level cannot be negative\';\n    END IF;\nEND'
sql_modes=1098907648 1098907648
definers='root@localhost' 'root@localhost'
client_cs_names='utf8mb4' 'utf8mb4'
connection_cl_names='utf8mb4_unicode_ci' 'utf8mb4_unicode_ci'
db_cl_names='utf8mb4_general_ci' 'utf8mb4_general_ci'
created=1776490215611890 1776490511124896
