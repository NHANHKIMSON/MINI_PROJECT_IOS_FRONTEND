//
//  ContentView.swift
//  Easy Card App
//
//  Created by Apple on 9/19/25.
//

import SwiftUI

struct ContentView: View {
    @State var gridType: Bool = true
    @State private var isShow = false
    var body: some View {
        NavigationStack {
            VStack {
                HeaderView(gridType: $gridType)
                MarketScreen(gridType: $gridType)
                Spacer()
            }
            .padding(.horizontal, 12)
            .toolbar {
                ToolbarItem(placement: .bottomBar) {                        Button(action: {
                        isShow = true
                    }) {
                        Image(systemName: "plus.app.fill")
                            .font(.title)
                            .foregroundStyle(Color(.black).opacity(0.7))
                    }.fullScreenCover(isPresented: $isShow) {
                        AddProductView()
                    }
                }
            }

        }
    }
}
#Preview {
    ContentView()
}
