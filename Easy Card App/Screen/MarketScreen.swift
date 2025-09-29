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
                    Text("Saved")
                default:
                    Text("Defaul")
                }
            }
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
    @ObservedObject var productModelView = ProductViewModel()
    @State var geo: GeometryProxy
    @State var isFavorite: Bool = false
    @State var id: Int = 3
    @State var name: String
    @State var image: String?
    @State var price: String?
    var body: some View {
        HStack{
            AsyncImage(url: URL(string: image ?? "")) { phase in
                if let loadedImage = phase.image {
                    loadedImage
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width * 0.35)
                }
            }
            VStack(alignment: .leading){
                Text(name)
                    .lineLimit(1)
                    .font(.subheadline)
                Spacer()
                HStack{
                    Text("$" + (price ?? ""))
                    Spacer()
                    Button(action: {
                        isFavorite.toggle()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            productModelView.changeStatus(id: id, isFavorite: isFavorite)
                        }
                    }, label: {
                        Image(systemName: isFavorite ?  "bookmark.fill" : "bookmark")
                            .foregroundStyle(.brown)
                    })
                }
                .font(.subheadline)
            }
            .padding([.trailing, .top, .bottom], 12)
        }
        .background(Color.white)
        .overlay{
            RoundedRectangle(cornerRadius: 24)
                .stroke(.gray.opacity(0.6), lineWidth: 2)
        }
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .frame(height: geo.size.height * 0.2)
        .padding(.top, 12)
    }
}
