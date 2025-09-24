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
            switch selectedTab{
            case 0:
                ForYouView(signleColumn: $gridType)
            case 1:
                Text("Explore")
            case 2:
                Text("Saved")
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
                        CardVerticle(geo: geo)
                        CardVerticle(geo: geo)
                        CardVerticle(geo: geo)
                        CardVerticle(geo: geo)
                        CardVerticle(geo: geo)
                        CardVerticle(geo: geo)
                        CardVerticle(geo: geo)
                        CardVerticle(geo: geo)
                        CardVerticle(geo: geo)
                    }
                }else{
                    LazyVGrid(columns: oneColumn, spacing: geo.size.height * 0.02){
                        Card(geo: geo)
                        Card(geo: geo)
                        Card(geo: geo)
                        Card(geo: geo)
                        Card(geo: geo)
                    }
                }
            }
        }
    }
}
    
    
struct Card: View {
        @State var geo: GeometryProxy
        @State var bookmark: Bool = false
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
                            bookmark = bookmark == false ? true : false
                        }, label: {
                            Image(systemName: bookmark ?  "bookmark.fill" : "bookmark")
                                .foregroundStyle(.brown)
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
                        bookmark = bookmark == false ? true : false
                    }, label: {
                        Image(systemName: bookmark ?  "bookmark.fill" : "bookmark")
                            .foregroundStyle(.brown)
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
