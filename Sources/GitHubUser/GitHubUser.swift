import DataRequest
import Dispatch

public class GitHubUser {

    public var id: Int

    public var name: String

    public var data: JSON = [:]

    internal static var queue: DispatchQueue {
        return DispatchQueue(label: "davidthorn.githubuser.load.queue", attributes: .concurrent)
    }

    fileprivate static var _username: String?

    fileprivate static var _user: GitHubUser?

    fileprivate static var _group: DispatchGroup?

    internal static var group: DispatchGroup {

       if self._group == nil {
            self._group = DispatchGroup()
        }

        return self._group!

    }

    internal static var error: Error? = nil

    internal init(id: Int , name: String ) {
        self.name = name
        self.id = id
    }

    public static func apiUrl(for name: String) -> String {
        return "https://api.github.com/users/\(name)"
    }

    internal static var workItem: DispatchWorkItem {

        guard let name = self._username else  {
            fatalError("_username has not been set")
        }

        let urlString = self.apiUrl(for: name) 

        return DispatchWorkItem {
            
            let task = JSONRequest.rawValue(url: urlString) { result in

                do {

                    self._user = try self.load(from: result)

                } catch let _error {
                    self.error = _error
                }

                self.group.leave()

            }

            guard let runnable = task else {
                self.group.leave()
                fatalError("task cannot start")
            }

            runnable.resume()
        }

    }

    /**
    *   Loads a GitHubUser using the name provided
    *
    *
    */
    public static func load(name: String) -> GitHubUser? {

        self._user = nil

        self._username = name

        self.group
        
        // keep a private copy of the group
        self.group.enter()

        self.queue.async(execute: self.workItem)
       
        self.group.wait()

        guard self.error == nil , let gitUser = self._user else {
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
