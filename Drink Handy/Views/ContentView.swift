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
    
    var body: some View {
        NavigationStack {
            List(menus) { menu in
                NavigationLink(destination: DetailView(menu: menu)) {
                    HStack {
                        if menu.isAlcoholic {
                                Text("酒")
                                .font(.title)
                                .foregroundColor(.orange)
                        } else {
                            Text("無")
                            .font(.title)
                            .foregroundColor(.cyan)
                        }
                        Spacer()
                        Text(menu.name)
                        Spacer()
                    }
                }
                .navigationTitle("Menus")
            }
            .toolbar {
                Button(action: {}) {
                    Image(systemName: "plus")
                }

            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(menus: Menu.sampleData, addaction: {})
    }
}
