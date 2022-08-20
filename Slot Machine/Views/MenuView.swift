//
//  MenuView.swift
//  Slot Machine
//
//  Created by Vinh Lâm on 20/08/2022.
//

import SwiftUI

@available(iOS 15.0, *)
struct MenuView: View {

    @State var isShowContentView = false
    
    @State var isShowHowToPlayView = false

    @State var isShowLeaderBoardView = false

    var globalVariables: GlobalVariables
    
    init(global: GlobalVariables) {
        self.globalVariables = global
    }

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
                    Spacer()

                    // MARK: - Play Button
                    Button(action: {
                        self.isShowContentView = true
                    }) {
                        VStack {
                            Text("Click to play")
                                .bold()
                                .scoreNumberStyle()
                                .modifier(ScoreNumberModifier())
                        }

                        NavigationLink(
                            destination: ContentView(global: self.globalVariables),
                            isActive: $isShowContentView
                        ) {
                            EmptyView()
                        }
                    }

                    // MARK: - LeaderBoard Button
                    Button(action: {
                        self.isShowLeaderBoardView = true
                    }) {
                        VStack {
                            Text("Leader board")
                                .bold()
                                .scoreNumberStyle()
                                .modifier(ScoreNumberModifier())
                                .padding(.top)
                        }

                        NavigationLink(
                            destination: LeaderBoardView(global: self.globalVariables),
                            isActive: $isShowLeaderBoardView
                        ) {
                            EmptyView()
                        }
                    }

                    // MARK: - How to play Button
                    Button(action: {
                        self.isShowHowToPlayView = true
                    }) {
                        VStack {
                            Text("How to play?")
                                .bold()
                                .scoreNumberStyle()
                                .modifier(ScoreNumberModifier())
                                .padding(.top)
                        }

                        NavigationLink(
                            destination: HowToPlayView(),
                            isActive: $isShowHowToPlayView
                        ) {
                            EmptyView()
                        }
                    }

                    Spacer()
                }
            }
        }
    }
}

@available(iOS 15.0, *)
struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(global: GlobalVariables())
    }
}
