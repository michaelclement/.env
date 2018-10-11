# This is where I store helpful command snippets/scripts.

# VIM Search and Replace Across Multiple Files
:args `grep -r -l 'STRINGTEXT' .`
:argdo %s/STRINGTEXT/NEWTEXT/g | update

# BASH Rename multiple files in current directory
rename 's/OLDTEXT/NEWTEXT/' *
