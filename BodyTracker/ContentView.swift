//
//  ContentView.swift
//  BodyTracker
//
//  Created by Irtaza Fiaz on 21/11/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ARViewContainer()
            .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
