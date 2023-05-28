
import SwiftUI


struct EditView: View {
    
    @Binding var isPresentiongEditView: Bool
    @Environment(\.managedObjectContext) var moc
    @ObservedObject var menuViewModel: MenuViewModel
    @Binding var currentImage: Data
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("メニュー名", text: $menuViewModel.name)
                    Toggle("アルコール", isOn: $menuViewModel.isAlcoholic)
                } header: {
                    Text("メニュー情報")
                }
                Section {
                    TextField("作り方", text: $menuViewModel.recipe, axis: .vertical)
                } header: {
                    Text("作り方")
                }
            
                Section {
                    SelectPhoto(imageData: $currentImage)
                } header: {
                    Text("完成イメージ")
                }
            }
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        menuViewModel.writeData(moc: moc)
                        isPresentiongEditView = false
                    } label: {
                        Text("Save")
                    }
                    .disabled(menuViewModel.name == "")///"name"が空欄のときはsaveボタン無効化
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button {
                        /// 値の初期化
                        menuViewModel.name = ""
                        menuViewModel.isAlcoholic = true
                        menuViewModel.recipe = ""
                        //menuViewModel.photoData = Data.init(capacity: 0)
                        /// モーダルの解除
                        isPresentiongEditView = false
                    } label: {
                        Text("Cancel")
                    }
                }
            }
            
        }
    }
}
