//
//  ItemReceiveView.swift
//  Easy Card App
//
//  Created by So Chetra on 27/9/25.
//
import Foundation
import SwiftUI

struct ItemReceiveView: View {
    var body: some View {
        NavigationStack {
            VStack{
                HStack {
                    Spacer()
                    Image("Group 5743")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                }
                .padding(.top,80)
                Spacer()
                VStack {
                    Button("Done") {
                        // action
                    }
                    .padding(12)
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(.white)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.purple)
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.purple, lineWidth: 3)
                    )
                }
                .padding(.horizontal, 20)
            }
            .navigationTitle("Item received!")
            .padding()
        }

    }
}

#Preview {
    ItemReceiveView()
}
