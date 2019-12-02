/*vues*/
/*    */

/*vue montrant les agent actuellement en mission*/

create view agent_en_mission
as select nom_de_code
	from mission, participe
	where mission.nom_mission = participe.nom_mission
	and mission.etat_mission like 'en cours';

/*vue faisant le classement des pays par niveau de danger*/
create view pays_ranking
as select nom, niv_danger
from pays
order by niv_danger desc;

/*vue classant les agents pas niv de confiance*/

create view agent_ranking
as select *
	from agent
	order by niv_confiance desc;	
