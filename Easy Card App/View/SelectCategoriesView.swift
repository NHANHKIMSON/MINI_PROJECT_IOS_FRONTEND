import SwiftUI

struct SelectCategoriesView: View {
    var categories = [
        (name: "Food & Drink", icon: "takeoutbag.and.cup.and.straw"),
        (name: "Vehicle", icon: "car"),
        (name: "Electronic Devices", icon: "tv.and.mediabox.fill"),
        (name: "Properties", icon: "house.and.flag"),
        (name: "Furniture", icon: "fan.desk"),
        (name: "Pet", icon: "pawprint"),
        (name: "Hobbies", icon: "guitars")
    ]
    @Environment(\.dismiss) var dismiss
    @Binding var category: String
    
    var body: some View {
        List{
            ForEach(categories.indices, id: \.self) { index in
                let item = categories[index]
                Button{
                    category = item.name
                    dismiss()
                } label:{
                    HStack{
                        Image(systemName: item.icon)
                            .frame(width: 30)
                            .padding(.trailing)
                        Text(item.name)
                    }
                    .font(.title3)
                    .foregroundStyle(Color.black)
                    .padding(10)
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigation) {
                Button{
                    dismiss()
                }label: {
                    Image(systemName: "arrow.backward")
                        .padding(8)
                        .frame(width: 40, height: 40)
                        .font(.title3)
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
