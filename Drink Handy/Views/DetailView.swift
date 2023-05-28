
import SwiftUI
import PhotosUI

struct DetailView: View {
    @State private var isPresentingEditView = false
    @Environment(\.managedObjectContext) var moc
    @ObservedObject var menuViewModel: MenuViewModel
    @ObservedObject var drinkmenu: DrinkMenu
    
    var body: some View {
        ScrollView {
            NavigationStack {
                VStack(alignment: .leading) {
                    if drinkmenu.isAlcoholic {
                        Text("アルコールを含みます")
                            .font(.largeTitle)
                            .foregroundColor(.red)
                            .padding(3)
                    } else {
                        Text("ノンアルコール")
                            .font(.largeTitle)
                            .foregroundColor(.cyan)
                            .padding(3)
                    }
                    Text("作り方")
                        .font(.headline)
                        .padding(.bottom)
                    
                    Text(drinkmenu.wrappedRecipe)
                    
                    Divider()
                    Text("完成図")
                        .font(.headline)
                    //Image(uiImage: ((UIImage(data: drinkmenu.wrappedphotoData) ?? UIImage(systemName: "photo")))!)
                    Image(uiImage: UIImage(data: drinkmenu.wrappedphotoData)!)
                        .resizable()
                        .scaledToFit()
                    Divider()
                    Spacer()
                }
                .padding()
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button {
                            isPresentingEditView = true
                            menuViewModel.editItem(item: drinkmenu)
                        } label: {
                            Text("Edit")
                        }
                    }
                }
                .sheet(isPresented: $isPresentingEditView) {
                    EditView(isPresentiongEditView: $isPresentingEditView, menuViewModel: menuViewModel, currentImage: $menuViewModel.photoData)
                }
            }.navigationTitle(drinkmenu.wrappedname)
        }
    }
}
