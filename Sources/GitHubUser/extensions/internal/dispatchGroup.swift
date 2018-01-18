import Foundation
import Dispatch


extension GitHubUser {

    internal static var group: DispatchGroup {

       if self._group == nil {
            self._group = DispatchGroup()
        }

        return self._group!

    }

}