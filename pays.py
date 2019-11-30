import csv
import random as ran

nom_file = "download.txt"
resfile = open("out.txt", "w")
filmID = 1000
res = ""

with open(nom_file, newline='') as csvfile:
    spamreader = csv.reader(csvfile, delimiter=',', quotechar='|')
    for row in spamreader:
        try :
            nom = row[0]
        except:
            pass

        lvl = ran.randint(0,4)

            # Forge de la requête
        req = '('+'\''+nom+'\''+', '+str(lvl)+')'+','+'\n'
        res = res + req
    resfile.write(res)
resfile.close()
