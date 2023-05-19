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
//                if menu.photo != nil{
//                    Image(uiImage: menu.photo!)
//                if drinkmenu.photo != nil{
//                    Image(uiImage: drinkmenu.photo!)
//                        .resizable()
//                        .scaledToFit()
//                } else {
//                    //Image("kasiore")
//                    Image(systemName: "photo")
//                        .resizable()
//                        .scaledToFit()
//                        .foregroundColor(.gray)
//                        .overlay {
//                            Text("完成品の写真を表示可能")
//                                .bold()
//                        }
//                }
                Divider()
                Spacer()
            }
            .padding()
//            .toolbar {
//                Button("Edit") {
//                    editingMenu = menu
//                    isPresentingEditView = true
//                }
//            }
//            .sheet(isPresented: $isPresentingEditView) {
//                NavigationStack{
//                    EditView(menu: $editingMenu)
//                        .navigationTitle(menu.name)
//                        .toolbar {
//                            ToolbarItem(placement: .cancellationAction) {
//                                Button("Cancel") {
//                                    isPresentingEditView = false
//                                }
//                            }
//                            ToolbarItem(placement: .confirmationAction) {
//                                Button("Done") {
//                                    isPresentingEditView = false
//                                    menu = editingMenu
//                                }
//                            }
//                        }
//
//                }
//            }
        }
    }
    
//    struct DetailView_Previews: PreviewProvider {
//        static var previews: some View {
//            DetailView(menu: .constant(Menu.sampleData[0]))
//        }
//    }
}
