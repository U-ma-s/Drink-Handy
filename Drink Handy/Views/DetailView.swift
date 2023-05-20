//
//  DetailView.swift
//  Drink Handy
//  
//  Created by umas on 2023/04/29
//  
//

import SwiftUI
import PhotosUI

struct DetailView: View {
    //@Binding var menu: Menu
    @State private var editingMenu = Menu.emptyMenu
    @State private var isPresentingEditView = false
    @Environment(\.managedObjectContext) var moc
    @ObservedObject var menuViewModel: MenuViewModel
    var drinkmenu: DrinkMenu
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("作り方")
                    .font(.headline)
                    .padding(.bottom)
                //Text(menu.recipe)
                Text(drinkmenu.wrappedRecipe)

                Divider()
                Text("完成図")
                    .font(.headline)
                Image(uiImage: ((UIImage(data: drinkmenu.wrappedphotoData) ?? UIImage(systemName: "photo")) ?? UIImage(systemName: "photo"))!)
                    .resizable()
                    .scaledToFit()
                Divider()
                Spacer()
            }
            .padding()
        }
    }
}
