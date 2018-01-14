import DataRequest

extension GitHubUser {

    internal static func loadFrom(json: JSON ) throws -> GitHubUser {

         guard let id = json["id"] as? Int else {
            print("it did not work loading id as string")
            throw GitHubUserError.couldNotLoadUserFromJSON
        }

        guard let name = json["name"] as? String else {
            print("it did not work loading name as string")
            throw GitHubUserError.couldNotLoadUserFromJSON
        }

        let user = GitHubUser(id: id , name: name)
        user.data = json

        return user
    }


} 