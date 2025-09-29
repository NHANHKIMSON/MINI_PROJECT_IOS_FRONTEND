import PhotosUI
import SwiftUI

struct AddProductView: View {
    @Environment(\.dismiss) var dismiss

    @State private var category: String = ""
    @State private var categoryId: Int = 0
    @State private var title = ""
    @State private var price = ""
    @State private var condition = ""
    @State private var brand = ""
    @State private var model = ""
    @State private var color = ""
    @State private var year = ""
    @State private var size = ""
    @State private var type = ""
    @State private var description = ""

    @State private var isSelect = false
    @State private var isExpand = false
    @State private var selectedItems: [PhotosPickerItem] = []
    @State private var selectedImages: [UIImage] = []
    @State private var selectedImagesRawData: [Data] = []
    @State var file: File?

    @State private var imageURL: [String] = []

    var body: some View {
        NavigationStack {
            ZStack {
                Color(.whiteBackground)
                    .ignoresSafeArea()
                VStack {
                    VStack {
                        Text("Photos")
                            .bold()
                            .font(.title3)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        if !selectedImages.isEmpty {
                            HStack {
                                ScrollView(.horizontal) {
                                    HStack(spacing: 20) {
                                        ForEach(
                                            selectedImages.indices,
                                            id: \.self
                                        ) { index in
                                            let img = selectedImages[index]
                                            Image(uiImage: img)
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 100, height: 100)
                                                .cornerRadius(10)
                                                .clipped()
                                                .overlay(
                                                    alignment: .topTrailing
                                                ) {
                                                    Button {
                                                        selectedImages.remove(
                                                            at: index
                                                        )
                                                    } label: {
                                                        Image(
                                                            systemName: "xmark"
                                                        )
                                                        .padding(5)
                                                        .bold()
                                                        .foregroundStyle(
                                                            Color.white
                                                        )
                                                        .background(
                                                            Color(.gray)
                                                                .opacity(0.8)
                                                        )
                                                        .cornerRadius(50)
                                                        .padding(5)
                                                    }
                                                }
                                        }
                                    }
                                }.scrollIndicators(.hidden, axes: .horizontal)
                                PhotosPicker(
                                    selection: $selectedItems,
                                    matching: .images
                                ) {
                                    HStack {
                                        Image(systemName: "plus")
                                            .font(.caption)
                                            .padding(8)
                                            .foregroundStyle(.white)
                                            .background(Color(.primary))
                                            .cornerRadius(50)
                                    }
                                    .frame(width: 100, height: 100)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(
                                                style: StrokeStyle(
                                                    lineWidth: 1,
                                                    dash: [7]
                                                )
                                            )
                                            .foregroundColor(.gray)
                                    )
                                    .onChange(of: selectedItems) { newValue in
                                        Task {
                                            selectedImages.removeAll()
                                            selectedImagesRawData.removeAll()
                                            for item in newValue {
                                                if let data =
                                                    try? await item
                                                    .loadTransferable(
                                                        type: Data.self
                                                    )
                                                {

                                                    if let uiImage = UIImage(
                                                        data: data
                                                    ) {
                                                        selectedImagesRawData
                                                            .append(data)
                                                        selectedImages.append(
                                                            uiImage
                                                        )

                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        } else {
                            HStack {
                                PhotosPicker(
                                    selection: $selectedItems,
                                    matching: .images
                                ) {
                                    Image(systemName: "plus")
                                        .font(.title3)
                                        .padding(10)
                                        .foregroundStyle(.white)
                                        .background(Color(.primary))
                                        .cornerRadius(50)
                                }
                            }
                            .padding(20)
                            .frame(maxWidth: .infinity, maxHeight: 100)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(
                                        style: StrokeStyle(
                                            lineWidth: 1,
                                            dash: [7]
                                        )
                                    )
                                    .foregroundColor(.gray)
                            )
                            .onChange(of: selectedItems) { newValue in
                                Task {
                                    selectedImages.removeAll()
                                    selectedImagesRawData.removeAll()
                                    for item in newValue {
                                        if let data =
                                            try? await item.loadTransferable(
                                                type: Data.self
                                            )
                                        {

                                            if let uiImage = UIImage(data: data)
                                            {
                                                selectedImagesRawData.append(
                                                    data
                                                )
                                                selectedImages.append(uiImage)

                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.white)
                    .cornerRadius(20)
                    .padding(.horizontal)
                    .padding(.vertical)

                    List {
                        Button {
                            isSelect = true
                        } label: {
                            HStack {
                                Text("Categories")
                                    .foregroundStyle(.black)
                                Spacer()
                                Text(category == "" ? "Select one" : category)
                                    .foregroundStyle(
                                        category == ""
                                            ? Color(.primary) : .black
                                    )
                                Image(systemName: "chevron.right")
                                    .foregroundStyle(.gray)
                            }
                        }
                        .navigationDestination(isPresented: $isSelect) {
                            // select categories
                            SelectCategoriesView(
                                category: $category,
                                categoryId: $categoryId
                            )
                            .navigationBarBackButtonHidden()
                        }
                        HStack {
                            Text("Title")
                                .frame(width: 100, alignment: .leading)
                            TextField("Input", text: $title)
                        }
                        HStack {
                            Text("Price")
                                .frame(maxWidth: .infinity, alignment: .leading)
                            TextField("$0.00", text: $price)
                                .frame(
                                    maxWidth: .infinity,
                                    alignment: .trailing
                                )
                                .multilineTextAlignment(.trailing)
                        }
                        Button {
                            isExpand.toggle()
                        } label: {
                            HStack {
                                Text("More Details")
                                    .foregroundStyle(.black)
                                Spacer()
                                if isExpand {
                                    Image(systemName: "chevron.right")
                                        .foregroundStyle(.gray)
                                        .rotationEffect(.degrees(90))
                                } else {
                                    Image(systemName: "chevron.right")
                                        .foregroundStyle(.gray)
                                        .rotationEffect(.zero)
                                }
                            }
                        }
                        if isExpand {
                            ScrollView {
                                VStack{
                                    HStack {
                                        Text("Condition")
                                            .frame(width: 100, alignment: .leading)
                                        TextField("Used, New...", text: $condition)
                                    }
                                    HStack {
                                        Text("Brand")
                                            .frame(width: 100, alignment: .leading)
                                        TextField("Input", text: $brand)
                                    }
                                    HStack {
                                        Text("Model")
                                            .frame(width: 100, alignment: .leading)
                                        TextField("Input", text: $model)
                                    }
                                    HStack {
                                        Text("Color")
                                            .frame(width: 100, alignment: .leading)
                                        TextField("White, Black...", text: $color)
                                    }
                                    HStack {
                                        Text("Year")
                                            .frame(width: 100, alignment: .leading)
                                        TextField("Input", text: $year)
                                    }
                                    HStack {
                                        Text("size")
                                            .frame(width: 100, alignment: .leading)
                                        TextField("S, X, XL", text: $size)
                                    }
                                    HStack {
                                        Text("type")
                                            .frame(width: 100, alignment: .leading)
                                        TextField("Input", text: $type)
                                    }
                                    HStack {
                                        Text("description")
                                            .frame(width: 100, alignment: .leading)
                                        TextField("description", text: $description)
                                    }
                                }
                            }
                        }
                    }
                    .cornerRadius(20)
                    .scrollIndicators(.hidden)
                    
                    Button {
                        var completedCount = 0
                        let totalCount = selectedImagesRawData.count

                        imageURL.removeAll()
                        for data in selectedImagesRawData {
                            uploadfile(image: data) { file in
                                if let fileImage = file {
                                    imageURL.append(fileImage.payload.fileURL)
                                }
                                completedCount += 1
                                if completedCount == totalCount {
                                    postProduct(
                                        condition: condition,
                                        brand: brand,
                                        model: model,
                                        color: color,
                                        year: year,
                                        size: size,
                                        type: type,
                                        description: description,
                                        name: title,
                                        imagesURL: imageURL,
                                        isFavorite: false,
                                        categoryId: categoryId
                                    )

                                }
                            }
                        }
                        print("success add product")
                    } label: {
                        Text("Post")
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 10)
                            .foregroundStyle(title == "" || price == "" ? .gray : .white)
                            .background(title == "" || price == "" ? Color.white : Color(.primary))
                            .cornerRadius(20)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20, style: .continuous)
                                    .stroke(.gray, lineWidth: 2)
                            )
                            .padding(.horizontal)
                            
                    }
                    .disabled(title == "" || price == "" ? true : false)
                }
            }
            .toolbarBackgroundVisibility(.visible, for: .navigationBar)
            .toolbarBackground(.white, for: .navigationBar)
            .toolbarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .font(.caption)
                            .padding(8)
                            .frame(width: 30, height: 30)
                            .bold()
                            .foregroundStyle(.black)
                            .background(Color(.black).opacity(0.3))
                            .cornerRadius(50)
                    }
                }
                ToolbarItem(placement: .principal) {
                    Text("Add item")
                        .bold()
                }
            }
        }

    }
}

#Preview {
    AddProductView()
}
