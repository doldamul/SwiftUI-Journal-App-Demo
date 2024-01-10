import SwiftUI

struct ContentView: View {
    @State var journals: [Journal] = []
    
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
            
            NavigationStack {
                List(journals) { journal in
                    NavigationLink {
                        Text("Detail View")
                    } label: {
                        let isEmpty = journal.title.isEmpty
                        Text(isEmpty ?"New Journal": journal.title)
                            .opacity(isEmpty ? 0.5 : 1)
                    }
                }
            }
            
            Button(action: addJournal) {
                Image(systemName: "plus")
                    .foregroundStyle(Color.accentColor)
                    .imageScale(.large)
                    .bold()
                    .padding()
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.circle)
            .tint(.white)
            .shadow(radius: 10)
            .padding()
        }
    }
    
    func addJournal() {
            journals.append(Journal())
    }
}   
