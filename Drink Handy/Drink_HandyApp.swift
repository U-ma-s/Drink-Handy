//
//  Drink_HandyApp.swift
//  Drink Handy
//  
//  Created by umas on 2023/04/28
//  
//

import SwiftUI

@main
struct Drink_HandyApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView(menus: Menu.sampleData, addaction: {})
        }
    }
}
