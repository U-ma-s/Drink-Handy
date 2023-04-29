//
//  ContentView.swift
//  Drink Handy
//  
//  Created by umas on 2023/04/28
//  
//

import SwiftUI

struct ContentView: View {
    var menus: [Menu]
    let addaction: () -> Void
    @State private var selection: Tab = .list
    enum Tab {
        case card
        case list
    }
    
    var body: some View {
        TabView(selection: $selection) {
            MenuListView(menus: menus, addaction: {})
                .tabItem {
                    Label("List" , systemImage: "list.bullet")
                }
                .tag(Tab.list)
            Text("card")
                .tabItem {
                    Label("card", systemImage: "square")
                }
                .tag(Tab.card)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(menus: Menu.sampleData, addaction: {})
    }
}
