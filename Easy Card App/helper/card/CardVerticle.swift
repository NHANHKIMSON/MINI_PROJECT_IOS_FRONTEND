//
//  Untitled.swift
//  Easy Card App
//
//  Created by Apple on 9/29/25.
//
import SwiftUI
struct CardVerticle: View {
    @State var geo: GeometryProxy
    @State var isFavorite: Bool = false
    @State var name: String
    @State var image: String?
    @State var price: String?
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: image ?? "")) { phase in
                if let loadedImage = phase.image {
                    loadedImage
                        .resizable()
                        .scaledToFit()
                        .frame(height: geo.size.width * 0.35)
                }
            }
            VStack(alignment: .leading){
                Text(name)
                    .lineLimit(1)
                    .font(.subheadline)
                Spacer()
                HStack{
                    Text("$" + String(price ?? "0.00"))
                    Spacer()
                    Button(action: {
                        isFavorite = isFavorite == false ? true : false
                    }, label: {
                        Image(systemName: isFavorite ?  "bookmark.fill" : "bookmark")
                            .foregroundStyle(.brown)
                    })
                }
                .font(.subheadline)
            }
            .padding(12)
            .background(.white)
        }
        .overlay{
            RoundedRectangle(cornerRadius: 24)
                .stroke(.gray.opacity(0.6), lineWidth: 2)
        }
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .frame(width: geo.size.height * 0.29)
    }
}
