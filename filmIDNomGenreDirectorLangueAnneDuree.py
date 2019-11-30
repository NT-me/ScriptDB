import csv
import random as ran

nom_file = "movies_metadata.csv"
resfile = open("out.txt", "w")
filmID = 1000
res = ""
with open(nom_file, newline='') as csvfile:
    spamreader = csv.reader(csvfile, delimiter=',', quotechar='|')
    for row in spamreader:
        if row[0] != "adult":
            nom = row[7]
            genre = row[3][0]['name']
            age = row[1]
            filmID = filmID + 1
            filmID = ran.randint(500, 599)

            # Forge de la requête
            req = '('+str(filmID)+','+nom+','+prenom+','+str(age)+')'+','+'\n'
            res = res + req
    resfile.write(res)
resfile.close()
