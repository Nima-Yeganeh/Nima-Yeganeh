#
#  Author: Hari Sekhon
#  Date: 2016-01-17 12:56:53 +0000 (Sun, 17 Jan 2016)
#
#  vim:ts=4:sts=4:sw=4:noet
#
#  https://github.com/HariSekhon/DevOps-Bash-tools
#
#  If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback
#
#  https://www.linkedin.com/in/HariSekhon
#

include Makefile.in

REPO := HariSekhon/DevOps-Bash-tools

#CODE_FILES := $(shell find . -type f -name '*.sh' -o -type f -name '.bash*' | sort)
CODE_FILES := $(shell git ls-files | grep -E -e '\.sh$$' -e '\.bash[^/]*$$' -e '\.groovy$$' | sort)

CONF_FILES := $(shell sed "s/\#.*//; /^[[:space:]]*$$/d" setup/files.txt)

BASH_PROFILE_FILES := $(shell echo .bashrc .bash_profile .bash.d/*.sh)

#.PHONY: *

define MAKEFILE_USAGE

  Repo specific options:

    make install                builds all script dependencies, installs AWS CLI, GitHub CLI, symlinks all config files to $$HOME and adds sourcing of bash profile

    make link                   symlinks all config files to $$HOME and adds sourcing of bash profile
    make unlink                 removes all symlinks pointing to this repo's config files and removes the sourcing lines from .bashrc and .bash_profile

    make python-desktop         installs all Python Pip packages for desktop workstation listed in setup/pip-packages-desktop.txt
    make perl-desktop           installs all Perl CPAN packages for desktop workstation listed in setup/cpan-packages-desktop.txt
    make ruby-desktop           installs all Ruby Gem packages for desktop workstation listed in setup/gem-packages-desktop.txt
    make golang-desktop         installs all Golang packages for desktop workstation listed in setup/go-packages-desktop.txt
    make nodejs-desktop         installs all NodeJS packages for desktop workstation listed in setup/npm-packages-desktop.txt

    make desktop                installs all of the above + many desktop OS packages listed in setup/

    make mac-desktop            all of the above + installs a bunch of major common workstation software packages like Ansible, Terraform, MiniKube, MiniShift, SDKman, Travis CI, CCMenu, Parquet tools etc.
    make linux-desktop

    make ls-scripts             print list of scripts in this project, ignoring code libraries in lib/ and .bash.d/

    make github-cli             installs GitHub CLI
    make kubernetes             installs Kubernetes kubectl and kustomize to ~/bin/
    make terraform              installs Terraform to ~/bin/
    make vim                    installs Vundle and plugins
    make tmux                   installs TMUX TPM and plugin for kubernetes context
    make ccmenu                 installs and (re)configures CCMenu to watch this and all other major HariSekhon GitHub repos
    make status                 open the Github Status page of all my repos build statuses across all CI platforms

    make aws                    installs AWS CLI tools
    make azure                  installs Azure CLI
    make gcp                    installs Google Cloud SDK

    make aws-shell              sets up AWS Cloud Shell: installs core packages and links configs
                                (maintains itself across future Cloud Shells via .aws_customize_environment hook)
    make gcp-shell              sets up GCP Cloud Shell: installs core packages and links configs
                                (maintains itself across future Cloud Shells via .customize_environment hook)
    make azure-shell            sets up Azure Cloud Shell (limited compared to gcp-shell, doesn't install OS packages since there is no sudo)
endef

# not including azure here because it requires interactive prompt and hangs automatic testing of make docker-*
.PHONY: build
build:
	@echo ================
	@echo Bash Tools Build
	@echo ================
	@$(MAKE) git-summary
	@$(MAKE) init
	@$(MAKE) system-packages aws github-cli

.PHONY: init
init: git
	@echo "running init:"
	git submodule update --init --recursive
	@echo

.PHONY: install
install: build link aws gcp github-cli
	@:

.PHONY: uninstall
uninstall: unlink
	@echo "Not removing any system packages for safety"

.PHONY: bash
bash: link
	@:

.PHONY: link
link:
	@setup/shell_link.sh

.PHONY: unlink
unlink:
	@setup/shell_unlink.sh

.PHONY: mac-desktop
mac-desktop: desktop
	@setup/mac_desktop.sh

.PHONY: linux-desktop
linux-desktop: desktop
	@setup/linux_desktop.sh

.PHONY:
ccmenu:
	@setup/ccmenu_setup.sh

.PHONY: desktop
desktop: install
	@if [ -x /sbin/apk ];        then $(MAKE) apk-packages-desktop; fi
	@if [ -x /usr/bin/apt-get ]; then $(MAKE) apt-packages-desktop; fi
	@if [ -x /usr/bin/yum ];     then $(MAKE) yum-packages-desktop; fi
	@if [ -x /usr/local/bin/brew -a `uname` = Darwin ]; then $(MAKE) homebrew-packages-desktop; fi
	@# do these late so that we have the above system packages installed first to take priority and not install from source where we don't need to
	@$(MAKE) perl-desktop
	@$(MAKE) golang-desktop
	@$(MAKE) nodejs-desktop
	@$(MAKE) ruby-desktop
	@# no packages any more since jgrep is no longer found
	@#$(MAKE) ruby-desktop

.PHONY: apk-packages-desktop
apk-packages-desktop: system-packages
	@echo "Alpine desktop not supported at this time"
	@exit 1

.PHONY: apt-packages-desktop
apt-packages-desktop: system-packages
	NO_FAIL=1 NO_UPDATE=1 $(BASH_TOOLS)/apt_install_packages.sh setup/deb-packages-desktop.txt

.PHONY: yum-packages-desktop
yum-packages-desktop: system-packages
	NO_FAIL=1 NO_UPDATE=1 $(BASH_TOOLS)/yum_install_packages.sh setup/rpm-packages-desktop.txt

.PHONY: homebrew-packages-desktop
homebrew-packages-desktop: system-packages homebrew
	@:

.PHONY: homebrew
homebrew: system-packages brew
	@:

.PHONY: brew
brew:
	NO_FAIL=1 NO_UPDATE=1 $(BASH_TOOLS)/brew_install_packages.sh setup/brew-packages-desktop.txt
	NO_FAIL=1 NO_UPDATE=1 CASK=1 $(BASH_TOOLS)/brew_install_packages.sh setup/brew-packages-desktop-casks.txt
	NO_FAIL=1 NO_UPDATE=1 TAP=1 $(BASH_TOOLS)/brew_install_packages.sh setup/brew-packages-desktop-taps.txt

.PHONY: perl-desktop
perl-desktop: system-packages cpan-desktop
	@:

.PHONY: cpan-desktop
cpan-desktop: cpan
	NO_FAIL=1 NO_UPDATE=1 $(BASH_TOOLS)/perl_cpanm_install_if_absent.sh setup/cpan-packages-desktop.txt

.PHONY: golang-desktop
golang-desktop: system-packages go-desktop
	@:

.PHONY: go-desktop
go-desktop: system-packages go
	@:

.PHONY: go
go:
	NO_FAIL=1 $(BASH_TOOLS)/golang_get_install_if_absent.sh setup/go-packages-desktop.txt

.PHONY: ruby-desktop
ruby-desktop: system-packages gem-desktop
	@:

.PHONY: gem-desktop
gem-desktop: gem
	NO_FAIL=1 $(BASH_TOOLS)/ruby_gem_install_if_absent.sh setup/gem-packages-desktop.txt

.PHONY: python-desktop
python-desktop: system-packages pip-desktop

.PHONY: pip
pip-desktop: pip
	./python_pip_install_if_absent.sh setup/pip-packages-desktop.txt

.PHONY: nodejs-desktop
nodejs-desktop: system-packages npm-desktop

.PHONY: npm-desktop
npm-desktop: npm
	$(BASH_TOOLS)/nodejs_npm_install_if_absent.sh $(BASH_TOOLS)/setup/npm-packages-desktop.txt

.PHONY: aws
aws: system-packages python-version
	@setup/install_aws_cli.sh
	@# needed for github_mirror_repos_to_aws_codecommit.sh and dependent GitHub Actions workflows
	@grep '^git-remote-codecommit' requirements.txt | ./python_pip_install_if_absent.sh || :

.PHONY: aws-shell
aws-shell:
	@if [ "${AWS_EXECUTION_ENV:-}" != "CloudShell" ]; then echo "Not running inside AWS Cloud Shell"; exit 1; fi
	@$(MAKE) system-packages aws link

.PHONY: azure
azure: system-packages
	@setup/install_azure_cli.sh

.PHONY: azure-shell
azure-shell: link
	:

.PHONY: gcp
gcp: system-packages
	@./setup/install_gcloud_sdk.sh
	@./setup/install_cloud_sql_proxy.sh

.PHONY: gcp-shell
gcp-shell:
	@if [ -z "${DEVSHELL_PROJECT_ID:-}" ]; then echo "Not running inside Google Cloud Shell"; exit 1; fi
	@$(MAKE) system-packages link

.PHONY: github-cli
github-cli: ~/bin/gh
	@:

~/bin/gh:
	setup/install_github_cli.sh

.PHONY:
digital-ocean: ~/bin/doctl
	@:

~/bin/doctl:
	setup/install_doctl.sh

.PHONY: kubernetes
kubernetes: kubectl kustomize
	@:

.PHONY: k8s
k8s: kubernetes
	@:

.PHONY: kubectl
kubectl: ~/bin/kubectl
	@:

~/bin/kubectl:
	setup/install_kubectl.sh

.PHONY: kustomize
kustomize: ~/bin/kustomize
	@:

~/bin/kustomize:
	setup/install_kustomize.sh

.PHONY: vim
vim: ~/.vim/bundle/Vundle.vim
	@:

~/.vim/bundle/Vundle.vim:
	setup/install_vundle.sh

.PHONY: tmux
tmux: ~/.tmux/plugins/tpm ~/.tmux/plugins/kube.tmux
	@:

~/.tmux/plugins/tpm:
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

~/.tmux/plugins/kube.tmux:
	wget -O ~/.tmux/plugins/kube.tmux https://raw.githubusercontent.com/jonmosco/kube-tmux/master/kube.tmux

.PHONY: test
test:
	./check_all.sh

.PHONY: clean
clean:
	@rm -fv -- setup/terraform.zip

.PHONY: ls-scripts
ls-scripts:
	@$(MAKE) ls | grep -v -e 'lib/' -e '\.bash'

.PHONY: ls-scripts2
ls-scripts2:
	@$(MAKE) ls | grep -v -e 'lib/' -e '\.bash' -e 'setup/'

.PHONY: wcbashrc
wcbashrc:
	@wc $(BASH_PROFILE_FILES)
	@printf "Total Bash Profile files: "
	@ls $(BASH_PROFILE_FILES) | wc -l

.PHONY: wcbash
wcbash: wcbashrc
	@:

.PHONY: wcbashrc2
wcbashrc2:
	@printf "Total Bash Profile files: "
	@ls $(BASH_PROFILE_FILES) | wc -l
	@printf "Total line count without # comments: "
	@ls $(BASH_PROFILE_FILES) | xargs sed 's/#.*//;/^[[:space:]]*$$/d' | wc -l

.PHONY: wcbash2
wcbash2: wcbashrc2
	@:

.PHONY: pipreqs-mapping
pipreqs-mapping:
	#wget -O resources/pipreqs_mapping.txt https://raw.githubusercontent.com/HariSekhon/pipreqs/mysql-python/pipreqs/mapping
	wget -O resources/pipreqs_mapping.txt https://raw.githubusercontent.com/bndr/pipreqs/master/pipreqs/mapping
.PHONY: pip-mapping
pip-mapping: pipreqs-mapping
	@:

.PHONY: status-page
status-page:
	./generate_status_page.sh; . .bash.d/git.sh; gitu STATUS.md
