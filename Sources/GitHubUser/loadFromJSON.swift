import DataRequest

extension GitHubUser {

    internal static func loadFrom(json: JSON ) throws -> GitHubUser {

         guard let id = json[GitHubUserKeys.id.rawValue] as? Int else {
            throw GitHubUserError.couldNotLoadUserFromJSON
        }

        guard let name = json[GitHubUserKeys.name.rawValue] as? String else {
            throw GitHubUserError.couldNotLoadUserFromJSON
        }

        let user = GitHubUser(id: id , name: name)
        user.data = json

        return user
    }


} 