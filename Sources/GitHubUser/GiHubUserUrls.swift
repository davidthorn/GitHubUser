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


