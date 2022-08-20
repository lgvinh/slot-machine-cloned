import SwiftUI

struct LeaderBoardView: View {
    
    var globalVariables: GlobalVariables
    
    init(global: GlobalVariables) {
        self.globalVariables = global
    }
    
    // MARK: - Principal Properties
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            LogoView()
            Spacer()
            Form {
                Section(header: Text("Leader board")) {
                    List {
                        ForEach(globalVariables.leaderBoards) { leader in
                            FormRowView(
                                firstItem: leader.name,
                                secondItem: "\(leader.score)"
                            )
                        }
                    }
                }
            }
            .font(.system(.body, design: .rounded))
        }
        .padding(.top, 40)
        .overlay(
            Button(action: {
                audioPlayer?.stop()
                // Closing view
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "xmark.circle")
                    .font(.title)
            }
            .padding(.top, 30)
            .padding(.trailing, 20)
            .accentColor(Color.secondary), alignment: .topTrailing
        )
    }
}

struct LeaderBoardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderBoardView(global: GlobalVariables())
            .previewDevice("iPhone 11 Pro")
    }
}
