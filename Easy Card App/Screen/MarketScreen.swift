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
    @StateObject var bookmarkManager = BookmarkManager()

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
        .environmentObject(BookmarkManager())
}

    
    
struct Card: View {
    let geo: GeometryProxy
    @EnvironmentObject var bookmarkManager: BookmarkManager
    var itemID: String

    var body: some View {
        HStack {
            Image("iwatch")
                .resizable()
                .scaledToFit()
            VStack(alignment: .leading) {
                Text("Apple Watch Ultra Generation")
                    .lineLimit(1)
                    .font(.subheadline)
                Spacer()
                HStack {
                    Text("$1,400.00")
                    Spacer()
                    Button {
                        bookmarkManager.toggleBookmark(for: itemID)
                    } label: {
                        Image(systemName: bookmarkManager.isBookmarked(itemID) ? "bookmark.fill" : "bookmark")
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
    let isFavorite: Bool?
    let price: String?
    @EnvironmentObject var bookmarkManager: BookmarkManager
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
            
//            AsyncImage(url: URL(string: image ?? "")) { image in
//                image
//                    .resizable()
//                    .scaledToFill()
//                    .frame(width: geo.size.width, height: geo.size.width * 0.3)
//                    .clipped()
//            } placeholder: {
//                ProgressView() // <- This is the placeholder
//                    .frame(width: geo.size.width, height: geo.size.width * 0.3)
//            }

            VStack(alignment: .leading) {
                Text(name)
                    .lineLimit(1)
                    .font(.subheadline)
                Spacer()
                HStack {
                    Text("\(price ?? "0") $")
                    Spacer()
                    Button {
                        bookmarkManager.toggleBookmark(for: itemID)
                    } label: {
                        Image(systemName: bookmarkManager.isBookmarked(itemID) ? "bookmark.fill" : "bookmark")
                            .foregroundStyle(.yellow)
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
