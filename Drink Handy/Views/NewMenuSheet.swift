//
//  NewMenuSheet.swift
//  Drink Handy
//  
//  Created by umas on 2023/04/30
//  
//

import SwiftUI
import PhotosUI

struct NewMenuSheet: View {
    @Binding var isPresentiongNewMenuView: Bool
    
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss//NavigationStackからこのviewをポップ
    

    
    @ObservedObject var menuViewModel: MenuViewModel
    //@Stateで選択後の写真が格納される配列をこっちからSelectPhotoに渡す。それをmenuViewModel.photoDataに格納する？
    @State private var images: [UIImage] = []
    @State private var imageData: [Data] = []
    @State private var photoPickerItems: [PhotosPickerItem] = []
    
    var body: some View {
        NavigationStack{
            Form {
                Section {
                    TextField("メニュー名", text: $menuViewModel.name)
                    Toggle("アルコール", isOn: $menuViewModel.isAlcoholic)//プルダウンにする？
                } header: {
                    Text("メニュー情報")
                }
                Section {
                    TextField("作り方", text: $menuViewModel.recipe, axis: .vertical)
                } header: {
                    Text("作り方")
                }
                
                Section {
                    SelectPhoto(photoPickerItems: $photoPickerItems, images: $images, imageData: $imageData)
                } header: {
                    Text("完成イメージ")
                }
            }
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        menuViewModel.photoData = imageData[0]//選択画像を反映
                        menuViewModel.writeData(moc: moc)
                        
                        isPresentiongNewMenuView = false
                    } label: {
                        Text("Save")
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button {
                        /// 値の初期化
                        menuViewModel.name = ""
                        menuViewModel.isAlcoholic = true
                        menuViewModel.recipe = ""
                        menuViewModel.photoData = Data.init(capacity: 0)
                        /// modelの解除
                        isPresentiongNewMenuView = false
                    } label: {
                        Text("Cancel")
                    }
                }

            }
        }
    }
}
