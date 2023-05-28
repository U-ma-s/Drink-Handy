import SwiftUI

struct NewMenuSheet: View {
    @Binding var isPresentiongNewMenuView: Bool
    @Environment(\.managedObjectContext) var moc
    
    @ObservedObject var menuViewModel: MenuViewModel
    @State private var imageData: Data = Data.init()
    
    var body: some View {
        NavigationStack{
            Form {
                Section {
                    TextField("メニュー名(必須)", text: $menuViewModel.name)
                    Toggle("アルコール", isOn: $menuViewModel.isAlcoholic)
                } header: {
                    Text("基本情報")
                }
                Section {
                    TextField("作り方", text: $menuViewModel.recipe, axis: .vertical)
                } header: {
                    Text("作り方")
                }
                Section {
                    SelectPhoto(imageData: $imageData)
                } header: {
                    Text("完成イメージ（必須）")
                }
            }
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        menuViewModel.photoData = imageData
                        menuViewModel.writeData(moc: moc)
                        
                        isPresentiongNewMenuView = false
                    } label: {
                        Text("Save")
                    }
                    .disabled(menuViewModel.name == "")
                    .disabled(imageData.count == 0)
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button {
                        /// 値の初期化
                        menuViewModel.name = ""
                        menuViewModel.isAlcoholic = true
                        menuViewModel.recipe = ""
                        menuViewModel.photoData = Data.init(capacity: 0)
                        /// モーダルの解除
                        isPresentiongNewMenuView = false
                    } label: {
                        Text("Cancel")
                    }
                }

            }
        }
    }
}
