#!/bin/bash
sudo apt update -y
sleep 150
sudo pm2 startup
sudo pm2 save
