//
//  GlobalVariables.swift
//  Slot Machine
//
//  Created by Vinh Lâm on 20/08/2022.
//

import Foundation

struct Leader: Identifiable {
    var id: String
    
    var name: String
    var score: Int
    
    init(name: String, score: Int) {
        self.id = "\(name)-\(score)"
        self.name = name;
        self.score = score;
    }
}

class GlobalVariables: ObservableObject {
    @Published var leaderBoards: [Leader]
    
    init() {
        self.leaderBoards = [];
    }
    
    func addNewLeader(leader: Leader) {
        self.leaderBoards.append(leader)
        
        self.leaderBoards = self.leaderBoards.sorted(by: { $0.score > $1.score })
    }
}
