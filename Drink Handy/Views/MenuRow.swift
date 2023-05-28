
import SwiftUI
import CoreData

struct MenuRow: View {
    @ObservedObject var menuViewModel: MenuViewModel
    @ObservedObject var menu: DrinkMenu
    var body: some View {
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
            Text(menu.wrappedname)
                .font(.title)
            Spacer()
        }
    }
}
