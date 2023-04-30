//
//  NewMenuSheet.swift
//  Drink Handy
//  
//  Created by umas on 2023/04/30
//  
//

import SwiftUI

struct NewMenuSheet: View {
    @State var newMenu = Menu.emptyMenu
    @Binding var menu: [Menu]
    @Binding var isPresentingNewScrumView: Bool
    
    var body: some View {
        NavigationStack {
            EditView(menu: $newMenu)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel"){
                            isPresentingNewScrumView = false
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Add") {
                            menu.append(newMenu)
                            isPresentingNewScrumView = false
                        }
                    }
                }
        }
    }
}

struct NewMenuSheet_Previews: PreviewProvider {
    static var previews: some View {
        NewMenuSheet(newMenu: Menu.emptyMenu, menu: .constant(Menu.sampleData), isPresentingNewScrumView: .constant(true))
    }
}
