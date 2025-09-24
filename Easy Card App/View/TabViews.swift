//
//  TabView.swift
//  Easy Card App
//
//  Created by Apple on 9/19/25.
//


import SwiftUI
struct TabViews: View {
    var fixed = true
    var tabs = [TabModel]()
    var geoWidth: CGFloat
    @Binding var selectedTab: Int
    @Namespace private var tabUnderline
    
    var body: some View {
        ScrollViewReader{ proxy in
            VStack(spacing: 0){
                HStack(spacing: 0){
                    ForEach(0..<tabs.count, id: \.self){ row in
                        Button(action: {
                            withAnimation{
                                selectedTab = row
                            }
                        }) {
                            HStack(spacing: 0){
                                VStack(spacing: 6) {
                                    Text(tabs[row].title)
                                        .font(.subheadline)
                                        .fontWeight(selectedTab == row ? .semibold : .regular)
                                        .scaleEffect(selectedTab == row ? 1.05 : 1.0)
                                        .opacity(selectedTab == row ? 1.0 : 0.85)
                                        .animation(.spring(duration: 0.35, bounce: 0.2), value: selectedTab)
                                    
                                    ZStack {
                                        // Faint baseline to stabilize layout
                                        Capsule()
                                            .fill(Color.clear)
                                            .frame(height: 2)
                                        
                                        if selectedTab == row {
                                            Capsule()
                                                .fill(Color.purple)
                                                .matchedGeometryEffect(id: "underline", in: tabUnderline)
                                                .frame(height: 2)
                                                .transition(.opacity.combined(with: .scale))
                                        }
                                    }
                                }
                                .frame(width: fixed ? (geoWidth / CGFloat(tabs.count)) : .none, height: 52)
                                .foregroundStyle(.black)
                            }
                        }
                        .scaleEffect(selectedTab == row ? 1.0 : 0.99)
                        .animation(.spring(duration: 0.3, bounce: 0.15), value: selectedTab)
                        .buttonStyle(CustomButtonStyle())
                    }
                }
            }
            .onChange(of: selectedTab) { oldValue, newValue in
                withAnimation(.spring(duration: 0.45, bounce: 0.35)) {
                    proxy.scrollTo(newValue)
                }
            }
        }
    }
}
