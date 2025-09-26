//
//  ExploreView.swift
//  Easy Card App
//
//  Created by Apple on 9/26/25.
//

import SwiftUI
struct ExploreView: View {
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

#Preview {
    ContentView()
}
