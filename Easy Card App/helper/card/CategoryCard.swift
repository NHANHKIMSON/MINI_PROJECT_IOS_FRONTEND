//
//  CategoryCard.swift
//  Easy Card App
//
//  Created by Apple on 9/28/25.
//
import SwiftUI
struct CategoryCard: View {
    @State var geo: GeometryProxy
    @State var id: Int?
    @State var name: String
    @State var icon: String
    @State var isCategoryDetails: Bool = false
    var body: some View {
        Button(action: {
            isCategoryDetails = true
        }, label: {
            HStack{
                Image(systemName: icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30)
                Text(name)
                    .lineLimit(1)
                Spacer()
            }
            .padding()
            .frame(width: geo.size.width * 0.45)
            .background(.white)
            .cornerRadius(10)
        })
        .buttonStyle(CustomButtonStyle())
        .navigationDestination( isPresented: $isCategoryDetails){
            CategoryDetailScreen(id: id ?? 0)
        }
    }
}
#Preview {
    ContentView()
}
