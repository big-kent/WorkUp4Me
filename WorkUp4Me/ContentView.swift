//
//  ContentView.swift
//  WorkUp4Me
//
//  Created by Khang Lu Minh on 19/09/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var currentShowingView: String = ""
    var body: some View {
        WelcomeView(currentShowingView: $currentShowingView)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
