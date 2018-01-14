import DataRequest


extension  GitHubUser {

    public var repos: [JSON] {
        return []    
    }

    public var reposUrl: String? {

        guard let url = self.data["repos_url"] as? String else  {
            return nil
        }

        return url

    }

}

