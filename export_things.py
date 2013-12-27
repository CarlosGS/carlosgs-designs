#!/usr/bin/python

# Thingiverse* exporter
# by Carlos Garcia Saura (http://carlosgs.es)
# CC-BY-SA license (http://creativecommons.org/licenses/by-sa/3.0/)
# *Unofficial program, not associated with Thingiverse
# Use at your own risk!

# Modules
import requests
from BeautifulSoup import BeautifulSoup
import os
import re

myCookies = []

url = "https://www.thingiverse.com/"
user = "carlosgs"

def makeDirs(path):
    try:
        os.makedirs(path)
    except:
        return -1
    return 0

def login():
    global myCookies
    form = {'username': 'Bug', 'password': 'bugmenot'}
    r = requests.post(url + "login", data=form)
    myCookies = r.cookies
    if r.status_code != 200:
        print("ERROR: Login failed. Code: " + str(r.status_code))
        exit()
    print("Logged in!")
    print(myCookies)

def httpGet(page, filename=False, redir=True):
    global myCookies
    r = requests.get(page, cookies=myCookies, allow_redirects=redir)
    if r.status_code != 200:
        print(r.status_code)
        return -1
    if not filename:
        return r.text
    else:
        with open(filename, 'wb') as fd:
            for chunk in r.iter_content(512):
                fd.write(chunk)
            fd.close()
        return r.history

#login()
#httpGetText("")

thingList = {}

print("Usuario: " + user)

thingCount = 0
pgNum = 1
while 1:
    print("\nPagina: " + str(pgNum))
    res = httpGet(url + user + "/designs/page:" + str(pgNum), redir=False)#, filename="test" + str(pgNum) + ".html")
    if res == -1: break
    res_xml = BeautifulSoup(res)
    things = res_xml.findAll("div", { "class":"thing thing-interaction-parent" })
    for thing in things:
        title = str(thing["title"])
        # Optional: Remove text within brackets
        title = re.sub("\[[^\]]*\]","", title)
        title = title.strip()
        id = str(thing["data-thing-id"])
        
        print("\nProcesando " + id + " : " + title)
        
        folder = title.replace(' ', '-')
        previewImgUrl = str(thing.findAll("img", { "class":"thing-img" })[0]["src"])
        previewImgName = previewImgUrl.split('/')[-1]
        previewImgFile = folder + "/img/" + previewImgName
        makeDirs(folder)
        makeDirs(folder + "/img")
        
        print("Descargando imagen de vista previa ( " + previewImgName + " )")
        httpGet(previewImgUrl, previewImgFile)
        
        print("Cargando datos")
        
        res = httpGet(url + "/thing:" + id, redir=False)#, filename=folder + ".html")
        if res == -1:
            print("Error al descargar " + id + " : " + title)
            exit()
        res_xml = BeautifulSoup(res)
        
        description = res_xml.findAll("div", { "id":"description" })
        if description:
            description = "".join(str(item) for item in description[0].contents)
            description = description.strip()
        else:
            description = "None"
        
        instructions = res_xml.findAll("div", { "id":"instructions" })
        if instructions:
            instructions = "".join(str(item) for item in instructions[0].contents)
            instructions = instructions.strip()
        else:
            instructions = "None"
        
        
        files = {}
        for file in res_xml.findAll("div", { "class":"thing-file" }):
            fileUrl = url + str(file.a["href"])
            fileName = str(file.a["title"])
            filePath = folder + "/" + fileName
            print("Descargando archivo ( " + fileName + " )")
            httpGet(fileUrl, filePath)
            
            filePreviewUrl = str(file.img["src"])
            filePreviewPath = filePreviewUrl.split('/')[-1]
            filePreview = folder + "/img/" + filePreviewPath
            print("Descargando preview ( " + filePreviewPath + " )")
            httpGet(filePreviewUrl, filePreview)
            
            files[filePath] = {}
            files[filePath]["url"] = fileUrl
            files[filePath]["name"] = fileName
            files[filePath]["preview"] = filePreviewPath
        
        gallery = res_xml.findAll("div", { "class":"thing-page-slider main-slider" })[0]
        images = []
        for image in gallery.findAll("div", { "class":"thing-page-image featured" }):
            imgUrl = str(image["data-large-url"])
            imgName = imgUrl.split('/')[-1]
            imgFile = folder + "/img/" + imgName
            print("Descargando imagen ( " + imgName + " )")
            httpGet(imgUrl, imgFile)
            images.append(imgName)
        
        
        
        with open(folder + "/README.md", 'w') as fd:
            fd.write(title)
            fd.write("\n===============\n\n")
            fd.write('![Image](img/' + images[0] + ' "Title")\n\n')
            fd.write("Description\n--------\n")
            fd.write(description)
            fd.write("\n\nInstructions\n--------\n")
            fd.write(instructions)
            
            fd.write("\n\nFiles\n--------\n")
            for path in files.keys():
                file = files[path]
                fd.write('![Image](img/' + file["preview"] + ' "Title")\n')
                fd.write('[' + file["name"] + '](' + file["name"] + ' "Title")\n\n')
            
            fd.write("\n\nPictures\n--------\n")
            for image in images:
                fd.write('![Image](img/' + image + ' "Title")\n')
            
            
            fd.write("\n\nAuthor: " + user + "\n--------\n")
            fd.write("\n\nLicense\n--------\n")
            fd.write("CC-BY-SA (unless other specified)\n\n")
            fd.close()
        
        
        
        thingList[title] = {}
        thingList[title]["title"] = title
        thingList[title]["folder"] = folder
        thingList[title]["img"] = previewImgFile
        thingList[title]["description"] = description
        thingCount += 1
        if thingCount > 2: break
    if thingCount > 2: break
    pgNum += 1


with open("README.md", 'w') as fd:
    fd.write("Things from " + user)
    fd.write("\n===============\n\n")
    
    for title in thingList.keys():
        thing = thingList[title]
        
        fd.write('[' + thing["title"] + '](' + thing["folder"] + ' "Title")\n')
        fd.write('![Image](' + thing["img"] + ' "Title")\n\n')
    
    fd.write("\nAuthor: " + user + "\n--------\n")
    fd.write("\n\nLicense\n--------\n")
    fd.write("CC-BY-SA (unless other specified)\n\n")
    fd.close()
    fd.close()


