//
//  ContentView.swift
//  NetworkAPICalls
//
//  Created by Sergey Lukaschuk on 2023-05-31.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack (spacing: 20){
            Circle()
                .foregroundColor(.secondary)
                .frame(width: 120, height: 120)
            
            Text("User Name")
                .bold()
                .font(.title3)
            
            Text("Bio")
                .font(.footnote)
            
            Spacer()
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
