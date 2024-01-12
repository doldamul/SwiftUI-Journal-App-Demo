import SwiftUI

struct ContentView: View {
    @State var journals: [Journal] = []
    @State var showDateFilterSheet: Bool = false
    @State var selectedDate: Date = Date()
    
    var filteredJournals: [Journal] {
        journals
            .lazy
            .filter {
                Calendar.current.isDate($0.creationDate, inSameDayAs: selectedDate)
            }
            .sorted(using: KeyPathComparator(\.creationDate))
    }
    
    var body: some View {
        NavigationStack {
            List(filteredJournals) { journal in
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
                        Label("Delete", systemImage: "trash")
                    }
                }
            }
            .sheet(isPresented: $showDateFilterSheet) {
                DateFilterSheet(selectedDate: $selectedDate)
                    .presentationDetents([.height(410)])
            }
            .navigationTitle("Journal")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Journal")
                        .font(.headline)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showDateFilterSheet = true
                    } label: {
                        Image(systemName: "calendar")
                            .foregroundStyle(.secondary)
                            .symbolRenderingMode(.multicolor)
                    }
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
