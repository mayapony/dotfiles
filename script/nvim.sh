#!/bin/bash

if [[ "$(darkman get)" =~ "dark" ]]
then
	nvim "$1" --cmd "set background=dark"
else
	nvim "$1" --cmd "set background=light"
fi

