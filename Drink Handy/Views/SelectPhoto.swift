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
    @Binding var menu: Menu
    
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
//                            Image(uiImage: menu.photo ?? UIImage(systemName: "photo")!)
//                                .resizable()
//                                .frame(width: 130, height: 100)
//                                .foregroundColor(.gray)//反映されない
//                            Text((menu.photo != nil) ? "写真を変更する" : "完成イメージを追加する")
                            // ver.2
                            if let safePhoto = menu.photo{
                                Image(uiImage: safePhoto)
                                    .resizable()
                                    .frame(width: 130, height: 100)
                                Text("写真を変更する")
                            } else {
                                Image(systemName: "photo")
                                    .resizable()
                                    .frame(width: 130, height: 100)
                                    .foregroundColor(.gray)
                                Text("完成イメージを追加する")
                            }
                        }
                    }
                    .onChange(of: photoPickerItems) { newPhotoPickerItems in
                        Task {
                            do {
                                for photoPickerItem in newPhotoPickerItems {
                                    if let data = try await photoPickerItem.loadTransferable(type: Data.self) {
                                        if let uiImage = UIImage(data: data) {
                                            images.append(uiImage)
                                            menu.photo = uiImage
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

struct SelectPhoto_Previews: PreviewProvider {
    static var previews: some View {
        SelectPhoto(menu: .constant(Menu.sampleData[0]))
    }
}
