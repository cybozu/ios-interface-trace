//
//  ContentView.swift
//  ios-interface-trace
//
//  Created by ky0me22 on 2022/02/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                NavigationLink(destination: FloatingActionButton()) {
                    Text("- Floating Action Button")
                        .font(.title2)
                }
                Spacer()
            }
            .navigationTitle("Select Item")
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding(20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
