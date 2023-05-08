#!/bin/bash
git clone git@github.com:KanchanSoni16/techsavvydemocode.git
rsync -av --exclude 'techsavvydemocode' --exclude '.terraform' ./ ./techsavvydemocode/
cd techsavvydemocode
git add .
git commit -m "Pushing code in github repo"
git push git@github.com:KanchanSoni16/techsavvydemocode.git