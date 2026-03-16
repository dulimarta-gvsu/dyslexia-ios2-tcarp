//
//  WordScreen.swift
//  DyslexiaIosGame
//
//  Created by Tyler Carpenter on 3/13/26.
//


import SwiftUI
import Combine

struct WordScreen: View {

    @ObservedObject var viewModel: AppViewModel

    // Timer state
    @State private var secondsElapsed = 0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {

        VStack(spacing: 20) {

            // Navigation buttons
            HStack {

                NavigationLink("History") {
                    HistoryScreen(viewModel: viewModel)
                }

                NavigationLink("Settings") {
                    SettingsScreen()
                }

            }

            // New word button
            Button("New Word") {
                viewModel.selectNewWord()
                secondsElapsed = 0   // reset timer
            }
            .buttonStyle(.borderedProminent)

            // Scoreboard
            VStack {

                Text(String(format: "Time: %02d:%02d",
                            secondsElapsed/60,
                            secondsElapsed%60))
                    .font(.title2)

                Text("Moves: \(viewModel.moveCount)")
                Text("Total Score: \(viewModel.totalScore)")

            }

            Spacer()

            // Letter drag area
            LetterGroup(letters: $viewModel.letters) { newArr in
                viewModel.rearrange(to: newArr)
            }

            Spacer()

        }
        .padding()

        // Timer update
        .onReceive(timer) { _ in
            secondsElapsed += 1
        }
    }
}
