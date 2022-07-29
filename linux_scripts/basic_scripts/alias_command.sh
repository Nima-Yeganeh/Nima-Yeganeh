
echo 'note >> The alias command lets you define temporary aliases in your shell session. When creating an alias, you instruct your shell to replace a word with a series of commands.'
echo 'command >> alias'
alias
sleep 2

echo "alias c='clear'"
alias c='clear'
alias | grep clear
sleep 2

echo "alias move='mv -i'"
alias move='mv -i'
alias | grep move
sleep 2

echo "unalias Command As the name suggests, the unalias command aims to remove an alias from the already defined aliases. To remove the previous ls alias, you can use:"
echo "unalias move"
unalias move
alias
sleep 2

