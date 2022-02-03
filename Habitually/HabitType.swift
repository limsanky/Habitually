//
//  HabitType.swift
//  Habitually
//
//  Created by Sankarshana V on 2022/02/03.
//

import Foundation

enum HabitType: String, Codable, CaseIterable, Identifiable {
    var id: Self { self }
    
    case exercise
    case reading
    case writing
    case drawing
    case watching
    case singing
    case exhibitions
    case galleries
    case instrument
    case building
    case coding
}
