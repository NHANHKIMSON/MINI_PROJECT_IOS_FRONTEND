//
//  HeaderView.swift
//  Easy Card App
//
//  Created by Apple on 9/19/25.
//

import SwiftUI
struct HeaderView: View {
    @Binding var gridType: Bool
    var body: some View {
        HStack{
            Group{
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 32)
                Spacer()
                Button(action: {
                    gridType = gridType == true ? false : true
                }){
                    Image(systemName: gridType ?  "square.grid.2x2.fill" : "rectangle.grid.1x2.fill")
                        .font(.title2)
                }
                .buttonStyle(CustomButtonStyle())
            }
        }
    }
}
