//
//  MarketScreen.swift
//  Easy Card App
//
//  Created by Apple on 9/19/25.
//

import SwiftUI
struct MarketScreen: View {
    @Binding var gridType: Bool
    @State var selectedTab: Int = 0

    var body: some View {
        // Tab Screen
        TabViews(tabs: [
            .init(image: "image", title: "For you"),
            .init(image: "image", title: "Explore"),
            .init(image: "image", title: "Saved")
        ], geoWidth: 375, selectedTab: $selectedTab)
        
        // Tab Content Screen
        
        ZStack{
            Color("DP50")
            Group{
                switch selectedTab{
                case 0:
                    ForYouView(signleColumn: $gridType)
                case 1:
                    ExploreView(signleColumn: $gridType)
                case 2:
                    SavedView(signleColumn: $gridType)
                default:
                    Text("Defaul")
                }
            }
            .padding(12)
        }
    }
}

//#Preview{
//    MarketScreen(gridType: .constant(false))
//}
#Preview {
    ContentView()
}

    
    
struct Card: View {
    let geo: GeometryProxy
    let name: String
    let image: String?
    @State var isFavorite: Bool?
    let price: String?
    var itemID: String


    var body: some View {
        HStack {
            AsyncImage(url: URL(string: image ?? "")) { phase in
                if let loadedImage = phase.image {
                    loadedImage
                        .resizable()
                        .scaledToFill()
                        .frame(width: geo.size.width * 0.35, height: geo.size.width * 0.3)
                        .clipped()
                }
            }
            VStack(alignment: .leading) {
                Text(name)
                    .lineLimit(1)
                    .font(.subheadline)
                Spacer()
                HStack {
                    Text("\(price ?? "0") $")
                    Spacer()
                    Button {
                        isFavorite?.toggle()
                    } label: {
                        Image(systemName: isFavorite == true ? "bookmark.fill" : "bookmark")
                            .foregroundStyle(.yellow)
                    }
                }
                .font(.subheadline)
            }
            .padding([.trailing, .top, .bottom], 12)
        }
        .overlay {
            RoundedRectangle(cornerRadius: 24)
                .stroke(.gray.opacity(0.6), lineWidth: 2)
        }
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .frame(height: geo.size.height * 0.2)
    }
}

struct CardVerticle: View {
    let geo: GeometryProxy
    let name: String
    let image: String?
    @State var isFavorite: Bool?
    let price: String?
    var itemID: String

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: image ?? "")) { phase in
                if let loadedImage = phase.image {
                    loadedImage
                        .resizable()
                        .scaledToFill()
                        .frame(width: .infinity, height: geo.size.width * 0.3)
                        .clipped()
                }
            }
            
            VStack(alignment: .leading) {
                Text(name)
                    .lineLimit(1)
                    .font(.subheadline)
                Spacer()
                HStack {
                    Text("\(price ?? "0") $")
                    Spacer()
                    Button {
                        isFavorite?.toggle()
                    } label: {
                        Image(systemName: isFavorite == true ? "bookmark.fill" : "bookmark")
                            .foregroundColor(.yellow)
                    }
                }
                .font(.subheadline)
            }
            .padding(12)
        }
        .overlay {
            RoundedRectangle(cornerRadius: 24)
                .stroke(.gray.opacity(0.6), lineWidth: 2)
        }
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .frame(width: geo.size.height * 0.29)
    }
}
