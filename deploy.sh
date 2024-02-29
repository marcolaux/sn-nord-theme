#!/bin/sh
source .env
rm sn-nord-theme.zip
zip -r sn-nord-theme.zip ./ -x "package-lock.json" ".env" "*.sh" ".git*" ".git/*" "dist/.gitkeep" ".DS*" ".htaccess" "node_modules/*" "src/*" "*.txt"
ssh $server "cd $path; find ./ -type f -not -name '.htaccess' -delete; rm -fr dist"
scp sn-nord-theme.zip $server:$path/sn-nord-theme.zip
ssh $server "cd $path; unzip sn-nord-theme.zip"
