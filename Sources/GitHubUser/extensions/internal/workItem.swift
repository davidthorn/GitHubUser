import Foundation
import Dispatch
import DataRequest

extension GitHubUser {

    fileprivate static func apiUrl(for name: String) -> String {
        return "https://api.github.com/users/\(name)"
    }

    internal static var workItem: DispatchWorkItem {

        guard let name = self._username else  {
            fatalError("_username has not been set")
        }

        let urlString = self.apiUrl(for: name) 

        return DispatchWorkItem {
            
            let task = DataRequest.from(url: urlString) { result in

                do {

                    switch result {
                        case .success(let data):

                            let jsonDecoder = JSONDecoder()
                            self._user = try jsonDecoder.decode(GitHubUser.self, from: data)

                        case .fail(let _error):

                            throw _error
                    }

           
                } catch let _error {
                    self.error = _error
                }

                self.group.leave()

            }

            guard let runnable = task else {
                self.group.leave()
                fatalError("task cannot start")
            }

            runnable.resume()
        }

    }


}