//
//  Habits.swift
//  Habitually
//
//  Created by Sankarshana V on 2022/02/03.
//

import Foundation

class Habits: ObservableObject {
    @Published private(set) var habits = [Habit]()
    
    func indexOf(_ habit: Habit) -> Int? { habits.firstIndex { $0.id == habit.id } }
    
    
    
    
    // MARK: - Intent(s)
    
    func add(_ habit: Habit) { habits.append(habit) }
    
    func remove(atOffsets: IndexSet) { habits.remove(atOffsets: atOffsets) }
    
    func remove(_ habit: Habit) -> Bool {
        if let index = indexOf(habit) {
            habits.remove(at: index)
            return true
        }
        
        return false
    }
    
    func removeAll() { habits.removeAll() }
}
