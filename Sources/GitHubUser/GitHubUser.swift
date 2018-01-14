import DataRequest
import Dispatch


public class GitHubUser {

    public var id: Int

    public var name: String

    public var data: JSON = [:]

    internal init(id: Int , name: String ) {
        self.name = name
        self.id = id
    }

    public static func load(name: String) -> GitHubUser? {

        var user: GitHubUser? = nil

        var error: Error? = nil

        let queue = DispatchQueue(label: "davidthorn.githubuser.load.queue", attributes: .concurrent)

        let group = DispatchGroup()

        group.enter()

        let item = DispatchWorkItem {

             let urlString = "https://api.github.com/users/\(name)"

            JSONRequest.rawValue(url: urlString) { result in

                switch result  {
                    case .success(let rawValue):

                        do {

                            guard let json = rawValue as? JSON else {
                                throw GitHubUserError.couldNotConvertRawValueToJSON
                            }
                            user = try GitHubUser.loadFrom(json: json )

                        } catch let _error {
                            error = _error
                        }

                    case .fail(let _error):
                        error = _error
                        print(_error.localizedDescription)
                }

                group.leave()
            }?.resume()
        }

        queue.async(execute: item)
       

        group.wait()

        guard error == nil , let gitUser = user else {
            return nil
        }

        return gitUser
    }

}
