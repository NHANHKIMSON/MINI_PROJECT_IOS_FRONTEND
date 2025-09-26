//
//  Easy_Card_AppApp.swift
//  Easy Card App
//
//  Created by Apple on 9/19/25.
//

import SwiftUI

@main
struct Easy_Card_AppApp: App {
    @StateObject var bookmarkManager = BookmarkManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(bookmarkManager)
//            MarketScreen(gridType: .constant(false))
//                            .environmentObject(bookmarkManager)
        }
    }
}
