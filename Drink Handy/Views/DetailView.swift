//
//  DetailView.swift
//  Drink Handy
//  
//  Created by umas on 2023/04/29
//  
//

import SwiftUI
import PhotosUI

struct DetailView: View {
    @Binding var menu: Menu
    @State private var editingMenu = Menu.emptyMenu
    @State private var isPresentingEditView = false
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("完成図")
                    .font(.headline)
                Image("kasiore")
                Divider()
                Text("作り方")
                    .font(.headline)
                Text(menu.recipe)
                Spacer()
            }
            .padding()
            .toolbar {
                Button("Edit") {
                    editingMenu = menu
                    isPresentingEditView = true
                }
            }
            .sheet(isPresented: $isPresentingEditView) {
                NavigationStack{
                    EditView(menu: $editingMenu)
                        .navigationTitle(menu.name)
                        .toolbar {
                            ToolbarItem(placement: .cancellationAction) {
                                Button("Cancel") {
                                    isPresentingEditView = false
                                }
                            }
                            ToolbarItem(placement: .confirmationAction) {
                                Button("Done") {
                                    isPresentingEditView = false
                                    menu = editingMenu
                                }
                            }
                        }
                    
                }
            }
        }
    }
    
    struct DetailView_Previews: PreviewProvider {
        static var previews: some View {
            DetailView(menu: .constant(Menu.sampleData[0]))
        }
    }
}
