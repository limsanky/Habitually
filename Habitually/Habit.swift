//
//  Habit.swift
//  Habitually
//
//  Created by Sankarshana V on 2022/02/03.
//

import Foundation

struct Habit: Codable, Identifiable {
    var habitType: HabitType
    var description: String
    var timePerformed: TimeInterval
    var title: String
    var daysCompleted: Int
    var id = UUID()
    
    var investedTimeInHours: Double {
        timePerformed * Double(daysCompleted) / 60.0
    }
    
    var investedTimeInHoursInString: String {
        var retText = investedTimeInHours.formatted(.number.precision(.fractionLength(2))).description + " hr"
        if investedTimeInHours != 1 { retText += "s" }
        
        return retText
    }
    
    var daysCompletedInString: String {
        var retText = "\(daysCompleted) day"
        if daysCompleted != 1 { retText += "s" }
        
        return retText
    }
}
