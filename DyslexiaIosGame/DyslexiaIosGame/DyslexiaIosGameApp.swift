//
//  DyslexiaIosGameApp.swift
//  DyslexiaIosGame
//
//  Created by Tyler Carpenter on 3/13/26.
//


import SwiftUI

@main
struct DyslexiaIosGameApp: App {

    @StateObject var viewModel = AppViewModel()

    var body: some Scene {

        WindowGroup {

            NavigationStack {
                WordScreen(viewModel: viewModel)
            }

        }
    }
}
