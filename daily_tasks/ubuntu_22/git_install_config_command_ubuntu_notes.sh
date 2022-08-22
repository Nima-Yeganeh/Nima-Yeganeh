sudo apt update -y
sudo apt install dnf -y
sudo dnf install git-all -y
sudo apt install git-all -y

sudo iftop

git --version
sudo apt install iftop -y

pwd
ls -anp
mkdir nima_git
cd nima_git/
ls -anp
git --version
git config --global user.name 'your_git_username'
git config --global user.email 'your_git_email'
git config --list

git clone https://github.com/Nima-Yeganeh/Nima-Yeganeh
ls -anp
cd Nima-Yeganeh/
ls -anp
git status
git pull 
git push
cd ..
ls -anp
cd ..
ls -anp
cd Downloads/
#https://linuxize.com/post/how-to-install-git-on-ubuntu-18-04/
#https://linuxize.com/post/how-to-install-git-on-ubuntu-18-04/
#https://git-scm.com/book/en/v2/Git-Basics-Getting-a-Git-Repository
#https://stackoverflow.com/questions/6565357/git-push-requires-username-and-password
#https://github.com/GitCredentialManager/git-credential-manager
#https://github.com/GitCredentialManager/git-credential-manager/releases/tag/v2.0.785
wget https://github.com/GitCredentialManager/git-credential-manager/releases/download/v2.0.785/gcm-linux_amd64.2.0.785.deb 
sudo dpkg -i gcm-linux_amd64.2.0.785.deb 
ls -anp
git-credential-manager-core --help
git-credential-manager-core configure
ls -anp
cd ..
ls -anp
cd nima_git/
ls -anp
cd Nima-Yeganeh/
ls -anp
git status
git push
git config --global credential.credentialStore secretservice
git push
git status
git add .
git commit -m 'done'
git push
git status
git pull

