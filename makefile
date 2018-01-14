compile:
	swift build

link:
	sudo rm -rf ./build/debug/github-user-cli
	sudo cp ./.build/debug/GitHubUserCLI /usr/bin/github-user-cli

test:
	rm -rf .build
	make
	make link	
	github-user-cli reactivex
	github-user-cli davidthorn
	github-user-cli fakename-whic-could-not-exist

commit:
	git checkout -b feature
	git add .
	git commit -am "feature branch: saving state"
	git checkout develop
	git merge feature
	git branch -D feature	
