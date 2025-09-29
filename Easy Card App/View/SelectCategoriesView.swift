import SwiftUI

struct SelectCategoriesView: View {
//    var categories = [
//        (name: "Food & Drink", icon: "takeoutbag.and.cup.and.straw"),
//        (name: "Vehicle", icon: "car"),
//        (name: "Electronic Devices", icon: "tv.and.mediabox.fill"),
//        (name: "Properties", icon: "house.and.flag"),
//        (name: "Furniture", icon: "fan.desk"),
//        (name: "Pet", icon: "pawprint"),
//        (name: "Hobbies", icon: "guitars")
//    ]
    @ObservedObject var viewModel = CategoryViewModel()
    @Environment(\.dismiss) var dismiss
    @Binding var category: String
    @Binding var categoryId: Int
    
    var body: some View {
        List{
            ForEach(viewModel.categories, id: \.id) { category in
                Button{
                    self.category = category.name
                    categoryId = category.id
                    dismiss()
                } label:{
                    HStack{
                        Image(systemName: category.icon)
                            .frame(width: 30)
                            .padding(.trailing)
                        Text(category.name)
                    }
                    .font(.title3)
                    .foregroundStyle(Color.black)
                }
            }
        }
        .toolbarBackgroundVisibility(.visible, for: .navigationBar)
        .toolbarBackground(.white, for: .navigationBar)
        .toolbarTitleDisplayMode(.inline)
        .onAppear(perform: viewModel.fetchPosts)
        .toolbar {
            ToolbarItem(placement: .navigation) {
                Button{
                    dismiss()
                }label: {
                    Image(systemName: "arrow.backward")
                        .font(.caption)
                        .padding(8)
                        .frame(width: 30 , height: 30)
                        .bold()
                        .foregroundStyle(.black)
                        .background(Color.gray.opacity(0.8))
                        .cornerRadius(50)
                }
            }
            ToolbarItem(placement: .principal) {
                Text("Categories")
                    .bold()
            }
        }
    }
}

#Preview {
//    SelectCategoriesView(category: .constant("") )
    AddProductView()
}
