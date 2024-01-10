import SwiftUI

@Observable
class Journal: Identifiable {
    let creationDate: Date = Date.now
    
    var title: String = ""
    var content: String = ""
}
