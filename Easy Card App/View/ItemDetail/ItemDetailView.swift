//
//  ItemDetailView.swift
//  Easy Card App
//
//  Created by sovanara  on 27/9/25.
//


import SwiftUI

struct ItemDetailView: View {
    @State private var product = Product.mockProduct
    @State private var isProductInfoExpanded = true
    @State private var selectedImageIndex = 0
    @State private var isSaving = false
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            Color(white: 0.97).ignoresSafeArea()
            
            VStack(spacing: 0) {
                HStack {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "arrow.left")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.black)
                            .frame(width: 32, height: 32)
                            .background(Color.white)
                            .clipShape(Circle())
                            .shadow(color: .black.opacity(0.05), radius: 2, x: 0, y: 1)
                    }
                    Spacer()
                    Text("Detail")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.black)
                    Spacer()
                    Color.clear.frame(width: 32, height: 32)
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 20) {
                        
                        TabView(selection: $selectedImageIndex) {
                            ForEach(Array(product.images.enumerated()), id: \.offset) { index, imageName in
                                Image(imageName)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: 350)
                                    .tag(index)
                            }
                        }
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                        .frame(height: 360)
                        .padding(.top, 10)
                        
                        HStack(spacing: 12) {
                            ForEach(Array(product.images.enumerated()), id: \.offset) { index, imageName in
                                Button(action: {
                                    withAnimation {
                                        selectedImageIndex = index
                                    }
                                }) {
                                    Image(imageName)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 50, height: 50)
                                        .background(Color(white: 0.95))
                                        .cornerRadius(8)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 8)
                                                .stroke(selectedImageIndex == index ? Color.purple : Color.gray.opacity(0.3), lineWidth: 2)
                                        )
                                }
                            }
                            Spacer()
                        }
                        .padding(.horizontal, 16)
                        
                        VStack(alignment: .leading, spacing: 6) {
                            Text("ID \(product.id)")
                                .font(.system(size: 12))
                                .foregroundColor(.gray)
                            
                            Text(product.name)
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundColor(.black)
                            
                            Text("$\(String(format: "%.2f", product.price))")
                                .font(.system(size: 22, weight: .bold))
                                .foregroundColor(Color(red: 0.35, green: 0, blue: 0.7))
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 16)
                        

                        VStack(spacing: 0) {
                            Button {
                                withAnimation {
                                    isProductInfoExpanded.toggle()
                                }
                            } label: {
                                HStack {
                                    Text("Product Info")
                                        .font(.system(size: 17, weight: .semibold))
                                        .foregroundColor(.black)
                                    Spacer()
                                    Image(systemName: "chevron.up")
                                        .rotationEffect(.degrees(isProductInfoExpanded ? 0 : 180))
                                        .foregroundColor(.black)
                                }
                                .padding(.horizontal, 16)
                                .padding(.vertical, 14)
                            }
                            
                            if isProductInfoExpanded {
                                VStack(spacing: 0) {
                                    ProductInfoRow(title: "Condition", value: product.condition)
                                    ProductInfoRow(title: "Brand", value: product.brand)
                                    ProductInfoRow(title: "Model", value: product.model)
                                    ProductInfoRow(title: "Color", value: product.color)
                                    ProductInfoRow(title: "Year", value: product.year)
                                    ProductInfoRow(title: "Size", value: product.size)
                                    ProductInfoRow(title: "Type", value: product.type)
                                    
                                    
                                    ProductInfoRow(title: "Description", value: product.description, isLast: true, multiline: true)
                                }
                            }
                        }
                        .background(Color.white)
                        .cornerRadius(8)
                        .shadow(color: Color.black.opacity(0.05), radius: 3, x: 0, y: 1)
                        .padding(.horizontal, 16)
                        .bold()
                        Spacer().frame(height: 90)
                    }
                }
                
                HStack(spacing: 12) {
                    Button(action: {
                        
                    }) {
                        Text("Buy now")
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
                    }
                    
                    Button(action: {
                        isSaving.toggle()
                    }) {
                        HStack(spacing: 6) {
                            Image( systemName: isSaving ? "bookmark.fill" : "bookmark")
                                Text("Save")
                        }
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.black)
                        .frame(width: 90, height: 48)
                        .background(Color.white)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                        )
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 12)
                .background(Color.white.shadow(color: .black.opacity(0.05), radius: 3, x: 0, y: -1))
            }
        }
        .navigationBarHidden(true)
    }
}

struct ProductInfoRow: View {
    let title: String
    let value: String
    var isLast: Bool = false
    var multiline: Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(alignment: .top, spacing: 12) {
                Text(title)
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                    .frame(width: 100, alignment: .leading)

                Text(value)
                    .font(.system(size: 14))
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .fixedSize(horizontal: false, vertical: multiline)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)

            if !isLast {
                Divider()
                    .padding(.leading, 16)
            }
        }
    }
}

#Preview {
    ItemDetailView()
}
