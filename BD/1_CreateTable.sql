drop table if exists localise, gere, participe, travail, personne, pays, mission, service, agent;

create table agent(
	nom_de_code varchar(30) primary key,
	niv_acces decimal(4) not null,
	niv_confiance decimal(4),
	etat_de_service varchar(100));

create table mission(
	nom_mission varchar(30) primary key,
	type_mission varchar(30),
	etat_mission varchar(30) not null);

create table pays(
	nom varchar(50) primary key,
	niv_danger decimal(4));

create table service(
	code_service integer(8) primary key,
	specialite varchar(30) not null,
	directeur varchar(30) not null,
	foreign key (directeur) references agent (nom_de_code) on delete cascade on update cascade);

create table personne(
	nom varchar(30) not null,
	prenom varchar(30)not null,
	age decimal(4) not null,
	sexe varchar(30) not null,
	nom_agent varchar(30) not null,
	nom_pays varchar(50) not null,
	primary key (nom, prenom),
	foreign key (nom_agent) references agent (nom_de_code) on delete cascade on update cascade,
	foreign key (nom_pays) references pays (nom) on delete cascade on update cascade);

create table travail(
	nom_de_code varchar(30) not null,
	nom_service integer(8) not null,
	primary key(nom_de_code, nom_service),
	foreign key (nom_de_code) references agent (nom_de_code) on delete cascade on update cascade,
	foreign key (nom_service) references service(code_service) on delete cascade on update cascade);


create table participe(
	nom_de_code varchar(30) not null,
	nom_mission varchar(30) not null,
	primary key (nom_de_code, nom_mission),
	foreign key (nom_de_code) references agent (nom_de_code) on delete cascade on update cascade,
	foreign key (nom_mission) references mission (nom_mission) on delete cascade on update cascade);

create table gere(
	nom_service integer(8) not null,
	nom_mission varchar(30) not null,
	primary key (nom_service, nom_mission),
	foreign key (nom_service) references service(code_service) on delete cascade on update cascade,
	foreign key (nom_mission) references mission (nom_mission) on delete cascade on update cascade);

create table localise(
	nom_pays varchar(50) not null,
	nom_mission varchar(30) not null,
	primary key (nom_pays, nom_mission),
	foreign key (nom_mission) references mission (nom_mission) on delete cascade on update cascade,
	foreign key (nom_pays) references pays (nom) on delete cascade on update cascade);
