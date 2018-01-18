import Foundation
import Dispatch


extension GitHubUser {

    fileprivate static var queueLabel: String {

        return "davidthorn.githubuser.load.queue"

    }

    fileprivate static var attributes: DispatchQueue.Attributes {
        return .concurrent
    }

    /// The dispatch queue to use to carry out any concurrent tasks
    ///
    /// - Parameter label: the name of the queueu
    /// - Paramter attributes: the attributes
    internal static var queue: DispatchQueue {
    
        return DispatchQueue(label: self.queueLabel , attributes: self.attributes )
    
    }

}