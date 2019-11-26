import csv
import random as ran
import unicodedata


def remove_accents(input_str):
    nfkd_form = unicodedata.normalize('NFKD', input_str)
    only_ascii = nfkd_form.encode('ASCII', 'ignore')
    return str(only_ascii)[1:].replace('\'', "")


nom_file_pays = "download.txt"
nom_file_NCode = "liste_francais.txt"
nom_file_noms = "FakeNameGenerator.com_7bba45d5.csv"

resfilePers = open("PersOut.txt", "w")
resfileAgent = open("AgentOut.txt", "w")

PaysListe = list()
csvfile_P = open(nom_file_pays, newline='')
spamreader = csv.reader(csvfile_P, delimiter='\n', quotechar='|')
for row in spamreader:
    try :
        nom = remove_accents(row[0])
    except:
        pass
    PaysListe.append(nom)


NCode_ListL = list()
NCode_ListFX = open(nom_file_NCode, newline='')
NCode_List = csv.reader(NCode_ListFX, delimiter='\n', quotechar='|')
for row in NCode_List:
    try :
        nomCode = remove_accents(row[0])
    except:
        pass
    NCode_ListL.append(nomCode.upper())


def choosePays():
    r = ran.randint(0,3)
    if r < 1:
        return 'France'
    else :
        return remove_accents(ran.choice(PaysListe))


F = open(nom_file_noms, newline='')
F_read = csv.reader(F, delimiter=',', quotechar='|')
resP = ""
resA = ""
i = 0
for row in F_read:
    nom = remove_accents(row[0])
    prenom = remove_accents(row[1])
    age = row[2]
    sexe = row[3]
    NC = ran.choice(NCode_ListL)
    NCode_ListL.remove(NC)
    # General
    if i == 100:
        lvlA = 2
        lvlC = 100
    else:
        lvlA = 0
        lvlC = ran.randint(0, 100)
    i = i + 1
    etatS = "TOP SECRET"

    # Forge de la requête I
    reqP = '('+'\''+nom+'\''+','+'\''+prenom+'\''+','+age+','+'\''+sexe+'\''+','+'\''+NC+'\''+','+'\''+choosePays()+'\''+')'+','+'\n'
    resP = resP + reqP

    # Forge de la requête II
    reqA = '('+'\''+NC+'\''+','+str(lvlA)+','+str(lvlC)+','+'\''+etatS+'\''+')'+','+'\n'
    resA = resA + reqA
resfilePers.write(resP)
resfilePers.close()

resfileAgent.write(resA)
resfileAgent.close()
