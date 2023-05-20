//
//  ContentView.swift
//  Drink Handy
//  
//  Created by umas on 2023/04/28
//  
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State var isPresentingNewMenuView = false
    
    @StateObject private var menuViewModel = MenuViewModel()
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.name)
    ]) var drinkmenus: FetchedResults<DrinkMenu>
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(drinkmenus) { drinkmenu in
                    NavigationLink(destination: DetailView(menuViewModel: menuViewModel, drinkmenu: drinkmenu)) {
                        MenuRow(menuViewModel: menuViewModel, menu: drinkmenu)
                    }
                }
                .onDelete(perform: deleteMenu)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action: {
                        isPresentingNewMenuView = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
            }
            .sheet(isPresented: $isPresentingNewMenuView) {
                NewMenuSheet(isPresentiongNewMenuView: $isPresentingNewMenuView, menuViewModel: menuViewModel)
            }
        }
    }
    
    func deleteMenu(at offsets: IndexSet) {
        for offset in offsets {
            let drinkmenu = drinkmenus[offset]
            moc.delete(drinkmenu)
        }
        try? moc.save()
    }
}
