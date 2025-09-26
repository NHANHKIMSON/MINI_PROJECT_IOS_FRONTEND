//
//  PaymentScreen.swift
//  Easy Card App
//
//  Created by Eang Kimlong on 9/26/25.
//
import SwiftUI
import Foundation

// temporary struct
struct ItemDetail {
    var title: String
    var desc: String
}


struct PaymentScreen: View {
    let buttonIcon = [
        "iphone",
        "iphone 1",
        "iphone2",
        "iphone3"
        ]
    let itemDetails = [
        ItemDetail(title: "Condition", desc: "New"),
        ItemDetail(title: "Brand", desc: "Apple"),
        ItemDetail(title: "Model", desc: "iphone 17 pro max"),
        ItemDetail(title: "Color", desc: "Orange"),
        ItemDetail(title: "Year", desc: "2025"),
        ItemDetail(title: "Size", desc: "XL"),
        ItemDetail(title: "Type", desc: "_"),
        ItemDetail(title: "Description", desc: "The product is only for sale and available in Phnom Penh only.")
    ]
    @State private var selectedItem = "iphone"
    @State private var showAllFields: Bool = false
    @Environment(\.dismiss) var dismiss
    var toolbarTitle: String
    var body: some View {
        VStack{
            VStack{
                Image(selectedItem)
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: 320)
                    .clipped()
                    .overlay(alignment: .bottomTrailing){
                        if(toolbarTitle == "Sold out"){
                            HStack{
                                Text("😭 Sold Out")
                                    .foregroundStyle(.red)
                                    .padding(.vertical, 10)
                                    .padding(.horizontal, 20)
                                    .background(.white)
                                    .cornerRadius(30)
                                    .padding([.trailing, .bottom])
                            }
                        } else if(toolbarTitle == "Purchased") {
                            HStack{
                                Image(systemName: "checkmark.circle.fill")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                Text("Purchased")
                            }
                            .padding(.vertical, 10)
                            .padding(.horizontal, 20)
                            .foregroundStyle(.green)
                            .background(.white)
                            .cornerRadius(30)
                            .padding([.trailing, .bottom])
                        }

                    }
                VStack(alignment: .leading){
                    Text("ID: 123456789")
                        .foregroundStyle(.secondary)
                    Text("iPhone 15 Pro Max 256gb (LL)")
                        .font(Font.system(size: 20, weight: .bold))
                    Text("$1,750.00")
                        .font(Font.system(size: 25, weight: .bold))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(  )
                
                HStack{
                    ForEach(buttonIcon, id: \.self){ item in
                        Button(action: {
                            selectedItem = item
                        }){
                            Image(item)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 60)
                                .cornerRadius(10)
                                .overlay{
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(selectedItem == item ? Color.gray : Color.clear, lineWidth: 2)
                                }
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
                
                List {
                    HStack {
                        Text("Product Info")
                            .font(.system(size: 18, weight: .bold))

                        Spacer()

                        Button(action: {
                            withAnimation(.easeInOut) {
                                showAllFields.toggle()
                            }
                        }) {
                            Image(systemName: showAllFields ? "chevron.up" : "chevron.down")
                                .font(.system(size: 13, weight: .semibold))
                                .foregroundStyle(.gray)
                        }
                    }
                    .padding(.vertical, 10)
                    if showAllFields {
                        ForEach(itemDetails, id: \.title) { detail in
                          
                            HStack(alignment: .top) {
                                Text(detail.title)
                                    .foregroundStyle(Color(.systemGray))
                                    .frame(width: 120, alignment: .leading)
                                Text(detail.desc)
                                    .foregroundStyle(.black)
                                    .multilineTextAlignment(.leading)
                            }
                            .padding(.vertical, 10)
                        }
                    }
                }
                .scrollIndicators(.hidden)
                .foregroundStyle(.black)
                .background(.white)
                .animation(.easeInOut, value: showAllFields)
                
                Divider()
                if(toolbarTitle == "Purchased"){
                    VStack{
                        HStack{
                            NavigationLink(
                                destination: /*RecieveItemView()*/
                                Text("Some View")
                            ){
                                Button(action: {
                                    
                                }) {
                                    Text("I received a item")
                                        .font(.system(size: 17, weight: .bold))
                                        .foregroundColor(.white)
                                        .frame(width: .infinity, height: 48)
                                }
                                .frame(maxWidth: .infinity)
                                .background(Color.purple)
                                .cornerRadius(10)
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }

            }
        }
        .padding(.top)
        .background(Color(.systemGray6))
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "arrow.backward")
                        .resizable()
                        .frame(width: 10, height: 10)
                        .padding()
                        .foregroundStyle(.black)
                        .background(Color(.systemGray5))
                        .clipShape(Circle())
                }
            }
            
            ToolbarItem(placement: .principal) {
                Text(toolbarTitle)
                    .font(.headline)
            }
        }
    }
}

//#Preview {
//    PaymentScreen(toolbarTitle: "sold out")
//}
