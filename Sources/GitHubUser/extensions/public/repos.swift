import DataRequest

extension  GitHubUser {

    public var repos: [JSON] {
        
        let _repos: [JSON] = []

        do {

            let data = try DataRequest.sync(url: self.reposUrl) 

            print("we have data")

            let repoString = String(data: data , encoding: .utf8)!
            print(repoString)

            return _repos

        } catch let error {
            return _repos
        }

       // guard let data = DataRequest.loadSync(url: self.reposUrl) else { return _repos }

        //guard let jsonArray = data as? [JSON] else { return _repos }

        //return jsonArray

    }

    public var reposUrl: String {

       return self.urls.repos

    }

}

