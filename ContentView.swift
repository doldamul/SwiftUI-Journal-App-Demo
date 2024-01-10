import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Journal")
                    .fontWeight(.bold)
                Spacer()
                Image(systemName: "calendar")
                    .foregroundStyle(.secondary)
                    .symbolRenderingMode(.multicolor)
            }
            .font(.largeTitle)
            .padding()
            
            Spacer()
        }
    }
}   
