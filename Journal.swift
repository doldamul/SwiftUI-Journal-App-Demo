import SwiftData
import Foundation

@Model
class Journal: Identifiable {
    let creationDate: Date = Date.now
    
    var title: String = ""
    var content: String = ""
    
    init() {}
}
