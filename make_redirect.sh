#!/usr/local/bin/fish

set target $argv[1]
set uuid (cat /dev/urandom | env LC_CTYPE=C tr -dc 'a-zA-Z0-9' | fold -w 5 | head -n 1)
set url "https://czm.io/r/$uuid"
set icon (dirname (status --current-filename))/icon.png

echo "RewriteRule ^r/$uuid $target [R=301]" >> ~/Google\ Drive/Sites/czm.io/.htaccess;
  and rsync ~/Google\ Drive/Sites/czm.io/.htaccess nfs-czmio:
  and /usr/local/bin/terminal-notifier -title "Redirect created" -message "$url" -appIcon $icon -open "$url"
echo $url | pbcopy
