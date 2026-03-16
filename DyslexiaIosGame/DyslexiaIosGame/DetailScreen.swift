//
//  DetailScreen.swift
//  DyslexiaIosGame
//
//  Created by Tyler Carpenter on 3/13/26.
//

import Foundation
import SwiftUI

struct DetailScreen: View {

    @ObservedObject var viewModel: AppViewModel
    let record: AppViewModel.WordRecord

    var body: some View {

        VStack(spacing:20){

            Text("Word: \(record.word)")
            Text("Points: \(record.points)")
            Text("Moves: \(record.moves)")
            Text("Time: \(record.seconds) seconds")

            Spacer()

        }
        .padding()
    }
}
