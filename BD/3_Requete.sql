/* debut des requetes */
/*                    */

/* requete les plus basiques possible*/
select * from agent
select * from mission
select * from service
select * from pays
select * from personne
select * from gere
select * from localise
select * from travail
select * from participe


/*affiche les nom de code des agents selon leur service*/

select nom_de_code, service.specialite as nom_service
from travail, service
where travail.nom_service = service.code_service


/*affiche tout les pays de niv de danger 4*/

select nom
from pays
where pays.niv_danger = 4

/*affiche tout les agents ayant fini au moins une mission*/

select distinct agent.nom_de_code
from agent, mission, participe
where agent.nom_de_code = participe.nom_de_code and mission.nom_mission = participe.nom_mission
and mission.etat_mission like 'fini'

/*agent ayant participer a au moins une mission*/

select agent.nom_de_code
from agent
where exists( select *
			  from participe, mission
			  where agent.nom_de_code = participe.nom_de_code and mission.nom_mission = participe.nom_mission )
