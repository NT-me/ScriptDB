/*requete d'update*/
/*                */

/*update simple*/
update agent
set niv_confiance = niv_confiance + 20
where agent.nom_de_code like 'dordogne'

/*update du niv de confiance de tout les agents ayant participer
 a une mission particuliere*/
update agent
set niv_confiance = niv_confiance + 5
where agent.nom_de_code in
  (select agent.nom_de_code
   from participe
   where agent.nom_de_code = participe.nom_de_code
   and participe.nom_mission like 'argonaut')

/*requete suppression*/
/*                   */

/*delete simple d'un tuples*/

delete from pays
where pays.nom like 'Union of Soviet Socialist Republics'

/*tout les agents n'ayant jamais participer a une mission*/

delete from agent
where agent.nom_de_code not in
  (select agent.nom_de_code
   from participe
   where agent.nom_de_code = participe.nom_de_code)
