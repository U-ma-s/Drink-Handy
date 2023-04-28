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
    var body: some Scene {
        WindowGroup {
            ContentView(menus: Menu.sampleData, addaction: {})
        }
    }
}
