//
//  Friend.swift
//  FriendsFavoriteMovies
//
//  Created by MacBook Air on 11/05/24.
//

import Foundation
import SwiftData

@Model
final class Friend{
    var name: String
    var favoriteMovie: Movie?
    
    init(name: String) {
        self.name = name
    }
    
    static let sampleData = [
        Friend(name: "Iqbal"),
        Friend(name: "Deva"),
        Friend(name: "Agung"),
        Friend(name: "Aris"),
        Friend(name: "Caessar")
        ]
    }

