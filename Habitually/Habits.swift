//
//  Habits.swift
//  Habitually
//
//  Created by Sankarshana V on 2022/02/03.
//

import Foundation

class Habits: ObservableObject {
    @Published private(set) var habits = [Habit]() {
        didSet {
            if let encodedData = try? JSONEncoder().encode(habits) {
                UserDefaults.standard.set(encodedData, forKey: "Habits")
            }
        }
    }
    
    init() {
        if let data = UserDefaults.standard.data(forKey: "Habits") {
            if let decodedHabits = try? JSONDecoder().decode([Habit].self, from: data) {
                habits = decodedHabits
                return
            }
        }
        
        habits = []
    }
    
    func indexOf(_ habit: Habit) -> Int? { habits.firstIndex { $0.id == habit.id } }
    
    
    // MARK: - Intent(s)
    
    func replace(_ habit: Habit) {
        if let index = indexOf(habit) {
            habits[index] = habit
        }
    }
    
    func changeDescription(_ desc: String, of habit: Habit) {
        if let index = indexOf(habit) {
            habits[index].description = desc
        }
    }
    
    func changeTitle(_ title: String, of habit: Habit) {
        if let index = indexOf(habit) {
            habits[index].title = title
        }
    }
    
    func changeType(of habit: Habit, to type: HabitType) {
        if let index = indexOf(habit) {
            habits[index].habitType = type
        }
    }
    
    func changeTimePerformed(_ time: Double, of habit: Habit) {
        if let index = indexOf(habit) {
            habits[index].timePerformed = time
        }
    }
    
    func changeDays(_ days: Int, of habit: Habit) {
        if let index = indexOf(habit) {
            habits[index].daysCompleted = days
        }
    }
    
    func add(_ habit: Habit) { habits.append(habit) }
    
    func add(_ habitsFrom: [Habit]) { habitsFrom.forEach { habits.append($0) } }
    
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
