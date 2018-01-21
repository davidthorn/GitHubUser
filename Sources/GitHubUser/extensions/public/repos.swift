import DataRequest

extension  GitHubUser {

    public var repos: [JSON] {
        
        let _repos: [JSON] = []

        guard let data = DataRequest.loadSync(url: self.reposUrl) else { return _repos }

        guard let jsonArray = data as? [JSON] else { return _repos }

        return jsonArray

    }

    public var reposUrl: String {

       return self.urls.repos

    }

}

