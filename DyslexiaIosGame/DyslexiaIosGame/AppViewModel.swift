//
//  AppViewModel.swift
//  DyslexiaIosGame
//
//  Created by Tyler Carpenter on 3/13/26.
//


import Foundation
import SwiftUI
import Combine

class AppViewModel: ObservableObject {

    struct WordRecord: Identifiable {
        let id = UUID()
        let word: String
        let points: Int
        let moves: Int
        let seconds: Int
    }


    
    
    private let letterScore: [String:Int] = [
        "A":1,"B":3,"C":3,"D":2,"E":1,"F":4,"G":2,"H":4,
        "I":1,"J":8,"K":5,"L":1,"M":3,"N":1,"O":1,"P":3,
        "Q":10,"R":1,"S":1,"T":1,"U":1,"V":4,"W":4,"X":8,
        "Y":4,"Z":10
    ]

    let wordStock = [
        "helium","oxygen","hydrogen","carbon","nitrogen",
        "neon","argon","sulfur","chlorine","fluorine",
        "bromine","iodine","phosphorus","silicon",
        "magnesium","calcium","potassium","sodium",
        "lithium","aluminum","copper","silver","gold",
        "platinum","zinc","nickel","cobalt","uranium",
        "radon","titanium","krypton"
    ]

    @Published var letters: [Letter] = []
    @Published var selectedWord: String = ""
    @Published var moveCount:Int = 0
    @Published var totalScore:Int = 0
    @Published var elapsedTime:Int = 0

    @Published var gameHistory:[WordRecord] = []
    @Published var selectedRecord:WordRecord?

    private var wordStartTime:Date = Date()

    init(){
        selectNewWord()
    }

    func selectNewWord(){

        let newWord = wordStock.randomElement()!.uppercased()
        selectedWord = newWord

        letters = newWord.map {
            Letter(
                text: String($0),
                point: letterScore[String($0)] ?? 1
            )
        }.shuffled()
        
        moveCount = 0
        elapsedTime = 0
        wordStartTime = Date()
    }

    func rearrange(to newLetters:[Letter]){
        letters = newLetters
        moveCount += 1

        if isWordSolved(){
            finishWord()
        }
    }

    private func isWordSolved()->Bool{
        let current = letters.map{$0.text}.joined()
        return current == selectedWord
    }

    private func finishWord(){

        elapsedTime = Int(Date().timeIntervalSince(wordStartTime))

        let score = letters.reduce(0){ $0 + $1.point }
        totalScore += score

        addGameRecord(word:selectedWord,
                      points:score,
                      moves:moveCount,
                      seconds:elapsedTime)
    }

    func addGameRecord(word:String,points:Int,moves:Int,seconds:Int){

        let record = WordRecord(word:word,
                                points:points,
                                moves:moves,
                                seconds:seconds)

        gameHistory.append(record)
    }

    func selectRecord(record:WordRecord){
        selectedRecord = record
    }

    func sortByWord(){
        gameHistory.sort{$0.word < $1.word}
    }

    func sortByPoints(){
        gameHistory.sort{$0.points < $1.points}
    }

    func sortByMoves(){
        gameHistory.sort{$0.moves < $1.moves}
    }

    func sortBySeconds(){
        gameHistory.sort{$0.seconds < $1.seconds}
    }
}
