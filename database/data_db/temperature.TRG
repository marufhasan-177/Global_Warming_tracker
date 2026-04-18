TYPE=TRIGGERS
triggers='CREATE DEFINER=`root`@`localhost` TRIGGER temp_check\nBEFORE INSERT ON temperature\nFOR EACH ROW\nBEGIN\n    IF NEW.temp_rate > 80 OR NEW.temp_rate < -80 THEN\n        SIGNAL SQLSTATE \'45000\'\n        SET MESSAGE_TEXT = \'Temperature out of range (-80 to 80)\';\n    END IF;\nEND' 'CREATE DEFINER=`root`@`localhost` TRIGGER temp_check_update\nBEFORE UPDATE ON temperature\nFOR EACH ROW\nBEGIN\n    IF NEW.temp_rate > 80 OR NEW.temp_rate < -80 THEN\n        SIGNAL SQLSTATE \'45000\'\n        SET MESSAGE_TEXT = \'Temperature out of range (-80 to 80)\';\n    END IF;\nEND'
sql_modes=1098907648 1098907648
definers='root@localhost' 'root@localhost'
client_cs_names='utf8mb4' 'utf8mb4'
connection_cl_names='utf8mb4_unicode_ci' 'utf8mb4_unicode_ci'
db_cl_names='utf8mb4_general_ci' 'utf8mb4_general_ci'
created=1776490132957269 1776490464366736
