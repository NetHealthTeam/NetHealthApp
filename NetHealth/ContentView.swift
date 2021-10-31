//
//  ContentView.swift
//  NetHealth
//
//  Created by Anday on 16.10.21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Welcome()
                .navigationTitle("Welcome")
                .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
