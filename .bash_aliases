# my aliases :)
alias cl='clear'
alias sound='pavucontrol&'

# git
alias gis='git status'
alias gib='git branch'
alias gica='git commit -a'
alias gil="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'"

# ls
alias lsa='ls -lah'
alias l='ls -lah'
alias ll='l'

# misc
alias df='df -h'
alias bc='bc ~/Dropbox/install/bc.conf'
alias karolina='vlc -I curses http://streaming.karolina.rs:8000/karolina.mp3'

alias fstomak='printf "\nlast 15...\n\n";find ~/Dropbox/logbook/ -name "*.md"|xargs gr -n '@stomak'|sort|tail -n 15'

#alias homestead='function __homestead() { (cd ~/Homestead && vagrant $*); unset -f __homestead; }; __homestead'

# work
#alias ch-ares='docker-compose stop && cd ~/Projects/ares-app/ && docker-compose up -d && docker-compose exec php-fpm bash'
#alias ch-web='docker-compose stop && cd ~/Projects/web-app/ && docker-compose up -d && docker-compose exec php-fpm bash'
#alias ch-nss='docker-compose stop && cd ~/nss/laradock/ && docker-compose up -d nginx postgres && docker-compose exec --user=1000 workspace bash'

alias code='lite-xl'
#alias pstorm='/home/panos/opt/JetBrains/PhpStorm-212.5284.49/bin/phpstorm.sh'

alias doco='~/.docker/cli-plugins/docker-compose'

alias h='history'
