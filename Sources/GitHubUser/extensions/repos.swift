import DataRequest

extension  GitHubUser {

    public var repos: [JSON] {
        
        var _repos: [JSON] = []

        guard let url = self.reposUrl else { return _repos }

        guard let data = DataRequest.loadSync(url: url) else { return _repos }

        guard let jsonArray = data as? [JSON] else { return _repos }

        return jsonArray

    }

    public var reposUrl: String? {

        guard let url = self.data[GitHubUserKeys.reposUrl.rawValue] as? String else  {
            return nil
        }

        return url

    }

     public var publicRepos: Int? {

        guard let count = self.data[GitHubUserKeys.publicRepos.rawValue] as? Int else  {
            return nil
        }

        return count

    }
}

