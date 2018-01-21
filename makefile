
TOKEN=$(shell cat ./.token)

compile:
	swift build -Xswiftc -suppress-warnings --configuration release

link:
	sudo rm -rf ./build/release/github-user-cli
	sudo cp ./.build/release/GitHubUserCLI /usr/bin/github-user-cli

test:
	rm -rf Package.resolved
	rm -rf .build
	make
	make link	
	github-user-cli reactivex id --access_token=$(TOKEN)
	github-user-cli davidthorn id --access_token=$(TOKEN)

json: compile link
	
	github-user-cli davidthorn json --access_token=$(TOKEN)
	
token: compile link

	github-user-cli davidthorn id --access_token=$(TOKEN)
	github-user-cli davidthorn name --access_token=$(TOKEN)
	github-user-cli davidthorn reposUrl --access_token=$(TOKEN)
#	github-user-cli davidthorn repos --access_token=$(TOKEN)

commit:
	git checkout -b feature
	git add .
	git commit -am "feature branch: ${message}"
	git checkout develop
	git merge feature
	git branch -D feature	
	git log --graph --oneline --decorate

show-token:
	echo $(TOKEN)
