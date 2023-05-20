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
    @State private var imageData: [Data] = []
    
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
                    SelectPhoto(imageData: $imageData)
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
