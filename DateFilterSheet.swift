import SwiftUI
    
struct DateFilterSheet: View {
    @State private var initialDate: Date!
    @Binding var selectedDate: Date
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            HStack {
                Button("cancel", role: .cancel) {
                    selectedDate = initialDate
                    dismiss()
                }
                Spacer()
                Text("select date")
                    .font(.headline)
                Spacer()
                Button("Done") {
                    dismiss()
                }
                .bold()
            }
            
            DatePicker("Search date", selection: $selectedDate, displayedComponents: .date)
                .datePickerStyle(.graphical)
        }
        .safeAreaPadding()
        .onAppear {
            initialDate = selectedDate
        }
    }
}

fileprivate struct SheetPreview: View {
    @State var isPresented: Bool = true
    @State var date: Date = Date()
    
    var body: some View {
        Button(date.dateString) {
            isPresented = true
        }
        .sheet(isPresented: $isPresented) {
            DateFilterSheet(selectedDate: $date)
                .presentationDetents([.height(410)])
        }
    }
} 

#Preview("Sheet") {
    SheetPreview()
}
