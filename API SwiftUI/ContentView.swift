//
//  ContentView.swift
//  API SwiftUI
//
//  Created by Chingiz on 27.04.2024.
//

import SwiftUI

struct ContentView: View {
    
    let alamoFireManager = AlamofireNetworkManager.shared
    
    @State private var results = "" 
    
    var body: some View {
        
        VStack {
            
            Image("icons")
                .padding(.top, 150)
            
            Text("Информация о биткоине")
                .foregroundColor(.blue)
                .padding(.bottom, 450)
            
            Text(results)
                .font(.title)
            
            Button(action: {
                alamoFireManager.getBtcElement { btcElement in
                    if let btcElement = btcElement {
                        self.results = "\(btcElement.marketCapUsd)\n\(btcElement.volumeUsd24Hr)"
                    }
                }
            }) {
                Text("Получить информацию о биткоине")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
