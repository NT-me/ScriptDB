/*utilisateurs*/
/*            */

/*General ayant tout les droits*/

create user 'general'@'localhost' identified by 'IDgenIASA_';
grant all on user to 'general'@'localhost' with grant option;
flush privileges;

/*Directeur de service*/

create user 'chief'@'localhost' identified by 'IDchfIASA_';
grant select on agent_en_mission to 'chief'@'localhost';
grant select on pays_ranking to 'chief'@'localhost';
grant select, update on agent to 'chief'@'localhost';
grant select, insert, update, delete on mission to 'chief'@'localhost';
grant select, insert, update, delete on participe to 'chief'@'localhost';
flush privileges;

/*utilisateur des agents lambda*/

create user 'agent'@'localhost' identified by 'IDagnIASA_';
grant select on pays_ranking to 'agent'@'localhost';
grant select on participe to 'agent'@'localhost';
flush privileges;
