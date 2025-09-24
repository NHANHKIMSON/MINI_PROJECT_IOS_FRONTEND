//
//  ContentView.swift
//  Easy Card App
//
//  Created by Apple on 9/19/25.
//

import SwiftUI

struct ContentView: View {
    @State var gridType: Bool = true
    var body: some View {
        NavigationStack{
            TabView {
                VStack{
                    HeaderView(gridType: $gridType)
                    MarketScreen(gridType: $gridType)
                    Spacer()
                }
                .padding(.horizontal, 12)
                .tabItem {
                    Image(systemName: "plus.app.fill")
                }
            }
        }
    }
}
#Preview {
    ContentView()
}
