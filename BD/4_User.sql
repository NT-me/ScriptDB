/*utilisateurs*/
/*            */

/*General ayant tout les droits*/

create user 'general'@'localhost' identified by 'IDgenIASA_';
grant all on * to 'general'@'localhost' with grant option;
flush privileges;

/*Directeur de service*/

create user 'chief'@'localhost' identified by 'IDchfIASA_';
grant select on agent_en_mission to 'chief'@'localhost';
grant select, update on agent to 'chief'@'localhost';
grant select, insert, update, delete on mission to 'chief'@'localhost';
grant select, insert, update, delete on participe to 'chief'@'localhost';
flush privileges;
