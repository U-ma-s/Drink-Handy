//
//  NewMenuSheet.swift
//  Drink Handy
//  
//  Created by umas on 2023/04/30
//  
//

import SwiftUI

struct NewMenuSheet: View {
    @Binding var isPresentiongNewMenuView: Bool
    
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss//NavigationStackからこのviewをポップ
    
    @State private var isAlcoholic = true
    @State private var name = ""
    @State private var photoData = Data.init(capacity: 0)
    @State private var recipe = ""
    
    var body: some View {
        NavigationStack{
            Form {
                Section {
                    TextField("メニュー名", text: $name)
                    Toggle("アルコール", isOn: $isAlcoholic)//プルダウンとかの方がわかりやすいかな？
                } header: {
                    Text("メニュー情報")
                }
                Section {
                    TextField("作り方", text: $recipe, axis: .vertical)
                } header: {
                    Text("作り方")
                }
                
                Section {
                    //Image("kasiore")
                    //SelectPhoto(photoData: $photoData)
                } header: {
                    Text("完成イメージ")
                }
            }
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        let newMenu = DrinkMenu(context: moc)
                        newMenu.id = UUID()
                        newMenu.isAlcoholic = isAlcoholic
                        newMenu.name = name
                        newMenu.recipe = recipe

                        try? moc.save()
                        //dismiss()
                        isPresentiongNewMenuView = false
                    } label: {
                        Text("Save")
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button {
                        isPresentiongNewMenuView = false
                    } label: {
                        Text("Cancel")
                    }
                }

            }
        }
    }
}
