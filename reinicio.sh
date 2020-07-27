#!/bin/bash

git pull
pm2 restart server.js
pm2 restart laboratorio-n1