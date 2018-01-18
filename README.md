# GitHubUser

## Documentation

[GitHub User Documentation](https://github.com/davidthorn/GitHubUser/tree/develop/Sources/GitHubUser)

## Installation


# GitHub User CLI

The GitHub User CLI provides the following commands

* id: displays the users id

```bash

# outputs the numberic id of the user
# github-user-cli USERNAME CMD

github-user-cli davidthorn id
User  Id  of: 16468826

```

* repos: Lists all repository names

```bash

# list all public repository names which are available to the user
# github-user-cli USERNAME CMD

github-user-cli davidthorn id
repo name: array
repo name: CalenderAPI
repo name: composer-test
repo name: DataRequest


```

* publicRepos: How many public repos that they have.

```bash

# list the number of public repository which the user has
# github-user-cli USERNAME CMD

github-user-cli davidthorn publicRepos
Public Repos Count: 15


```

* reposUrl: Outputs the repos urls for the user

```bash

# output the public repos url for the user
# github-user-cli USERNAME CMD

github-user-cli davidthorn publicRepos
Repos Url: https://api.github.com/users/davidthorn/repos


```

* And more to come..

## Installation

Using the cli requires firstly that the project has been built.

In order to build the project the swiftc compile is required to be installed.

Checkout the following link to install swift and swiftc: 

[https://swift.org/getting-started/#installing-swift](https://swift.org/getting-started/#installing-swift)



