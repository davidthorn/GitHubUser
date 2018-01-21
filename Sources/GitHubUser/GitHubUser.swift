import Foundation
import GitHubUserUrls

public class GitHubUser: Decodable {

    public var id: Int

    public var name: String

    public var urls: GitHubUserUrls

    public var publicRepos: Int

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

extension GitHubUser: Encodable {
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: GitHubUserKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(publicRepos, forKey: .publicRepos)

        try urls.encode(to: encoder)

    }
}


