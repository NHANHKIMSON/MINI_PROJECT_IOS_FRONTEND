//
//  CustomFont.swift
//  Easy Card App
//
//  Created by Apple on 9/19/25.
//

import SwiftUI
struct CustomButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}
