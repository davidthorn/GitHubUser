import GitHubUser
import Foundation

var arguments = CommandLine.arguments

// appName github-user-cli
let _ = arguments.removeFirst()


guard arguments.count >= 1 else {
    print("incorrect parameters length")
    exit(2)
}

let name = arguments.removeFirst() 

guard let user = GitHubUser.load(name:name) else  {
    print("it did not work")
    exit(2)
}

print("\(user.name) with id: \(user.id) repo url = \(user.reposUrl)")

guard arguments.count > 0  else { exit(3) }

let cmd = arguments.removeFirst()

switch cmd {
    case "repos":
        let repos = user.repos

        repos.forEach { repo in

            guard let name = repo["name"] as? String else { return }
            print("repo name: \(name)")

        }

    default: break

}



