import SwiftUI

struct ContentView: View {
    @State var journals: [Journal] = []
    
    var body: some View {
        NavigationStack {
            List(journals) { journal in
                NavigationLink {
                    JournalView(journal: journal)
                } label: {
                    let isEmpty = journal.title.isEmpty
                    VStack(alignment: .leading) {
                        Text(isEmpty ? "New Journal" : journal.title)
                            .opacity(isEmpty ? 0.5 : 1)
                            .lineLimit(1)
                        Text(journal.creationDate.dateString)
                            .foregroundStyle(.secondary)
                            .font(.caption)
                            .bold()
                    }
                }
                .contextMenu {
                    Button(role: .destructive) {
                        removeJournal(journal)
                    } label: {
                        Text("Delete")                        
                    }
                }
            }
            .navigationTitle("Journal")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Journal")
                        .font(.headline)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Image(systemName: "calendar")
                        .foregroundStyle(.secondary)
                        .symbolRenderingMode(.multicolor)
                }
            }
            .overlay(alignment: .bottom) {
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
    }
    
    func addJournal() {
            journals.append(Journal())
    }
    
    func removeJournal(_ journal: Journal) {
        let index = journals.firstIndex{ $0 === journal }!
        journals.remove(at: index)
    }
}   
