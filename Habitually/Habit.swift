//
//  Habit.swift
//  Habitually
//
//  Created by Sankarshana V on 2022/02/03.
//

import Foundation

struct Habit: Codable, Identifiable {
    let habitType: HabitType
    var timePerformed: TimeInterval
    var description: String?
    var title: String
    var daysCompleted: Int
    var id = UUID()
}
