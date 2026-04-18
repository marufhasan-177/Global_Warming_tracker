TYPE=TRIGGERS
triggers='CREATE DEFINER=`root`@`localhost` TRIGGER `carbon_check` BEFORE INSERT ON `carbon` FOR EACH ROW BEGIN\n    IF NEW.c_rate > 30 OR NEW.c_rate < 0 THEN\n        SIGNAL SQLSTATE \'45000\'\n        SET MESSAGE_TEXT = \'Carbon rate must be between 0 and 30\';\n    END IF;\nEND' 'CREATE DEFINER=`root`@`localhost` TRIGGER carbon_check_update\nBEFORE UPDATE ON carbon\nFOR EACH ROW\nBEGIN\n    IF NEW.c_rate > 20 OR NEW.c_rate < 0 THEN\n        SIGNAL SQLSTATE \'45000\'\n        SET MESSAGE_TEXT = \'Carbon rate must be between 0 and 20\';\n    END IF;\nEND'
sql_modes=1098907648 1098907648
definers='root@localhost' 'root@localhost'
client_cs_names='utf8mb4' 'utf8mb4'
connection_cl_names='utf8mb4_unicode_ci' 'utf8mb4_unicode_ci'
db_cl_names='utf8mb4_general_ci' 'utf8mb4_general_ci'
created=1776490242782703 1776490485470993
