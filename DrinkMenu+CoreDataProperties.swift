//
//  DrinkMenu+CoreDataProperties.swift
//  Drink Handy
//  
//  Created by umas on 2023/04/30
//  
//
//

import Foundation
import CoreData


extension DrinkMenu {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DrinkMenu> {
        return NSFetchRequest<DrinkMenu>(entityName: "DrinkMenu")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var isAlcoholic: Bool
    @NSManaged public var photoData: Data?
    @NSManaged public var recipe: String?

}

extension DrinkMenu {
    public var wrappedId: UUID { id ?? UUID()}
    public var wrappedname: String { name ?? "" }
    public var wrappedphotoData: Data {photoData ?? Data.init(capacity: 0)}
    public var wrappedRecipe: String { recipe ?? "" }
}

extension DrinkMenu : Identifiable {

}
