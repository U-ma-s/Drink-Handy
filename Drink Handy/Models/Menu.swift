//
//  Menu.swift
//  Drink Handy
//  
//  Created by umas on 2023/04/28
//  
//

import Foundation
import SwiftUI

struct Menu: Identifiable {
    let id: UUID
    var name: String
    var isAlcoholic: Bool
    var recipe: String
    //var photo: Data?
    var photo: UIImage?
    
    init(id: UUID = UUID(), name: String, isAlcoholic: Bool, recipe: String, photo: UIImage?) {
        self.id = id
        self.name = name
        self.isAlcoholic = isAlcoholic
        self.recipe = recipe
        self.photo = photo
    }
}

//MARK: - New Menu
extension Menu {
    static var emptyMenu: Menu {
        Menu(name: "", isAlcoholic: true, recipe: "", photo: nil)
    }
}

//MARK: - Sample Data
extension Menu {
    static let sampleData:[Menu] = [
        Menu(name: "カシスオレンジ", isAlcoholic: true, recipe: "1. カシスシロップを50ml入れる\n2. オレンジジュースを200ml入れる\n3. オレンジを1カット添える", photo: nil),
        Menu(name: "カルピス", isAlcoholic: false, recipe: "1. カルピスの原液を30ml入れる\n2.水を150ml入れる", photo: nil),
        Menu(name: "山崎ハイボール", isAlcoholic: true, recipe: "1. 山崎ウイスキーを20ml入れる\n2. 炭酸水を200ml入れる", photo: nil)
    ]
}
