//
//  HowToPlayView.swift
//  Slot Machine
//
//  Created by Vinh Lâm on 20/08/2022.
//  Copyright © 2022 Daniel Vázquez. All rights reserved.
//

import SwiftUI

struct HowToPlayView: View {
    
    @State private var isActiveBet20: Bool = true
    @State private var isActiveBet10: Bool = false

    var body: some View {
        NavigationView {
            ZStack {
                // MARK: - Background
                LinearGradient(
                    gradient: Gradient(colors: [Color("ColorPink"), Color("ColorPurple")]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    LogoView()
                    Text("How to play")
                        .scoreNumberStyle()
                        .modifier(ScoreNumberModifier())
                    Spacer()
                    
                    
                    ScrollView {
                        Spacer(minLength: 120)
                        
                        Text("1. You will start at 100 points")
                            .scoreNumberStyle()
                            .modifier(ScoreNumberModifier())
                        HStack {
                            Text("Your\ncoins")
                            
                            Text("100")
                                .scoreNumberStyle()
                                .modifier(ScoreNumberModifier())
                        }
                            // Adding reuzable code
                            .modifier(ScoreContainerModifier())
                        

                        Spacer(minLength: 100)


                        Text("2. Place the bet")
                            .scoreNumberStyle()
                            .modifier(ScoreNumberModifier())
                        // MARK: - Footer
                        Spacer(minLength: 50)
                        HStack {
                            // MARK: - BET 20
                            HStack(alignment: .center
                            , spacing: 10) {
                                Button(action: {
                                    
                                }) {
                                    Text("20")
                                        .fontWeight(.heavy)
                                        .foregroundColor(isActiveBet20 ? Color("ColorYellow") : Color.white)
                                        .modifier(BetNumberModifier())
                                }
                                    // Adding aspect modifier
                                    .modifier(BetCapsuleModifier())
                                    .animation(nil)
                                
                                Image("gfx-casino-chips")
                                    .resizable()
                                    .offset(x: isActiveBet20 ? 0 : 20)
                                    .opacity(isActiveBet20 ? 1 : 0)
                                    .modifier(CasinoChipsModifier())
                            }
                            
                            Spacer()
                            
                            // MARK: - BET 10
                            HStack(alignment: .center
                            , spacing: 10) {
                                Image("gfx-casino-chips")
                                    .resizable()
                                    .offset(x: isActiveBet10 ? 0 : -20)
                                    .opacity(isActiveBet10 ? 1 : 0)
                                    .modifier(CasinoChipsModifier())
                                // Second Button
                                Button(action: {
                                    
                                }) {
                                    Text("10")
                                        .fontWeight(.heavy)
                                        .foregroundColor(isActiveBet10 ? Color("ColorYellow") : Color.white)
                                        .modifier(BetNumberModifier())
                                }
                                    // Adding aspect modifier
                                    .modifier(BetCapsuleModifier())
                                    .animation(nil)
                            }
                        }

                        Spacer(minLength: 100)

                        Text("3. Click spin to play")
                            .scoreNumberStyle()
                            .modifier(ScoreNumberModifier())
                        Image("gfx-spin")
                            .renderingMode(.original)
                            .resizable()
                            .modifier(ImageModifier())
                    }

                    Spacer()
                }
            }
        }
    }
}

struct HowToPlayView_Previews: PreviewProvider {
    static var previews: some View {
        HowToPlayView()
    }
}
