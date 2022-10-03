//
//  ContentView.swift
//  RGBullsEye
//
//  Created by Tiago Silva on 29/09/2022.
//

import SwiftUI

struct ContentView: View {
    @State var guess: RGB
    @State private var game = Game()
    @State private var showScore: Bool = false
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Color.element
                    .ignoresSafeArea()
                VStack {
                    ColorCircle(color: game.target, size: proxy.size.height * Constants.Sizes.circleSize)

                    scoreText(in: proxy)
                        .bold()
                        .lineLimit(0)

                    ColorCircle(color: guess, size: proxy.size.height * Constants.Sizes.circleSize)

                    BevelText(text: guess.asString, width: proxy.size.width * Constants.Sizes.labelWidth,
                              height: proxy.size.height * Constants.Sizes.labelHeight)
                        .padding()

                    ColorSlider(value: $guess.red, trackColor: .red)
                    ColorSlider(value: $guess.green, trackColor: .green)
                    ColorSlider(value: $guess.blue, trackColor: .blue)

                    hitButton(in: proxy)
                }
                .font(.headline)
            }
        }
    }
    
    private func scoreText(in proxy: GeometryProxy) -> some View {
        if !showScore {
            return BevelText(text: Constants.ScoreText.text,
                             width: proxy.size.width * Constants.Sizes.labelWidth,
                             height: proxy.size.height * Constants.Sizes.labelHeight)
                .padding()
        } else {
            return BevelText(text: game.target.asString,
                             width: proxy.size.width * Constants.Sizes.labelWidth,
                             height: proxy.size.height * Constants.Sizes.labelHeight)
                .padding()
        }
    }
    
    private func hitButton(in proxy: GeometryProxy) -> some View {
        Button(Constants.HitButton.title) {
            showScore = true
            game.check(guess: guess)
        }.alert(isPresented: $showScore) {
            Alert(title: Text(Constants.HitButton.alertTitle),
                  message: Text(String(game.scoreRound)),
                  dismissButton: .default(Text(Constants.HitButton.alertButtonTitle)) {
                game.startNewRound()
                guess = RGB()
            })
        }
        .buttonStyle(NeuButtonStyle(width: proxy.size.width * Constants.Sizes.buttonWidth,
                                    height: proxy.size.height * Constants.Sizes.labelHeight))
    }
}

private extension ContentView {
    enum Constants {
        enum Sizes {
            static let circleSize: CGFloat = 0.275
            static let labelHeight: CGFloat = 0.06
            static let labelWidth: CGFloat = 0.53
            static let buttonWidth: CGFloat = 0.87
        }
        
        enum ScoreText {
            static let text: String = "R: ??? G: ??? B: ???"
        }
        
        enum HitButton {
            static let title: String = "Hit Me!"
            static let alertTitle: String = "Your Score"
            static let alertButtonTitle: String = "OK"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(guess: .init(red: 0.8, green: 0.3, blue: 0.7))
    }
}
