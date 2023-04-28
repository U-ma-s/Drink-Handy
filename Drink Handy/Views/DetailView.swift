//
//  DetailView.swift
//  Drink Handy
//  
//  Created by umas on 2023/04/29
//  
//

import SwiftUI

struct DetailView: View {
    var menu: Menu
    
    var body: some View {
        
        VStack {
            Section{
                Text("作り方")
                    .font(.headline)
                Text(menu.recipe)
                    .multilineTextAlignment(.leading)
            }
            Section {
                Text("完成形")
                    .font(.headline)
                Text("ここに画像が入る")
            }
        }
        .padding()
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(menu: Menu.sampleData[0])
    }
}
