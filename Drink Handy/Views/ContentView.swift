
import SwiftUI
import CoreData

struct ContentView: View {
    @State var isPresentingNewMenuView = false
    
    @StateObject private var menuViewModel = MenuViewModel()
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [
        //SortDescriptor(\.name)
        NSSortDescriptor(key: "name", ascending: true)
    ]) var drinkmenus: FetchedResults<DrinkMenu>
    
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(drinkmenus) { drinkmenu in
                    NavigationLink(destination: DetailView(menuViewModel: menuViewModel, drinkmenu: drinkmenu)) {
                        MenuRow(menuViewModel: menuViewModel, menu: drinkmenu)
                    }
                }
                .onDelete(perform: deleteMenu)
            }
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "名前で検索")
            .onChange(of: searchText) { newValue in
                search(text: newValue)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action: {
                        isPresentingNewMenuView = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        print("tapped")
                    } label: {
                        Image(systemName: "magnifyingglass")
                    }

                }
            }
            .sheet(isPresented: $isPresentingNewMenuView) {
                NewMenuSheet(isPresentiongNewMenuView: $isPresentingNewMenuView, menuViewModel: menuViewModel)
            }
        }
    }
    
    func deleteMenu(at offsets: IndexSet) {
        for offset in offsets {
            let drinkmenu = drinkmenus[offset]
            moc.delete(drinkmenu)
        }
        try? moc.save()
    }
    
    private func search(text: String) {
        if text.isEmpty {
            drinkmenus.nsPredicate = nil
        } else {
            let namePredicate: NSPredicate = NSPredicate(format: "name contains %@", text)
            drinkmenus.nsPredicate = NSCompoundPredicate(orPredicateWithSubpredicates: [namePredicate])
        }
    }
}
