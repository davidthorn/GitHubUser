import DataRequest
import Dispatch


public class GitHubUser {

    public var id: Int

    public var name: String

    public var data: JSON = [:]

    internal static var queue: DispatchQueue {
        return DispatchQueue(label: "davidthorn.githubuser.load.queue", attributes: .concurrent)
    }

    internal static var group: DispatchGroup {
        return DispatchGroup()
    }

    internal static var error: Error? = nil

    internal init(id: Int , name: String ) {
        self.name = name
        self.id = id
    }

    /**
    *   Loads a GitHubUser using the name provided
    *
    *
    */
    public static func load(name: String) -> GitHubUser? {

        var user: GitHubUser? = nil

        let _group = self.group
        _group.enter()

        let item = DispatchWorkItem {

             let urlString = "https://api.github.com/users/\(name)"

            JSONRequest.rawValue(url: urlString) { result in

                do {

                    user = try self.load(from: result)

                } catch let _error {
                    self.error = _error
                }

                _group.leave()
            }?.resume()
        }

        self.queue.async(execute: item)
       
        _group.wait()

        guard self.error == nil , let gitUser = user else {
            print(self.error!)
            return nil
        }

        return gitUser
    }

    public static func load(from result: Result<Any>) throws -> GitHubUser {

        switch result  {
            case .success(let rawValue):

                guard let json = rawValue as? JSON else {
                    throw GitHubUserError.couldNotConvertRawValueToJSON
                }
                    
                return try GitHubUser.loadFrom(json: json )

            case .fail(let error):
                print("failed here")
                throw error
        }

    }

}
