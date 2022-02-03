//
//  SingleHabitView.swift
//  Habitually
//
//  Created by Sankarshana V on 2022/02/03.
//

import SwiftUI

struct SingleHabitView: View {
    @State private var editMode = false
    var habit: Habit
    
    var body: some View {
        NavigationView {
            Form {
                if habit.description != "" {
                    Section("Description") {
                        Text(habit.description)
                    }
                }
                
                Section("Type") {
                    Text(String(habit.habitType.rawValue))
                }
                
                Section("Minutes Performed Per Day") {
                    Text(habit.timePerformed, format: .number)
                }
                
                Section("Days Performed") {
                    Text("\(habit.daysCompleted)")
                }
                
                Section("Total Hours invested in habit") {
                    investedTime
                }
            }
            .navigationTitle(habit.title)
            .sheet(isPresented: $editMode) {
                // Edit Habit Sheet is presented
            }
            .toolbar {
                Button("Edit") {
                    withAnimation {
                        editMode = true
                    }
                }
            }
        }
    }
    
    var investedTime: some View {
        Text("\(habit.investedTimeInHours, format: .number.precision(.fractionLength(2)))")
    }
}

struct SingleHabitView_Previews: PreviewProvider {
    static var previews: some View {
        let dummyHabits = Habits()
        
        let coding = Habit(habitType: .coding, description: "I like coding!", timePerformed: 0, title: "Coding", daysCompleted: 0)
        let gym = Habit(habitType: .exercise, description: "", timePerformed: 30, title: "Gymming", daysCompleted: 30)
        let drawing = Habit(habitType: .drawing, description: "", timePerformed: 10, title: "Drawing", daysCompleted: 15)
        let instrument = Habit(habitType: .instrument, description: "I like playing the guitar a lot!", timePerformed: 60, title: "Playing the Guitar", daysCompleted: 600)
        
        dummyHabits.add([coding, gym, instrument, drawing])
        
        return SingleHabitView(habit: dummyHabits.habits[2])
            .environmentObject(dummyHabits)
    }
}
