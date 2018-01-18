import DataRequest

extension  GitHubUser {
    
    /**
    *   Loads a GitHubUser using the name provided
    *
    *
    */
    public static func load(name: String) -> GitHubUser? {

        self._user = nil

        self._username = name

        // keep a private copy of the group
        self.group.enter()

        self.queue.async(execute: self.workItem)
       
        self.group.wait()

        guard self.error == nil , let gitUser = self._user else {
            print(self.error!)
            return nil
        }

        return gitUser
    }

  
}

