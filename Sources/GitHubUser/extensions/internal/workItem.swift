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
            
            let task = JSONRequest.rawValue(url: urlString) { result in

                do {

                    self._user = try self.load(from: result)

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