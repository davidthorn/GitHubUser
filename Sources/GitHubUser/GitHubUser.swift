import DataRequest
import Dispatch
import Foundation

public class GitHubUser: Decodable {

    public var id: Int

    public var name: String

    public var urls: GitHubUserUrls

    public var publicRepos: Int

    public var data: JSON = [:]

    internal static var _username: String?

    internal static var _user: GitHubUser?

    internal static var _group: DispatchGroup?

    internal static var error: Error? = nil

    internal init(id: Int , 
                urls: GitHubUserUrls , 
                name: String ,
                publicRepos: Int 
                 ) {
        
        self.id = id
        self.urls = urls
        self.name = name
        self.publicRepos = publicRepos
        
    }
   
    public required init(from decoder: Decoder) throws {

        let values = try decoder.container(keyedBy: GitHubUserKeys.self)

        urls = try GitHubUserUrls(from: decoder) 
       
        id = try values.decode(Int.self, forKey: .id)
        name = try values.decode(String.self , forKey: .name)
        publicRepos = try values.decode(Int.self , forKey: .publicRepos)
        
    }

}

extension GitHubUser: CustomStringConvertible {

    public var description: String {

        let d = """
            id = \(id)
            urls = \(urls.description)
            name = \(name)
            publicRepos = \(publicRepos)
        """

        return d

    }

}


