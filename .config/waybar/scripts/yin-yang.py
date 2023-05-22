#!/bin/env python3
import pathlib
import json

home = str(pathlib.Path.home())
config_path = home + '/.config/yin_yang/yin_yang.json'
print(config_path)

with open(config_path, 'r') as config_file:
    config_loaded = json.load(config_file)
    dark_mode = config_loaded['dark_mode']
    if dark_mode:
        print("🌝")
    else:
        print('🌞')

