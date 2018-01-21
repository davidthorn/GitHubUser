import GitHubUser
import Foundation
import DataRequest

var arguments = CommandLine.arguments

// appName github-user-cli
let _ = arguments.removeFirst()

let accessToken = arguments.filter { argument in
    return argument.contains("--access_token")
}

arguments = arguments.filter{ argument in
    return !argument.contains("--access_token")
}

if accessToken.count == 1 {
    DataRequest.accessToken = accessToken[0].components(separatedBy: "=")[1]
}


guard arguments.count >= 1 else {
    print("incorrect parameters length")
    exit(2)
}

let name = arguments.removeFirst() 

guard let user = GitHubUser.load(name: name) else {
    print("could not load user")
    exit(2)
}

guard arguments.count > 0  else { exit(3) }

let cmd = arguments.removeFirst()

switch cmd {
    case "id":

        print("User  Id  of: \(user.id)")
    
    case "repos":
        let repos = user.repos

        repos.forEach { repo in

            guard let name = repo["name"] as? String else { return }
            print("repo name: \(name)")

        }

    case "reposUrl":
        
        print("Repos Url: \(user.urls.repos)")

    case "publicRepos":
        
        print("Public Repos Count: \(user.publicRepos)")

    default: break

}



