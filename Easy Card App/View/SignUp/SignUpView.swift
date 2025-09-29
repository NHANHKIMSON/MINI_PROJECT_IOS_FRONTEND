//
//  SignUpView.swift
//  Easy Card App
//
//  Created by sovanara  on 29/9/25.
//

import SwiftUI

struct SignUpView: View {
    var body: some View {
        VStack{
            Text("Item received!")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
                .font(.title)
                .fontWeight(.medium)
            
            Spacer()
            Image("signup")
                .resizable()
                .scaledToFit()
                .padding(.leading, 50)
            Spacer()
            NavigationLink(destination : ContentView() ) {
                Text("Done")
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 48)
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color.purple,
                                Color(red: 0.45, green: 0.2, blue: 0.8)
                            ]),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .cornerRadius(15)
                    .navigationBarBackButtonHidden(true)
            }
            .padding()
        }
    }
}

#Preview {
    SignUpView()
}
