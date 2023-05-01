#!/usr/bin/bash

getent passwd | cut -d ':' -f 1,6 > users.txt
