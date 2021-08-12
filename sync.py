#!/usr/bin/python3
# -*- coding: UTF-8 -*-
import shutil
import os

home = '/home/mayapony'
baseDir = home + '/.config/'
configDist = home + '/dotfiles/manjaro/.config/'
rootDist = home + '/dotfiles/manjaro/'
configFolders = [
    'fcitx5',
    'rofi',
    'Typora',
    'omf',
    'fcitx',
]

for folderName in configFolders:
    backDir = configDist + folderName
    sourceDir = baseDir + folderName
    if os.path.isdir(backDir):
        shutil.rmtree(backDir)
    
    shutil.copytree(sourceDir, backDir)
    print(folderName + " sync ok!")
