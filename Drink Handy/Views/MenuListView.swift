////
////  MenuListView.swift
////  Drink Handy
////  
////  Created by umas on 2023/04/29
////  
////
//
//import SwiftUI
//
//struct MenuListView: View {
//    @State var menus: [Menu]
//    let addaction: () -> Void
//    var body: some View {
//        NavigationStack {
//            List($menus) { $menu in
//                NavigationLink(destination: DetailView(menu: $menu)) {
//                    MenuRow(menu: $menu)
//                }
//                .navigationTitle("Menus")
//            }
//        }
//    }
//}
//
//struct MenuListView_Previews: PreviewProvider {
//    static var previews: some View {
//        MenuListView(menus: Menu.sampleData, addaction: {})
//    }
//}
