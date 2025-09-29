//
//  CustomAsynImage.swift
//  Easy Card App
//
//  Created by Apple on 9/28/25.
//

import SwiftUI
struct CustomAsynImage: View{
    @State var image: String?
    var body: some View{
        AsyncImage(url: URL(string: image ?? "")) { phase in
            if let loadedImage = phase.image {
                loadedImage
                    .resizable()
                    .scaledToFill()
                    .clipped()
            }
        }
    }
}
