//
//  Photo.swift
//  Drink Handy
//  
//  Created by umas on 2023/04/30
//  
//

import Foundation

struct Photo: Identifiable {
    let id: String?//UUIDにした方がいい？
    let item: Any//data: Data → image: UIImageにするのが良さそう？//https://www.youtube.com/watch?v=crULPMS7Uxs
}
