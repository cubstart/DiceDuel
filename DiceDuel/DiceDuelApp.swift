//
//  DiceDuelApp.swift
//  DiceDuel
//
//  Created by Justin Wong on 10/22/25.
//

import SwiftUI

@main
struct DiceDuelApp: App {
    @State private var viewModel = GameViewModel()
    
    var body: some Scene {
        WindowGroup {
            StartGameView()
                .environment(viewModel)
        }
    }
}
