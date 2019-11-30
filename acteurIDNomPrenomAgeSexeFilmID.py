import csv
import random as ran

nom_file = "FakeNameGenerator.com_78f8e78d.csv"
resfile = open("out.txt", "w")
acteurID = 604
res = ""
with open(nom_file, newline='') as csvfile:
    spamreader = csv.reader(csvfile, delimiter=',', quotechar='|')
    for row in spamreader:
        # GENRE
        if row[0] == 'male':
            genre = 'homme'
        elif row[0] == 'female':
            genre = 'femme'
        else:
            genre = 'N/A'
        # Prénom
        prenom = row[1]
        # Nom
        nom = row[2]
        # Age
        age = row[3]
        # ActeurID
        acteurID = acteurID + 1
        # filmID
        filmID = ran.randint(500, 599)

        # Forge de la requête
        req = '('+str(acteurID)+','+nom+','+prenom+','+str(age)+','+genre+','+str(filmID)+')'+','+'\n'
        res= res + req
    resfile.write(res)
resfile.close()
