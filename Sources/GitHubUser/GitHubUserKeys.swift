import Foundation


public enum GitHubUserKeys: String, CodingKey {
    
    case id

    case type

    case siteAdmin = "site_admin"

    case name

    case company

    case blog

    case location

    case email

    case hireable

    case bio

    case publicRepos = "public_repos"

    case publicGists = "public_gists"

    case followers

    case following

    case createdAt = "created_at"

    case updatedAt = "updated_at"

   

}