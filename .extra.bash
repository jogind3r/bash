###############
# Include Drush bash customizations.
if [ -f "/Users/j/.drush/drush.bashrc" ] ; then
  source /Users/j/.drush/drush.bashrc
fi

# Include Drush completion.
if [ -f "/Users/j/.drush/drush.complete.sh" ] ; then
  source /Users/j/.drush/drush.complete.sh
fi

# Include Drush prompt customizations.
if [ -f "/Users/j/.drush/drush.prompt.sh" ] ; then
  source /Users/j/.drush/drush.prompt.sh
fi
###############

 complete -W "$(cat ~/.ssh/config | grep "host "|  awk  '{print $2}')" ssh

 # source /Users/j/.oh-my-git/prompt.sh

 usr=`who | awk -F'\t' '{ print $2 }' | grep -e "."`
 if [ "$usr" != '' -a "$usr" != "(::1)" ];
  then
 notifier "someone is logged in from $usr ";
 fi
 # echo $1
 source /usr/local/opt/git/etc/bash_completion.d/git-completion.bash
 # Autocomplete for 'g' as well
 complete -o default -o nospace -F _git g
