/*vu montrant les agent actuellement en mission*/

create view agent_en_mission
as select nom_de_code
	from mission, participe
	where mission.nom_mission = participe.nom_mission
	and mission.etat_mission like 'en cours'
