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
            switch selectedTab{
            case 0:
                ForYouView(signleColumn: $gridType)
            case 1:
                Text("Explore")
            case 2:
//                Text("Saved")
                SavedView(signleColumn: $gridType)
            default:
                Text("Defaul")
            }
    }
}

//#Preview{
//    MarketScreen(gridType: .constant(false))
//}
#Preview {
    ContentView()
}


struct ForYouView: View {
    let oneColumn = [
        GridItem(.flexible()),
    ]
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    @Binding var signleColumn: Bool
    var body: some View {
        GeometryReader{ geo in
            ScrollView{
                if signleColumn{
                    LazyVGrid(columns: columns, spacing: geo.size.height * 0.02){
                        CardVerticle(geo: geo, itemID: 1)
                        CardVerticle(geo: geo, itemID: 2)
                        CardVerticle(geo: geo, itemID: 3)
                        CardVerticle(geo: geo, itemID: 4)
                        CardVerticle(geo: geo, itemID: 5)
                        CardVerticle(geo: geo, itemID: 6)
                        CardVerticle(geo: geo, itemID: 7)
                        CardVerticle(geo: geo, itemID: 8)
                        CardVerticle(geo: geo, itemID: 9)
                    }
                }else{
                    LazyVGrid(columns: oneColumn, spacing: geo.size.height * 0.02){
                        Card(geo: geo, itemID: 1)
                        Card(geo: geo, itemID: 2)
                        Card(geo: geo, itemID: 3)
                        Card(geo: geo, itemID: 4)
                        Card(geo: geo, itemID: 5)
                    }
                }
            }
        }
    }
}
    
    
struct Card: View {
    @State var geo: GeometryProxy
    @State var bookmark: Bool = false
    @EnvironmentObject var bookmarkManager: BookmarkManager
    let itemID: Int
//    let itemID = "Apple Watch Ultra"

    var body: some View {
        HStack{
            Image("iwatch")
                .resizable()
                .scaledToFit()
            VStack(alignment: .leading){
                Text("Apple Watch Ultra Generation")
                    .lineLimit(1)
                    .font(.subheadline)
                Spacer()
                HStack{
                    Text("$1,400.00")
                    Spacer()
                    Button(action: {
//                        bookmark = bookmark == false ? true : false
                        bookmark.toggle()
                        bookmarkManager.toggleBookmark(for: String(itemID))

                    }, label: {
//                        Image(systemName: bookmark ?  "bookmark.fill" : "bookmark")
                        Image(systemName: bookmarkManager.isBookmarked(String(itemID)) ? "bookmark.fill" : "bookmark")
                            .foregroundStyle(.yellow)
                    })
                }
                .font(.subheadline)
            }
            .padding([.trailing, .top, .bottom], 12)
        }
        .overlay{
            RoundedRectangle(cornerRadius: 24)
                .stroke(.gray.opacity(0.6), lineWidth: 2)
        }
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .frame(height: geo.size.height * 0.2)
    }
}
    
struct CardVerticle: View {
    @State var geo: GeometryProxy
    @State var bookmark: Bool = false
    @EnvironmentObject var bookmarkManager: BookmarkManager
    let itemID: Int
    
    var body: some View {
        VStack{
            Image("iwatch")
                .resizable()
                .scaledToFill()
                .frame(height: geo.size.width * 0.5)
            VStack(alignment: .leading){
                Text("Apple Watch Ultra Generation")
                    .lineLimit(1)
                    .font(.subheadline)
                Spacer()
                HStack{
                    Text("$1,400.00")
                    Spacer()
                    Button(action: {
//                        bookmark = bookmark == false ? true : false
                        bookmark.toggle()
                        bookmarkManager.toggleBookmark(for: String(itemID))
                    }, label: {
//                        Image(systemName: bookmark ?  "bookmark.fill" : "bookmark")
                        Image(systemName: bookmarkManager.isBookmarked(String(itemID)) ? "bookmark.fill" : "bookmark")
                            .foregroundStyle(.yellow)
                    })
                }
                .font(.subheadline)
            }
            .padding(12)
        }
        .overlay{
            RoundedRectangle(cornerRadius: 24)
                .stroke(.gray.opacity(0.6), lineWidth: 2)
        }
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .frame(width: geo.size.height * 0.29)
    }
}

