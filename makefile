compile:
	swift build -Xswiftc -suppress-warnings

link:
	sudo rm -rf ./build/debug/github-user-cli
	sudo cp ./.build/debug/GitHubUserCLI /usr/bin/github-user-cli

test:
	rm -rf Package.resolved
	rm -rf .build
	make
	make link	
	github-user-cli reactivex id --access_token=${access_token}
	github-user-cli davidthorn id --access_token=${access_token}
	github-user-cli fakename-whic-could-not-exist --access_token=${access_token}

token:
	github-user-cli davidthorn id --access_token=${access_token}

commit:
	git checkout -b feature
	git add .
	git commit -am "feature branch: ${message}"
	git checkout develop
	git merge feature
	git branch -D feature	
	git log --graph --oneline --decorate
