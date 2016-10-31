//
//  SortingStuff.swift
//  ClosuresAreGreat
//
//  Created by Ron Don Volante on 10/25/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation


struct ToyBin {
    
    var ships: [Ship] = []
    var books: [Book] = []
    var bowlingPins: [BowlingPin] = []
    var musicCDs: [MusicCD] = []
    
    
    func sortShops(sorted by: () -> ()) -> [Ship] {
        
        var shipsSorted = ships.sorted { (age1: Ship, age2: Ship) -> Bool in
            return age1.age > age2.age
        }
            return shipsSorted
    }
    
    
    mutating func sortBooks(sorted by: () -> ()) -> [Book] {
        
        books = books.sorted { $0.name < $1.name }
            return books
        }
    
    
    mutating func sortBowlingPins(sorted by: () -> ()) -> [BowlingPin] {
        
        bowlingPins = bowlingPins.sorted { $0.color.rawValue < $1.color.rawValue }
            return bowlingPins
    }
    
    
    mutating func sortMusicCDs(sorted by: () -> ()) -> [MusicCD] {
        
        var emptyMusic = [MusicCD]()
        for (index,musicCd) in self.musicCDs.enumerated(){
            if musicCd.name == "Drake"{
                emptyMusic.append(musicCd)
                self.musicCDs.remove(at: index)
            }
        }
        emptyMusic += self.musicCDs.sorted{ (cd1: MusicCD, cd2: MusicCD) -> Bool in
            return cd1.name < cd2.name
        }
        
        return emptyMusic
    }
    
    
    mutating func changeColorOfAllPins(to color: Color) {
        
        bowlingPins = bowlingPins.map { $0.changeColor(color) }
        
    }
}
    




struct Ship {
    var name: String
    var age: Int
}


struct Book {
    var name: String
    var year: Int
    var author: String
}


struct BowlingPin {
    var name: String
    var film: String
    var color: Color
}


extension BowlingPin {
    mutating func changeColor(to color: Color) {
        self.color = color
    }
}


enum Color: Int {
    case red, organe, yellow, green, blue, indigo, violet
}

struct MusicCD {
    var name: String
    var year: Int
    var songs: [String]
}
