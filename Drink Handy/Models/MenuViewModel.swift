//
//  MenuViewModel.swift
//  Drink Handy
//  
//  Created by umas on 2023/05/14
//  
//

import Foundation
import SwiftUI
import CoreData

class MenuViewModel: ObservableObject {
    @Published var id = UUID()
    @Published var isAlcoholic = true
    @Published var name = ""
    @Published var photoData: Data = Data.init()
    @Published var recipe = ""
    
    @Published var isNewData = false
    @Published var updateItem: DrinkMenu!//既存編集時は、とある一つのメニューを受け取る
    
    func writeData(moc: NSManagedObjectContext) {
        //既存データの編集時
        if updateItem != nil {
            updateItem.isAlcoholic = isAlcoholic
            updateItem.name = name
            updateItem.photoData = photoData
            updateItem.recipe = recipe
            
            try? moc.save()
            
            updateItem = nil
            isNewData.toggle()
            
            isAlcoholic = true
            name = ""
            photoData = Data.init()
            recipe = ""
            
            return
        } else { //新規作成時
            let newMenuData = DrinkMenu(context: moc)
            newMenuData.id = UUID()
            newMenuData.isAlcoholic = isAlcoholic
            newMenuData.name = name
            newMenuData.photoData = photoData
            newMenuData.recipe = recipe
            
            do {
                try moc.save()
                isNewData.toggle()
                isAlcoholic = true
                name = ""
                photoData = Data.init()
                recipe = ""
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    //編集の時は既存データを利用する
    func editItem(item: DrinkMenu){
        updateItem = item
        
        id = item.wrappedId
        isAlcoholic = item.isAlcoholic
        name = item.wrappedname
        photoData = item.wrappedphotoData
        recipe = item.wrappedRecipe
        
        isNewData.toggle()
    }
}
