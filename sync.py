#!/usr/bin/python3
#-*- coding: UTF-8 -*-
import shutil

home = '/home/mayapony'
baseDir = home + '/.config/'
dist = home + '/dotfiles/'
folders = ['fcitx5']

for folderName in folders:
    shutil.copytree(baseDir + folderName, dist)
    print(folderName + "sycn ok!")
