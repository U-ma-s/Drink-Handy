//
//  ContentView.swift
//  Drink Handy
//  
//  Created by umas on 2023/04/28
//  
//

import SwiftUI

struct ContentView: View {
//    @Environment(\.managedObjectContext) private var viewContext
//    @StateObject private var menuModel = MenuModel()
//
//    @FetchRequest(entity: DrinkMenu.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \DrinkMenu.name, ascending: false)], animation: .default)
//    private var menus: FetchedResults<DrinkMenu>
    
    @State var menus: [Menu]
    let addaction: () -> Void
    
    @State var isPresentingNewMenuView = false
    
    var body: some View {
        NavigationStack {
            List($menus) { $menu in
                NavigationLink(destination: DetailView(menu: $menu)) {
                    MenuRow(menu: $menu)
                }
                .navigationTitle("Menus")
            }
            .toolbar {
                Button(action: {
                    isPresentingNewMenuView = true
                }) {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $isPresentingNewMenuView) {
                NewMenuSheet(menu: $menus, isPresentingNewScrumView: $isPresentingNewMenuView)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(menus: Menu.sampleData, addaction: {})
    }
}
