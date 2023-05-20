//
//  MenuRow.swift
//  Drink Handy
//  
//  Created by umas on 2023/04/30
//  
//

import SwiftUI
import CoreData

struct MenuRow: View {
    //@Binding var menu: Menu
    
    //var drinkmenu: DrinkMenu
    @ObservedObject var menuViewModel: MenuViewModel
    @ObservedObject var menu: DrinkMenu
    var body: some View {
        HStack {
            if menu.isAlcoholic {
            //if drinkmenu.isAlcoholic {
                Text("酒")
                    .font(.title)
                    .foregroundColor(.orange)
            } else {
                Text("無")
                    .font(.title)
                    .foregroundColor(.cyan)
            }
            Spacer()
            //Text(menu.name)
            Text(menu.wrappedname)
            Spacer()
        }
    }
}

//struct MenuRow_Previews: PreviewProvider {
//    static var previews: some View {
//        MenuRow(menu: .constant(Menu.sampleData[0]))
//            .fixedSize()
//            .previewLayout(.fixed(width: 400, height: 50))
//    }
//}
