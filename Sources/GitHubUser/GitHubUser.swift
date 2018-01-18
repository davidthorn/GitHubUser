import DataRequest
import Dispatch

public class GitHubUser {

    public var id: Int

    public var name: String

    public var data: JSON = [:]

    internal static var _username: String?

    internal static var _user: GitHubUser?

    internal static var _group: DispatchGroup?

    internal static var error: Error? = nil

    internal init(id: Int , name: String ) {
        self.name = name
        self.id = id
    }
   

}
