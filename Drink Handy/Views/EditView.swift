//
//  EditView.swift
//  Drink Handy
//  
//  Created by umas on 2023/04/30
//  
//

import SwiftUI

struct EditView: View {
    
    @Binding var menu: Menu
    var body: some View {
        Form {
            Section {
                TextField("メニュー名", text: $menu.name)
                Toggle("アルコール", isOn: $menu.isAlcoholic)//プルダウンとかの方がわかりやすいかな？
            } header: {
                Text("メニュー情報")
            }
            Section {
                TextField("作り方", text: $menu.recipe, axis: .vertical)
            } header: {
                Text("作り方")
            }
            
            Section {
                //Image("kasiore")
                SelectPhoto(menu: $menu)
            } header: {
                Text("完成イメージ")
            }


        }
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView(menu: .constant(Menu.sampleData[0]))
    }
}
