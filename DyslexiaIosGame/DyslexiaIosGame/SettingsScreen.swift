//
//  SettingsScreen.swift
//  DyslexiaIosGame
//
//  Created by Tyler Carpenter on 3/13/26.
//


import SwiftUI

struct SettingsScreen: View {

    @State var wordLength:ClosedRange<Double> = 4...8

    @State var red:Double = 128
    @State var green:Double = 128
    @State var blue:Double = 128

    var body: some View {

        VStack(spacing:20){

            Text("Word Length")

            Text("Min \(Int(wordLength.lowerBound))  Max \(Int(wordLength.upperBound))")

            Slider(value:$red,in:0...255)
            Text("Red \(Int(red))")

            Slider(value:$green,in:0...255)
            Text("Green \(Int(green))")

            Slider(value:$blue,in:0...255)
            Text("Blue \(Int(blue))")

            Rectangle()
                .fill(Color(red:red/255,
                            green:green/255,
                            blue:blue/255))
                .frame(height:40)

        }
        .padding()
    }
}
