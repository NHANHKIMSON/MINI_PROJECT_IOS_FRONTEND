//
//  CustomVerticalCard.swift
//  Easy Card App
//
//  Created by Eang Kimlong on 9/26/25.
//

import SwiftUI

struct CustomVerticalCard: View {
    let imageUrl: String
    let title: String
    let price: String
    
    @State private var isSaved: Bool = false
    var body: some View {
        VStack {
            Image(imageUrl)
                .resizable()
                .scaledToFill()
                .frame(width: 180, height: 150)
                .clipped()
                .cornerRadius(10, corners: [.topLeft, .topRight])
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.system(size: 17))
                    .lineLimit(1)
                
                Spacer()
                
                HStack {
                    Text(price)
                    Spacer()
                    Button(action: {
                        isSaved.toggle()
                    }) {
                        Image(systemName: "bookmark.fill")
                            .foregroundStyle(isSaved ? Color.blue : Color(.systemGray3))
                    }
                }
            }
            .foregroundStyle(.black)
            .padding(.horizontal, 15)
            .padding(.vertical, 10)
        }
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.systemGray2), lineWidth: 1)
        }
        .frame(width: 180, height: 230)
    }
}


struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}
