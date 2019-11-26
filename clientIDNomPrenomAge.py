import csv
import random as ran

nom_file = "FakeNameGenerator.com_35c19394.csv"
resfile = open("out.txt", "w")
clientID = 1000
res = ""
with open(nom_file, newline='') as csvfile:
    spamreader = csv.reader(csvfile, delimiter=',', quotechar='|')
    for row in spamreader:
        # Prénom
        prenom = row[0]
        # Nom
        nom = row[2]
        # Age
        age = row[1]
        # ActeurID
        clientID = clientID + 1
        # filmID
        filmID = ran.randint(500, 599)

        # Forge de la requête
        req = '('+str(clientID)+','+nom+','+prenom+','+str(age)+')'+','+'\n'
        res = res + req
    resfile.write(res)
resfile.close()
