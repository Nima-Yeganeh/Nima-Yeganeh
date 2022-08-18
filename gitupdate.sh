echo 'started...'
git pull --rebase
git add .
git commit -m 'done'
git push
git pull --rebase
git pull
git status
echo 'done!'

