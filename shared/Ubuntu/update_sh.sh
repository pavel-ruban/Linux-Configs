#!/bin/expect -f

spawn chsh
expect "Password: "
send "vagrant\n";
expect "Changing the login shell for vagrant"
send "/bin/zsh\n";
interact
