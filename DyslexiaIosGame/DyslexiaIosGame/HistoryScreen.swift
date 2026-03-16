//
//  HistoryScreen.swift
//  DyslexiaIosGame
//
//  Created by Tyler Carpenter on 3/13/26.
//


import SwiftUI

struct HistoryScreen: View {

    @ObservedObject var viewModel: AppViewModel

    var body: some View {

        VStack{

            HStack{

                Button("Word"){
                    viewModel.sortByWord()
                }

                Button("Points"){
                    viewModel.sortByPoints()
                }

                Button("Moves"){
                    viewModel.sortByMoves()
                }

                Button("Time"){
                    viewModel.sortBySeconds()
                }

            }

            ScrollView{

                LazyVStack{

                    ForEach(viewModel.gameHistory){ record in

                        NavigationLink{

                            DetailScreen(viewModel:viewModel,
                                                record:record)

                        } label:{

                            VStack(alignment:.leading){

                                Text("Word: \(record.word)")
                                Text("Points: \(record.points)")
                                Text("Moves: \(record.moves)")
                                Text("Time: \(record.seconds)s")

                            }
                            .padding()
                            .frame(maxWidth:.infinity,alignment:.leading)
                            .background(Color.green.opacity(0.2))
                            .cornerRadius(10)

                        }

                    }

                }

            }

        }
        .padding()
    }
}
