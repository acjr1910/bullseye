//
//  ContentView.swift
//  Bullseye
//
//  Created by Agnaldo Junior on 22/11/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isAlertVisible: Bool = false
    
    @State private var sliderValue: Double = 50.0
    
    @State private var game: Game = Game()
    
    var body: some View {
        VStack {
            Text("🎯🎯🎯\nPUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
                .bold()
                .kerning(2.0)
                .multilineTextAlignment(.center)
                .lineSpacing(4.0)
                .font(.footnote)
            Text(String(game.target))
                .kerning(-1.0)
                .fontWeight(.black)
                .font(.largeTitle)
            HStack {
                Text("1")
                    .bold()
                Slider(value: self.$sliderValue, in: 1.0...100.0)
                Text("100")
                    .bold()
            }
            Button("Hit me") {
                self.isAlertVisible = true;
            }
            .alert("Hello there!", isPresented: $isAlertVisible) {
                Button("Awesome!") {}
            } message: {
                let roundedValue: Int = Int(self.sliderValue)
                Text("The slider's value is \(roundedValue).\n" + "You scored \(self.game.points(sliderValue: roundedValue)) points this round")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .previewLayout(.fixed(width: 668, height: 320))
    }
}
