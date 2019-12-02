import os

files = filter(os.path.isfile, os.listdir(os.curdir))
res = ""
nameresfile = "BD.sql"
os.remove(nameresfile)
resFile = open(nameresfile, "a")

list_part = list()

for f in files:
    if f.find(".sqlpart") != -1 or f.find(".sql") != -1 and f != nameresfile:
        list_part.append(f)

list_part.sort()

for i in list_part:
    print(i)
    partFile = open(i, "r")
    a = partFile.read()
    resFile.write(a)
    partFile.close()

resFile.close()
