import SwiftUI

struct AddProductView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            VStack {
                Text("Hello world")
                VStack{
                    Text("Photos")
                    Image(systemName: "plus")
                        .foregroundStyle(.white)
                        .padding(9)
                        .background(Color(.primary))
                        .cornerRadius(50)

                }
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .bold()
                            .padding(8)
                            .foregroundStyle(.black)
                            .background(Color(.black).opacity(0.3))
                            .cornerRadius(50)
                    }
                }
                ToolbarItem(placement: .principal) {
                    Text("Add item")
                        .bold()
                }
            }
        }
    }
}

#Preview {
    AddProductView()
}
