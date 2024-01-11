import SwiftUI

struct JournalView: View {
    @Bindable var journal: Journal
    @FocusState var textFocus: Bool
        
    var body: some View {
        VStack {
            TextField("Title", text: $journal.title)
                .font(.headline)

            VStack {
                TextField("text", text: $journal.content, axis: .vertical)
                    .focused($textFocus)
                
                Spacer(minLength: 0)
            }
            .background(.background)
            .onTapGesture { textFocus = true }
            .allowsHitTesting(true)
        }
        .safeAreaPadding()
        .navigationTitle(journal.creationDate.dateString)
    }
}

#Preview("Detail") {
    let journal = Journal()
    journal.title = "What is Lorem Ipsum?"
    journal.content = mockText
    
    return NavigationStack { 
        JournalView(journal: journal)
            .navigationBarTitleDisplayMode(.inline)
    }
}




let mockText = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
