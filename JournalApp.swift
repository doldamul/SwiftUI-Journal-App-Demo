import SwiftUI
import SwiftData

@main
struct JournalApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Journal.self)
        }
    }
}
