#!/bin/expect -f

spawn chsh
expect "Password: "
send "vagrant\n";
expect "Changing the login shell for vagrant
Enter the new value, or press ENTER for the default
	Login Shell [/bin/bash]: "
send "/bin/zsh\n";
interact