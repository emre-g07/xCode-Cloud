//
//  ContentView.swift
//  xCode-Cloud
//
//  Created by Emre GURSES on 3.02.2023.
//

import SwiftUI

struct ContentView: View {
    let dataTypesArray = ["Xcode Cloud - Prepare", "Xcode Cloud - Githup", "Xcode Cloud - Settings", "Xcode Cloud - First Build"]
    var body: some View {
        VStack {
            Image("xcode-cloud")
                .imageScale(.small)
                .foregroundColor(.blue)
            Text("Welcome, Cloud World!")
            List {
                ForEach(0..<dataTypesArray.count) { index in
                  Text(dataTypesArray[index])
                }
              }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
