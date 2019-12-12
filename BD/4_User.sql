/*utilisateurs*/
/*            */

/*General ayant tout les droits*/

create user 'general'@'localhost' identified by 'IDgenIASA_';
GRANT ALL PRIVILEGES ON *.* TO 'general'@'localhost' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON `iasa`.`user` TO 'general'@'localhost' WITH GRANT OPTION;
flush privileges;

/*Directeur de service*/

create user 'chief'@'localhost' identified by 'IDchfIASA_';
  GRANT SELECT, INSERT, UPDATE, DELETE ON `test_projetdb`.`participe` TO 'chief'@'localhost';

  GRANT SELECT, INSERT, UPDATE, DELETE ON `test_projetdb`.`mission` TO 'chief'@'localhost';

  GRANT SELECT, UPDATE ON `iasa`.`agent` TO 'chief'@'localhost';

  GRANT SELECT, UPDATE ON `test_projetdb`.`agent` TO 'chief'@'localhost';

  GRANT SELECT ON `iasa`.`pays_ranking` TO 'chief'@'localhost';

  GRANT SELECT ON `iasa`.`agent_en_mission` TO 'chief'@'localhost';

  GRANT SELECT ON `iasa`.`localise` TO 'chief'@'localhost';

  GRANT SELECT ON `test_projetdb`.`pays_ranking` TO 'chief'@'localhost';

  GRANT SELECT ON `iasa`.`travail` TO 'chief'@'localhost';

  GRANT SELECT ON `iasa`.`gere` TO 'chief'@'localhost';

  GRANT SELECT, INSERT, UPDATE, DELETE ON `iasa`.`participe` TO 'chief'@'localhost';

  GRANT SELECT, INSERT, UPDATE, DELETE ON `iasa`.`mission` TO 'chief'@'localhost';

  GRANT SELECT ON `test_projetdb`.`agent_en_mission` TO 'chief'@'localhost';
flush privileges;

/*utilisateur des agents lambda*/

create user 'agent'@'localhost' identified by 'IDagnIASA_';
  GRANT USAGE ON *.* TO 'agent'@'localhost';

  GRANT SELECT ON `iasa`.`agent` TO 'agent'@'localhost';

  GRANT SELECT ON `iasa`.`localise` TO 'agent'@'localhost';

  GRANT SELECT ON `test_projetdb`.`pays_ranking` TO 'agent'@'localhost';

  GRANT SELECT ON `iasa`.`mission` TO 'agent'@'localhost';

  GRANT SELECT ON `iasa`.`pays_ranking` TO 'agent'@'localhost';

  GRANT SELECT ON `iasa`.`participe` TO 'agent'@'localhost';

  GRANT SELECT ON `test_projetdb`.`participe` TO 'agent'@'localhost';
flush privileges;
