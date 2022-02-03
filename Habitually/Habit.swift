//
//  Habit.swift
//  Habitually
//
//  Created by Sankarshana V on 2022/02/03.
//

import Foundation

struct Habit: Codable, Identifiable {
    let habitType: HabitType
    var description: String?
    var timePerformed: TimeInterval
    var title: String
    var daysCompleted: Int
    var id = UUID()
    
    var investedTimeInHours: Double {
        timePerformed * Double(daysCompleted) / 60.0
    }
}
