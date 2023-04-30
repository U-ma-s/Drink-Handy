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
    var menu: Menu
    
    var body: some View {
        
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
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(menu: Menu.sampleData[0])
    }
}
