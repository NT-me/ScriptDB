/* debut des requetes */
/*                    */

/* requete les plus basiques possible*/
select * from agent;
select * from mission;
select * from service;
select * from pays;
select * from personne;
select * from gere;
select * from localise;
select * from travail;
select * from participe;


/*affiche les nom de code des agents selon leur service*/

select nom_de_code, service.specialite as nom_service
from travail, service
where travail.nom_service = service.code_service;


/*affiche tout les pays de niv de danger 4*/

select nom
from pays
where pays.niv_danger = 4;

/*affiche tout les agents ayant fini au moins une mission*/

select distinct agent.nom_de_code
from agent, mission, participe
where agent.nom_de_code = participe.nom_de_code
and mission.nom_mission = participe.nom_mission
and mission.etat_mission like 'fini';

/*agent n'ayant jamais participer a une mission*/

select agent.nom_de_code
from agent
where exists( select *
			  from participe, mission
			  where agent.nom_de_code = participe.nom_de_code
			  and mission.nom_mission = participe.nom_mission );


/* requete simple permettant de trouver les participants d'une mission
   en particulier*/

select nom_de_code
from participe
where participe.nom_mission like 'imperator';

/*les agents avec un niv de confiance d'au moins 60*/

select nom_de_code
from agent
where agent.niv_confiance >= 60;

/*nom des services ayant au moins agent avec un niv de confiance de 100*/

select distinct service.specialite as nom_service
from service
where exists( select service.specialite, agent.nom_de_code
			  from travail,agent
			  where service.code_service = travail.nom_service
			  and travail.nom_de_code = agent.nom_de_code
			  and agent.niv_confiance = 100 );

/*calcul age moyen des agents male ce trouvant en france*/

select avg(personne.age) as moyenne_age
from personne
where personne.nom_pays like 'france' and personne.sexe = 'male';

/* nombre total d'agent dans la base de données selon leur sexe*/
select personne.sexe, count(personne.nom_agent)
from personne
group by personne.sexe;

/*les niveau de danger et nom des pays dans lesquelle
  au moins une mission a ete fini*/
select P.nom, P.niv_danger
from (pays P join localise L on P.nom = L.nom_pays)
	  join mission mis on mis.nom_mission = L.nom_mission
where mis.etat_mission like 'fini'
order by P.niv_danger desc;

/*Tous les pays où sont terminés des missions d'un service x */
select pays.nom
from pays
where exists ( select *
			   from gere, mission,localise, service
			   where gere.nom_mission = mission.nom_mission
			   and mission.nom_mission = localise.nom_mission
			   and localise.nom_pays = pays.nom
			   and service.specialite = mission.type_mission
			   and mission.etat_mission like 'fini'
			   and service.specialite like 'elimination');

/*jointure externe entre agent et participe*/
select *
from agent
left join participe
on agent.nom_de_code = participe.nom_de_code;

/*le nombre de mission fini pour chaque agent qui a deja fin*/
select nom_de_code, count(*) as nb_mission
from participe, mission
where participe.nom_mission = mission.nom_mission
and mission.etat_mission = 'fini'
group by nom_de_code
order by nb_mission desc;

/*La moyenne de niveau de confiance des agents ayant des missions en cours*/

select avg(niv_confiance) as moy_conf
from participe, mission, agent
where participe.nom_mission = mission.nom_mission
and agent.nom_de_code = participe.nom_de_code
and mission.etat_mission like 'en cours';

/*nombre de pays dans lesquelles ce sont derouler au moins 2 mission*/

select count(pays.nom)
from pays
where exists (select pays.nom, count(*) as nb_mission
			  from localise
			  where pays.nom = localise.nom_pays
			  group by pays.nom
			  having count(localise.nom_pays) >= 2);
