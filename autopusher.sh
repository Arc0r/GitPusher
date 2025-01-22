#!/bin/bash
# do while loop
# ?check for changes?



#Path which will be ignored like /home/user/.local
EXCLUDE=(".cache" ".local" ".oh-my-zsh" ".cargo")
for P in "${EXCLUDE[@]}";do
    EXCLUDEPATH+="-not -path *$P* ";
done

#Path to search for repositories like /opt/mynewporject/.git/
SEARCHPATHS="/home/pmueller/GitPusher/ "
for GITPATH in $(find $SEARCHPATHS -name .git $EXCLUDEPATH);do
    echo "####################################################";
    cd $GITPATH; cd ..; pwd; 
    echo "pushing ...";
    git commit -a -m "auto commit"; 
    git push;
    git status;
done
