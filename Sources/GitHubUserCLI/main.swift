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

let user = GitHubUser.load(name:name)