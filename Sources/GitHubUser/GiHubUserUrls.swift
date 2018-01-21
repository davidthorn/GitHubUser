import Foundation

public class GitHubUserUrls: Decodable {

    public var avatar: String

    public var url: String

    public var html: String

    public var followers: String

    public var following: String

    public var gists: String

    public var repos: String

  
    internal init(
                url: String , 
                avatar: String , 
                html: String , 
                followers: String,
                following: String,
                gists: String,
                repos: String
                 ) {
        
        self.url = url
        self.avatar = avatar
        self.html = html
        self.followers = followers
        self.following = following
        self.gists = gists
        self.repos = repos
    
    }
   
    public required init(from decoder: Decoder) throws {

        let values = try decoder.container(keyedBy: GitHubUserUrlKeys.self)

        url = try values.decode(String.self, forKey: .url)
        avatar = try values.decode(String.self, forKey: .avatar)
        html = try values.decode(String.self, forKey: .html)
        followers = try values.decode(String.self, forKey: .followers)
        following = try values.decode(String.self, forKey: .following)
        gists = try values.decode(String.self, forKey: .gists)
        repos = try values.decode(String.self, forKey: .repos)
        

    }

}

extension GitHubUserUrls: CustomStringConvertible {

    public var description: String {

        let d = """
            avatar = \(self.avatar)
            url = \(self.url)
            html = \(self.html)
            followers = \(followers)
            following = \(following)
            gists = \(gists)
            repos = \(repos)
        """

        return d

    }

}

extension GitHubUserUrls: Encodable {
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: GitHubUserUrlKeys.self)
        try container.encode(url, forKey: .url)
        try container.encode(avatar, forKey: .avatar)
        try container.encode(html, forKey: .html)
        try container.encode(followers, forKey: .followers)
        try container.encode(following, forKey: .following)
        try container.encode(gists, forKey: .gists)
        try container.encode(repos, forKey: .repos)
    
    }
}

