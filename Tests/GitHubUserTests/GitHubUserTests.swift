import XCTest
import GitHubUserUrls
@testable import GitHubUser

class GitHubUserTests: XCTestCase {
   

   func testEncode() {

        let urls = GitHubUserUrls(
                url: "url" , 
                avatar: "avator" , 
                html: "html" , 
                followers: "followers",
                following: "following",
                gists: "gists",
                repos: "repos"
                )

        let user = GitHubUser(id: 123 , 
                urls: urls , 
                name: "name" ,
                publicRepos: 123 
                 )

        do {

            let encoder = JSONEncoder()
            let _ = try encoder.encode(user)

        } catch {
            XCTFail("it should not come here")
        }

    }

   func testDecode() {

       
        let jsonString = """
        {
            "id": 1233,
            "name": "name",
            "public_repos" : 123,
            "url" : "url",
            "avatar_url": "avatar",
            "html_url": "html",
            "followers_url": "followers",
            "following_url": "following",
            "gists_url": "gists",
            "repos_url": "repos" 
        }
        """.data(using: .utf8)!

         do {

            let decoder = JSONDecoder()
            let _ = try decoder.decode(GitHubUser.self , from: jsonString)

        } catch let error{
            XCTFail("it should not come here: \(error.localizedDescription)")
        }

   }

    static var allTests = [
       ("testEncode" , testEncode),
       ("testDecode" , testDecode)
    ]
}
