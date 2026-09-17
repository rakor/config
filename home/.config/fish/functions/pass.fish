function pass --wraps='gpg -d ~/syncthing/rakor-home/dokumente/pass.gpg | less -I' --description 'alias pass gpg -d ~/syncthing/rakor-home/dokumente/pass.gpg | less -I'
  gpg -d ~/syncthing/rakor-home/dokumente/pass.gpg | less -I $argv
        
end
