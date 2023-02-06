//
//  ContentDetailView.swift
//  xCode-Cloud
//
//  Created by Emre GURSES on 6.02.2023.
//

import SwiftUI

struct ContentDetailView: View {
    let name: String
    var body: some View {
        Text("Selected item: \(name)")
            .font(.largeTitle)
    }
}

struct ContentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetailView(name: "")
    }
}
