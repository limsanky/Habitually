//
//  EditHabitView.swift
//  Habitually
//
//  Created by Sankarshana V on 2022/02/04.
//

import SwiftUI

struct EditHabitView: View {
    @EnvironmentObject var viewModel: Habits
    @State var habit: Habit
    
    @State private var desc = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section("Title") {
                    habitTitle
                }
                
                Section("Description") {
                    habitDesc
                }
                
                Section("Type") {
                    typePicker
                }
                
                Section("Time Interval") {
                    timeInterval
                }
                
                Section("Days Performed") {
                    daysPerformedStepper
                }
            }
            .navigationTitle(habit.title)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel", role: .cancel) { }
                }
               
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        viewModel.replace(habit)
                    }
                }
            }
        }
    }
    
    var daysPerformedStepper: some View {
        Stepper(habit.daysCompletedInString, value: $habit.daysCompleted, in: 0...360, step: 1)
            .onSubmit {
                viewModel.changeDays(habit.daysCompleted, of: habit)
            }
    }
    
    var habitTitle: some View {
        TextEditor(text: $habit.title)
            .onSubmit {
                viewModel.changeTitle(habit.title, of: habit)
            }
    }
    
    var habitDesc: some View {
        TextEditor(text: $habit.description)
            .onSubmit {
                viewModel.changeDescription(habit.description, of: habit)
            }
    }
    
    var typePicker: some View {
        Picker("Type of Habit", selection: $habit.habitType) {
            ForEach(HabitType.allCases) { Text($0.rawValue.capitalized) }
        }
        .onSubmit {
            viewModel.changeType(of: habit, to: habit.habitType)
        }
    }
    
    var timeInterval: some View {
        Stepper("\(habit.timePerformed, format: .number) mins", value: $habit.timePerformed, in: 0...360, step: 15)
            .onSubmit {
                viewModel.changeTimePerformed(habit.timePerformed, of: habit)
            }
    }
}

struct EditHabitView_Previews: PreviewProvider {
    static var previews: some View {
        let dummyHabits = Habits()
        
        let coding = Habit(habitType: .coding, description: "I like coding!", timePerformed: 0, title: "Coding", daysCompleted: 0)
        let gym = Habit(habitType: .exercise, description: "", timePerformed: 30, title: "Gymming", daysCompleted: 30)
        let drawing = Habit(habitType: .drawing, description: "", timePerformed: 10, title: "Drawing", daysCompleted: 15)
        let instrument = Habit(habitType: .instrument, description: "I like playing the guitar a lot!", timePerformed: 60, title: "Playing the Guitar", daysCompleted: 600)
        
        dummyHabits.add([coding, gym, instrument, drawing])
        
        return EditHabitView(habit: dummyHabits.habits[0])
            .environmentObject(dummyHabits)
    }
}
