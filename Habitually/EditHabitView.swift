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
    @Environment(\.dismiss) var dismiss
    
    @State private var desc = ""
    
    var body: some View {
        NavigationView {
            Form {
                titleSection
                
                descSection
                
                typeSection
                
                timeSection
                
                daysSection
            }
            .navigationTitle(habit.title)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) { cancel }
               
                ToolbarItem(placement: .confirmationAction) { save }
            }
        }
    }
    
    private var cancel: some View {
        Button("Cancel", role: .cancel) {
            dismiss()
        }
    }
    
    private var save: some View {
        Button("Save") {
            viewModel.replace(habit)
            dismiss()
        }
    }
    
    private var daysPerformedStepper: some View {
        Stepper(habit.daysCompletedInString, value: $habit.daysCompleted, in: 0...360, step: 1)
            .onSubmit {
                viewModel.changeDays(habit.daysCompleted, of: habit)
            }
    }
    
    private var daysSection: some View {
        Section("Days Performed") { daysPerformedStepper }
    }
    
    private var habitTitle: some View {
        TextEditor(text: $habit.title)
            .onSubmit {
                viewModel.changeTitle(habit.title, of: habit)
            }
    }
    
    private var titleSection: some View {
        Section("Title") { habitTitle }
    }
    
    private var habitDesc: some View {
        TextEditor(text: $habit.description)
            .onSubmit {
                viewModel.changeDescription(habit.description, of: habit)
            }
    }
    
    private var descSection: some View {
        Section("Description") { habitDesc }
    }
    
    private var typePicker: some View {
        Picker("Type of Habit", selection: $habit.habitType) {
            ForEach(HabitType.allCases) { Text($0.rawValue.capitalized) }
        }
        .onSubmit {
            viewModel.changeType(of: habit, to: habit.habitType)
        }
    }
    
    private var typeSection: some View {
        Section("Type") { typePicker }
    }
    
    private var timeInterval: some View {
        Stepper("\(habit.timePerformed, format: .number) mins", value: $habit.timePerformed, in: 0...360, step: 15)
            .onSubmit {
                viewModel.changeTimePerformed(habit.timePerformed, of: habit)
            }
    }
    
    private var timeSection: some View {
        Section("Time Interval") { timeInterval }
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
