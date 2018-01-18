# GitHubUser Documentation

## Load By User Name

This method loads the public information from github api using the name parameters as the query.

If the user with the name exists in github then a GitHubUser object will be returned.

If the user does not exist then the method will return nil.

The method blocks and is required to be called on a background queue so as not to block the main thread.

A access token is required from github if you intend to do more than 60 api requests within 60 minutes.

```swift

extension  GitHubUser {
    
    /// retrieves information about a GitHub User from the github api
    ///
    /// The method blocks therefore it requires to be executed off of the main thread
    ///
    /// - Parameter: name The name of the user in github
    public static func load(name: String) -> GitHubUser?
  
}


```
