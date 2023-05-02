//
//  MenuModel.swift
//  Drink Handy
//  
//  Created by umas on 2023/05/02
//  
//

import Foundation
import SwiftUI
import CoreData

class MenuModel: ObservableObject {
    
    @Published var id = UUID()
    @Published var name = ""
    @Published var isAlcoholic = true
    @Published var recipe = ""
    @Published var photoData: Data = Data.init()
    
    @Published var isNewData = false
    @Published var updataItem: DrinkMenu!
    
    func writeData(context: NSManagedObjectContext){
        //既存データの編集
        if updataItem != nil {
            updataItem.name = name
            updataItem.isAlcoholic = isAlcoholic
            updataItem.recipe = recipe
            updataItem.photoData = photoData
            
            try! context.save()//セーブをtry
            //初期値に戻す
            updataItem = nil
            isNewData.toggle()
            
            name = ""
            isAlcoholic = true
            recipe = ""
            photoData = Data.init()
            
            return
        }
        
        //データ新規作成
        let newMenuData = DrinkMenu(context: context)
        newMenuData.id = UUID()
        newMenuData.name = name
        newMenuData.isAlcoholic = isAlcoholic
        newMenuData.recipe = recipe
        newMenuData.photoData = photoData
        do {
            try context.save()
            isNewData.toggle()
            name = ""
            isAlcoholic = true
            recipe = ""
            photoData = Data.init()
        } catch {
            print(error.localizedDescription)
        }
    }
    //編集時は既存のデータを利用する
    func editItem(item: DrinkMenu) {
        updataItem = item
        id = item.wrappedId
        name = item.wrappedname
        isAlcoholic = item.isAlcoholic
        recipe = item.wrappedRecipe
        photoData = item.wrappedphotoData
        
        isNewData.toggle()
    }

    
}
