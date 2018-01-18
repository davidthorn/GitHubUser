import DataRequest

extension GitHubUser {

    internal static func loadFrom(json: JSON ) throws -> GitHubUser {

         guard let id = json[GitHubUserKeys.id.rawValue] as? Int else {

            guard let message = json["message"] as? String else {
                throw GitHubUserError.couldNotLoadUserFromJSON
            }

            print(message)

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