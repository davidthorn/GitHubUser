import Foundation


public enum GitHubUserUrlKeys: String, CodingKey {
    
    case avatar = "avatar_url"

    case url

    case html = "html_url"

    case followers = "followers_url"

    case following = "following_url"

    case gists = "gists_url"

    case starred = "starred_url"

    case subscriptions = "subscriptions_url"

    case origanizations = "organizations_url"
    
    case repos = "repos_url"

    case events = "events_url"

    case receivedEvents = "received_events_url"
   

}