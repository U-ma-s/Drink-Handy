//
//  SelectPhoto.swift
//  Drink Handy
//  
//  Created by umas on 2023/04/30
//  
//

import SwiftUI
import PhotosUI

struct SelectPhoto: View {
    @State var photoPickerItems: [PhotosPickerItem] = []
    @State var images: [UIImage] = []

    @Binding var imageData: [Data]
    
    
    var body: some View {
        VStack {
            if images.isEmpty {
                PhotosPicker(
                    selection: $photoPickerItems,
                    maxSelectionCount: 1,
                    selectionBehavior: .ordered,
                    matching: .images, // 写真の種類を画像(images)だけに
                    preferredItemEncoding: .current,
                    photoLibrary: .shared()) {
                        VStack {
                            Image(systemName: "photo")
                                .resizable()
                                .frame(width: 130, height: 100)
                                .foregroundColor(.gray)
                        }
                    }
                    .onChange(of: photoPickerItems) { newPhotoPickerItems in
                        Task {
                            do {
                                for photoPickerItem in newPhotoPickerItems {
                                    if let data = try await photoPickerItem.loadTransferable(type: Data.self) {
                                        if let uiImage = UIImage(data: data) {
                                            images.append(uiImage)
                                            imageData.append(data)
                                        }
                                    }
                                }
                            } catch {
                                print(error)
                            }
                        }
                    }
            } else {
                Image(uiImage: images[0])
                    .resizable()
                    .scaledToFit()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        //.background(.black)
    }
}
