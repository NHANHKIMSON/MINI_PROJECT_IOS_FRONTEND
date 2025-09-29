//
//  CategoryCard.swift
//  Easy Card App
//
//  Created by Apple on 9/28/25.
//
import SwiftUI
struct CategoryCard: View {
    @State var geo: GeometryProxy
    @State var name: String
    @State var icon: String
    var body: some View {
        Button(action: {}, label: {
            HStack{
                Image(icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30)
                Text(name)
                    .lineLimit(1)
            }
            .padding()
            .frame(width: geo.size.width * 0.48)
            .background(.white)
            .cornerRadius(10)
        })
        .buttonStyle(CustomButtonStyle())
    }
}
